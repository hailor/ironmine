class Irm::FlexValue < ActiveRecord::Base
  set_table_name :irm_flex_values

  #多语言关系
  attr_accessor :name,:description
  has_many :flex_values_tls,:dependent => :destroy
  acts_as_multilingual

  belongs_to :value_set,:foreign_key=>"value_set_code",:primary_key => "value_set_code"
  
  # 验证权限编码唯一性
  validates_presence_of :value_code

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_value_set_code,lambda{|value_set_code|where(:value_set_code => value_set_code)}
  scope :query_by_id, lambda{|id| where(:id => id)}
  def self.check_flex_value_exist(id)
    if Irm::FlexValue.query_by_id(id).size > 0
      true
    else
      false
    end
  end
end


