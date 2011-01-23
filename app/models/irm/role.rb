class Irm::Role < ActiveRecord::Base
  set_table_name :irm_roles

  #多语言关系
  attr_accessor :name,:description
  has_many :roles_tls,:dependent => :destroy
  acts_as_multilingual

  # 验证权限编码唯一性
  validates_presence_of :role_code
  validates_uniqueness_of :role_code, :if => Proc.new { |i| !i.permission_code.blank? }
  validates_format_of :role_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.permission_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  #查找权限列表
  scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::RolesTl.table_name}.name name, #{Irm::RolesTl.table_name}.description description, #{Irm::MenusTl.table_name}.name menu_name").
    joins("LEFT OUTER JOIN #{Irm::Menu.table_name} m ON m.menu_code = #{table_name}.menu_code").
    joins("LEFT OUTER JOIN #{Irm::MenusTl.table_name} mt ON mt.language = '#{I18n.locale}' AND mt.menu_id = m.menu_id ")
    joins(",#{Irm::RolesTl.table_name}").
    where("#{Irm::RolesTl.table_name}.role_id = #{table_name}.id").
    where("#{Irm::RolesTl.table_name}.language = ?", I18n.locale)
  }


end
