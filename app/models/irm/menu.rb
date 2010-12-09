class Irm::Menu < ActiveRecord::Base
  set_table_name :irm_menus



  #多语言关系
  attr_accessor :name,:description
  has_many :menus_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证权限编码唯一性
  validates_presence_of :menu_code
  validates_uniqueness_of :menu_code, :if => Proc.new { |i| !i.menu_code.blank? }
  validates_format_of :menu_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.menu_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

end
