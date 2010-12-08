class Irm::MenuEntry < ActiveRecord::Base
  set_table_name :irm_menu_entries

  #多语言关系
  attr_accessor :name,:description
  has_many :menu_entries_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证权限编码唯一性
  validates_presence_of :menu_code
#  validates_presence_of :sub_menu_code, :if => Proc.new { |i| i.permission_code.blank? }
#  validates_presence_of :permission_code, :if => Proc.new { |i| i.sub_menu_code.blank? }
  validates_with MenuEntryValidator

  scope :query_by_menu_code,lambda{|menu_code|where(:menu_code => menu_code)}
  scope :query_by_id, lambda{|id| where(:id => id)}
  def self.check_menu_entry_exist(id)
    if Irm::MenuEntry.query_by_id(id).size > 0
      true
    else
      false
    end
  end  
end


