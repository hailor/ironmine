class Irm::BusinessObject < ActiveRecord::Base
  set_table_name :irm_business_objects

  has_many :object_attributes,:foreign_key=>:business_object_code,:primary_key=>:business_object_code,:dependent => :destroy

  #多语言关系
  attr_accessor :name,:description
  has_many :business_objects_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :business_object_code,:bo_table_name,:bo_model_name,:auto_generate_flag
  validates_uniqueness_of :business_object_code, :if => Proc.new { |i| !i.business_object_code.blank? }
  validates_uniqueness_of :bo_table_name,:scope => [:bo_model_name,:auto_generate_flag], :if => Proc.new { |i| !i.auto_generate_flag.eql?(Irm::Constant::SYS_YES) }
  validates_format_of :business_object_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.business_object_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  # generate business object
  def generate_query(execute=false)
    query_str = {:select=>[],:joins=>[],:where=>[],:order=>[]}
    query_str[:select]<< "#{self.bo_table_name}.*"
    self.object_attributes.where(:attribute_type=>"RELATION_COLUMN").each do |oa|
      relation_bo = self.class.find_by_business_object_code(oa.relation_bo_code)
      query_str[:select]<<"#{oa.relation_table_alias_name}.#{oa.relation_column} #{oa.attribute_name}"
      if oa.exists_relation_flag.eql?(Irm::Constant::SYS_NO)
        where_clause_str = oa.where_clause

        # parse params in where clause
        if %r{\{\{.*\}\}}.match(oa.where_clause)
          where_clause_template = Liquid::Template.parse oa.where_clause
          where_clause_str = where_clause_template.render({"table"=>oa.relation_table_alias_name,"master_table"=>self.bo_table_name})
        end
        where_clause_str.strip!
        # process multilingual
        if relation_bo.multilingual_flag.eql?(Irm::Constant::SYS_YES)
          where_clause_str << " AND "if(where_clause_str).length > 0
          if self.multilingual_flag.eql?(relation_bo.multilingual_flag)
            where_clause_str << " #{oa.relation_table_alias_name}.language = #{self.bo_table_name}.language"
          else
            where_clause_str << " #{oa.relation_table_alias_name}.language = '{{env.language}}'"
          end
        end
        query_str[:joins] << "LEFT OUTER JOIN #{relation_bo.bo_table_name} #{oa.relation_table_alias_name} ON #{where_clause_str}"
      end
    end
    if self.multilingual_flag.eql?(Irm::Constant::SYS_YES)
      query_str[:where] << "#{self.bo_table_name}.language = '{{env.language}}'"
    end


    model_query = %(#{self.bo_model_name}.select("#{query_str[:select].join(",")}"))
    model_query<< %(.from("#{self.bo_table_name}")) if self.multilingual_flag.eql?(Irm::Constant::SYS_YES)
    query_str[:joins].each do |j|
      model_query << %(.joins("#{j}"))
    end
    query_str[:where].each do |w|
      model_query << %(.where("#{w}"))
    end
    if (execute&&%r{\{\{.*\}\}}.match(model_query))
      env = Irm::Person.env.dup
      recursive_stringify_keys(env)
      model_query_template = Liquid::Template.parse model_query
      model_query = model_query_template.render(env)
    end
    model_query
  end
  private
  def recursive_stringify_keys(hash)
    return unless hash.is_a?(Hash)
    hash.values.each do |v|
      next unless v.is_a?(Hash)
      recursive_stringify_keys(v)
    end
    hash.stringify_keys!
  end
end
