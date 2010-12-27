class Irm::FlexValue < ActiveRecord::Base
  set_table_name :irm_flex_values

  #多语言关系
  attr_accessor :flex_value_meaning,:description
  has_many :flex_values_tls,:dependent => :destroy
  acts_as_multilingual(:columns => [:flex_value_meaning, :description])

  belongs_to :flex_value_set,:foreign_key=>"flex_value_set_id",:primary_key => "id"
  
  # 验证权限编码唯一性
  validates_presence_of :flex_value

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_value_set_name,lambda{|flex_value_set_name|
    select("#{table_name}.*").
    joins(",#{Irm::FlexValueSet.table_name}").
    where("#{Irm::FlexValueSet.table_name}.id = #{table_name}.flex_value_set_id").
    where("#{Irm::FlexValueSet.table_name}.flex_value_set_name = ?", flex_value_set_name)}
  
  scope :query_by_id, lambda{|id| where(:id => id)}
  
  def self.check_flex_value_exist(id)
    if Irm::FlexValue.query_by_id(id).size > 0
      true
    else
      false
    end
  end
end


