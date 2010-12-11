class Irm::Function < ActiveRecord::Base
  set_table_name :irm_functions

  #多语言关系
  attr_accessor :name,:description
  has_many :functions_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证编码唯一性
  validates_presence_of :function_code
  validates_uniqueness_of :function_code, :if => Proc.new { |i| !i.function_code.blank? }
  validates_format_of :function_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.function_code.blank?}

  # 菜单子项
  has_many :function_members,:foreign_key=>"function_code",:primary_key=>"function_code"
  has_many :permissions, :through => :function_members
end
