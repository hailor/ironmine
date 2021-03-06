class Irm::Menu < ActiveRecord::Base
  set_table_name :irm_menus



  #多语言关系
  attr_accessor :name,:description
  has_many :menus_tls,:dependent => :destroy
  acts_as_multilingual

  # 菜单子项
  has_many :menu_entries,:foreign_key=>"menu_code",:primary_key=>"menu_code"

  # 验证权限编码唯一性
  validates_presence_of :menu_code
  validates_uniqueness_of :menu_code, :if => Proc.new { |i| !i.menu_code.blank? }
  validates_format_of :menu_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.menu_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :top_menu,lambda{
    where("NOT EXISTS(SELECT 1 FROM #{Irm::MenuEntry.table_name} WHERE #{Irm::MenuEntry.table_name}.sub_menu_code = #{table_name}.menu_code)")
  }

end
