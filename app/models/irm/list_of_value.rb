class Irm::ListOfValue < ActiveRecord::Base
  set_table_name :irm_list_of_values

  belongs_to :business_object,:foreign_key=>:bo_code,:primary_key=>:business_object_code

  #多语言关系
  attr_accessor :name,:description,:value_title,:desc_title,:addition_title
  has_many :list_of_values_tls
  acts_as_multilingual({:columns =>[:name,:description,:value_title,:desc_title,:addition_title],:required=>[:name,:value_title,:desc_title]})

  validates_presence_of :lov_code,:bo_code,:id_column,:value_column
  validates_uniqueness_of :lov_code,:if => Proc.new { |i| !i.lov_code.blank? }
  validates_format_of :lov_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.lov_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend


  scope :with_bo,lambda{|language|
    joins("JOIN #{Irm::BusinessObject.view_name} ON #{Irm::BusinessObject.view_name}.business_object_code = #{table_name}.bo_code AND #{Irm::BusinessObject.view_name}.language ='#{language}'").
    select("#{Irm::BusinessObject.view_name}.name bo_name")
  }



  def generate_scope(options={})
    model_query = self.business_object.generate_query_by_hash_attributes(self.lov_column_hash,true)
    where_clause_str = ""
    # parse params in where clause
    if !self.where_clause.nil?&&!self.where_clause.strip.blank?
      if %r{\{\{.*\}\}}.match(self.where_clause)
        where_clause_template = Liquid::Template.parse self.where_clause
        where_clause_str << %(.where("#{where_clause_template.render({"master_table"=>self.business_object.bo_table_name})}"))
      else
        where_clause_str << %(.where("#{self.where_clause}"))
      end
    end

    if !self.query_clause.nil?&&!self.query_clause.strip.blank?&&options[:desc_value]&&!options[:desc_value].blank?
      if %r{\{\{.*\}\}}.match(self.query_clause)
        query_clause_template = Liquid::Template.parse self.query_clause
        where_clause_str << %(.where("#{query_clause_template.render({"master_table"=>self.business_object.bo_table_name,"query"=>options[:desc_value]})}"))
      else
        where_clause_str << %(.where("#{self.query_clause}"))
      end
    end
    model_query = model_query+where_clause_str
    model_query
  end

  def lov_column_hash
    column_hash = {self.id_column=>"id_value",self.value_column=>"value",self.desc_column=>"desc_value"}
    addition_column.split("#").each do |ac|
      column_hash.merge!({ac=>ac})
    end unless addition_column.strip.blank?||addition_column.nil?
    column_hash
  end

  def lov_columns
    columns = [:id_value,:value,:desc_value]
    addition_column.split("#").each do |ac|
      columns << ac.to_sym
    end unless addition_column.strip.blank?||addition_column.nil?
    columns
  end


end
