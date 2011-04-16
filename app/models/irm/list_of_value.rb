class Irm::ListOfValue < ActiveRecord::Base
  set_table_name :irm_list_of_values

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

  def bo_attributes
    bo_oas = []
    bo_oas << id_column
    bo_oas << value_column
    bo_oas << desc_column
    bo_oas << addition_column.split("#")
    bo_oas.flatten
  end
end
