class Irm::MenuEntry < ActiveRecord::Base
  set_table_name :irm_menu_entries

  before_create :prepare_page_action

  #多语言关系
  attr_accessor :name,:description
  has_many :menu_entries_tls,:dependent => :destroy
  acts_as_multilingual

  belongs_to :menu,:foreign_key=>"menu_code",:primary_key => "menu_code"
  
  # 验证权限编码唯一性
  validates_presence_of :menu_code
  validates_uniqueness_of :sub_menu_code, :scope => :menu_code, :if => Proc.new { |i| !(i.sub_menu_code.blank?) }
  validates_presence_of :sub_menu_code, :message=>I18n.t(:error_irm_menu_entry_permission_sub_menu_at_least_one), :if => Proc.new { |i| i.page_controller.blank? }
  validates_presence_of :page_controller, :message=>I18n.t(:error_irm_menu_entry_permission_sub_menu_at_least_one),:if => Proc.new { |i| i.sub_menu_code.blank? }

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_menu_code,lambda{|menu_code|where(:menu_code => menu_code)}
  scope :query_by_page_controller,lambda{|page_controller|where(:page_controller => page_controller)}
  scope :query_by_sub_menu_code,lambda{|sub_menu_code|where(:sub_menu_code => sub_menu_code)}


  def self.check_menu_entry_exist(id)
    if Irm::MenuEntry.query_by_id(id).size > 0
      true
    else
      false
    end
  end

  private
  def prepare_page_action
    if !self.page_controller.nil?&&!self.page_controller.blank?&&(self.page_action.nil?||self.page_action.blank?)
      self.page_action="index"
    end
  end
end


