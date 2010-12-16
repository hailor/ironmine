class Irm::ValueSet < ActiveRecord::Base
  set_table_name :irm_value_sets



  #多语言关系
  attr_accessor :name,:description
  has_many :value_sets_tls,:dependent => :destroy
  acts_as_multilingual

  # 菜单子项
  has_many :flex_values,:foreign_key=>"value_set_code",:primary_key=>"value_set_code"

  # 验证权限编码唯一性
  validates_presence_of :value_set_code
  validates_uniqueness_of :value_set_code, :if => Proc.new { |i| !i.value_set_code.blank? }
  validates_format_of :value_set_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.value_set_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

end
