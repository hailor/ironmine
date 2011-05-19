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
      join_object_attribute(query_str,oa)
    end

    generate_scope_str(query_str,execute)

  end
  # 根据传入的属性字段，生成查询SQL
  def generate_query_by_attributes(oas=[],execute=false,mini_column=false)
    return generate_query(execute) unless oas.any?

    query_str = {:select=>[],:joins=>[],:where=>[],:order=>[]}
    select_attributes = []
    join_attributes = []
    join_table_names = []
    self.object_attributes.each do |soa|
      # filter column or need to return column
      if(soa.filter_flag.eql?(Irm::Constant::SYS_YES)||oas.include?(soa.attribute_name.to_sym))
        select_attributes << soa
        join_table_names << soa.relation_table_alias_name if soa.attribute_type.eql?("RELATION_COLUMN")
      end
    end

    self.object_attributes.each do |soa|
      if soa.attribute_type.eql?("RELATION_COLUMN")&&join_table_names.include?(soa.relation_table_alias_name)&&soa.exists_relation_flag.eql?(Irm::Constant::SYS_NO)
        join_attributes << soa
      end
    end if join_table_names.any?
    # mini column mode
    query_str[:select]<< "#{self.bo_table_name}.*" unless mini_column
    select_attributes.each do |sa|
      if mini_column&&sa.attribute_type.eql?("TABLE_COLUMN")
        query_str[:select] << %(#{self.bo_table_name}.#{sa.attribute_name})
      end

      if sa.attribute_type.eql?("RELATION_COLUMN")
        query_str[:select] << %(#{sa.relation_table_alias_name}.#{sa.relation_column} #{sa.attribute_name})
      end
    end

    join_attributes.each do |ja|
      join_object_attribute(query_str,ja)
    end

    generate_scope_str(query_str,execute)

  end
  # For LOV 根据传入的属性字段（Hash），生成查询SQL
  def generate_query_by_hash_attributes(oas,execute = false)
    return generate_query(execute) unless oas.any?&&oas.is_a?(Hash)
    query_str = {:select=>[],:joins=>[],:where=>[],:order=>[]}
    select_attributes = []
    join_attributes = []
    join_table_names = []
    self.object_attributes.each do |soa|
      if(oas.keys.include?(soa.attribute_name))
        select_attributes << soa
        join_table_names << soa.relation_table_alias_name if soa.attribute_type.eql?("RELATION_COLUMN")
      end
    end

    self.object_attributes.each do |soa|
      if soa.attribute_type.eql?("RELATION_COLUMN")&&join_table_names.include?(soa.relation_table_alias_name)&&soa.exists_relation_flag.eql?(Irm::Constant::SYS_NO)
        join_attributes << soa
      end
    end if join_table_names.any?

    select_attributes.each do |sa|
      if sa.attribute_type.eql?("TABLE_COLUMN")
        query_str[:select] << %(#{self.bo_table_name}.#{sa.attribute_name} #{oas[sa.attribute_name]})
      end

      if sa.attribute_type.eql?("RELATION_COLUMN")
        query_str[:select] << %(#{sa.relation_table_alias_name}.#{sa.relation_column} #{oas[sa.attribute_name]})
      end
    end

    join_attributes.each do |ja|
      join_object_attribute(query_str,ja)
    end

    generate_scope_str(query_str,execute)

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
  #process join attribute
  def join_object_attribute(query_str,join_attribute)
    if join_attribute.exists_relation_flag.eql?(Irm::Constant::SYS_NO)
      relation_bo = self.class.find_by_business_object_code(join_attribute.relation_bo_code)
      where_clause_str = join_attribute.where_clause

      # parse params in where clause
      if %r{\{\{.*\}\}}.match(join_attribute.where_clause)
        where_clause_template = Liquid::Template.parse join_attribute.where_clause
        where_clause_str = where_clause_template.render({"table"=>join_attribute.relation_table_alias_name,"master_table"=>self.bo_table_name})
      end
      where_clause_str.strip!
      # process multilingual
      if relation_bo.multilingual_flag.eql?(Irm::Constant::SYS_YES)
        where_clause_str << " AND "if(where_clause_str).length > 0
        if self.multilingual_flag.eql?(relation_bo.multilingual_flag)
          where_clause_str << " #{join_attribute.relation_table_alias_name}.language = #{self.bo_table_name}.language"
        else
          where_clause_str << " #{join_attribute.relation_table_alias_name}.language = '{{env.language}}'"
        end
      end
      query_str[:joins] << "LEFT OUTER JOIN #{relation_bo.bo_table_name} #{join_attribute.relation_table_alias_name} ON #{where_clause_str}"
    end
  end
  # generate scope string by query hash
  def generate_scope_str(query_str,execute)
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

  def self.attribute_of(bo,attribute_name)
    value = nil
    value = bo.send(attribute_name.to_sym) if bo.respond_to?(attribute_name.to_sym)
    unless value
      value = bo.attributes[attribute_name.to_sym]
    end
    value
  end
end
