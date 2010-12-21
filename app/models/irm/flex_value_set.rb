class Irm::FlexValueSet < ActiveRecord::Base
  set_table_name :irm_flex_value_sets

  # 菜单子项
  has_many :flex_values,:foreign_key=>"flex_value_set_id",:primary_key=>"id"

  # 验证权限编码唯一性
  validates_presence_of :flex_value_set_name
  validates_uniqueness_of :flex_value_set_name, :if => Proc.new { |i| !i.flex_value_set_name.blank? }

  #加入activerecord的通用方法和scope
  query_extend
end
