class Irm::MenuEntry < ActiveRecord::Base
  set_table_name :irm_menu_entries

  #多语言关系
  attr_accessor :name,:description
  has_many :menu_entries_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证权限编码唯一性
  validates_presence_of :menu_code
  validates_presence_of :sub_menu_code, :if => Proc.new { |i| i.permission_code.blank? }
  validates_presence_of :permission_code, :if => Proc.new { |i| i.sub_menu_code.blank? }
end
