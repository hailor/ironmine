class Irm::FunctionGroup < ActiveRecord::Base
  set_table_name :irm_function_groups

  #多语言关系
  attr_accessor :name,:description
  has_many :function_groups_tls,:dependent => :destroy
  acts_as_multilingual

  query_extend
  # 验证编码唯一性
  validates_presence_of :group_code
  validates_uniqueness_of :group_code, :if => Proc.new { |i| !i.group_code.blank? }
  validates_format_of :group_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.group_code.blank?}

  # 菜单子项
  has_many :function_group_members,:foreign_key=>"group_code",:primary_key=>"group_code"
  has_many :functions, :through => :function_group_members
end
