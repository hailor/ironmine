class Irm::Permission < ActiveRecord::Base
  set_table_name :irm_permissions

  #多语言关系
  attr_accessor :name,:description
  has_many :permissions_tls,:dependent => :destroy
  acts_as_multilingual
  
  has_many :function_members
  has_many :functions, :through => :function_members

  # 验证权限编码唯一性
  validates_presence_of :permission_code,:page_controller,:page_action
  validates_uniqueness_of :permission_code, :if => Proc.new { |i| !i.permission_code.blank? }
  validates_format_of :permission_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.permission_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  before_validation :set_product_id

  scope :query_by_page_controller,lambda{|page_controller| where("page_controller=?",page_controller)}
  scope :query_by_page_action,lambda{|page_action| where("page_action=?",page_action)}
  scope :query_by_permission_code,lambda{|permission_code| where("permission_code=?",permission_code)}

  #通过controller,action确定permission
  scope :position,lambda {|controller,action| where("page_controller = ? AND page_action = ?", controller,action) }
  scope :belong_to_function, lambda{|function_code|
    joins(",#{Irm::FunctionMember.table_name}").
    where("#{Irm::FunctionMember.table_name}.function_code = ?", function_code).
    where("#{Irm::FunctionMember.table_name}.permission_code = #{table_name}.permission_code")
  }
  scope :query_by_permission_name, lambda {|name| where("#{Irm::PermissionsTl.table_name}.name LIKE '%#{name}%'")}
  #查找人员的权限
  scope :query_by_person,lambda{|person_id|
    joins("LEFT OUTER JOIN #{Irm::FunctionMember.table_name} ON #{Irm::FunctionMember.table_name}.permission_code = #{table_name}.permission_code").
    joins("LEFT OUTER JOIN #{Irm::FunctionGroupMember.table_name} ON #{Irm::FunctionGroupMember.table_name}.function_code = #{Irm::FunctionMember.table_name}.function_code").
    joins("LEFT OUTER JOIN #{Irm::Person.table_name} ON #{Irm::Person.table_name}.function_group_code = #{Irm::FunctionGroupMember.table_name}.group_code").
    where("#{Irm::Person.table_name}.id = ?",person_id)
  }
  # 登陆即可访问的权限
  scope :logined,lambda{
    joins("LEFT OUTER JOIN #{Irm::FunctionMember.table_name} ON #{Irm::FunctionMember.table_name}.permission_code = #{table_name}.permission_code").
    where("#{Irm::FunctionMember.table_name}.function_code = 'LOGINED_FUNCTION'")
  }

  # 无需登陆即可访问的权限
  scope :publiced,lambda{
    joins("LEFT OUTER JOIN #{Irm::FunctionMember.table_name} ON #{Irm::FunctionMember.table_name}.permission_code = #{table_name}.permission_code").
    where("#{Irm::FunctionMember.table_name}.function_code = 'PUBLIC_FUNCTION'")
  }  

  #查找权限列表
  scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::PermissionsTl.table_name}.name name, #{Irm::PermissionsTl.table_name}.description description, #{Irm::ProductModulesTl.table_name}.name product_module_name").
    joins(",#{Irm::PermissionsTl.table_name}, #{Irm::ProductModulesTl.table_name}").
    where("#{Irm::PermissionsTl.table_name}.permission_id = #{table_name}.id").
    where("#{Irm::PermissionsTl.table_name}.language = ?", I18n.locale).
    where("#{Irm::ProductModulesTl.table_name}.language = ?", I18n.locale).
    where("#{Irm::ProductModulesTl.table_name}.product_id = #{table_name}.product_id")
  }

  scope :without_function, lambda{|function_code|
    where("#{table_name}.permission_code NOT IN (SELECT t.permission_code FROM #{Irm::FunctionMember.table_name} t WHERE t.permission_code = #{table_name}.permission_code AND t.function_code = ?)", function_code)
  }
  def set_product_id
    product_code = self.page_controller.gsub(/\/.*/, "")
    product = Irm::ProductModule.query_by_short_name(product_code.upcase).first
    self.product_id = product.id if product
  end

  # 判断是否为公开权限
  # //TODO 使用缓存
  def publiced?
    self.class.publiced.collect{|p| p.permission_code}.include?(self.permission_code)
  end


  # 判断是否登录即可访问的权限
  # //TODO 使用缓存
  def logined?
    self.class.logined.collect{|p| p.permission_code}.include?(self.permission_code)
  end

  def self.url_key(controller,action)
    "#{controller.gsub(/\//, "_")}_#{action}"
  end

  def self.page_help_url(controller,action)
    "#{controller.gsub(/.*\//, "")}_#{action}"
  end

  def self.to_permission(options={})
    crop(options)
    Irm::Permission.new(options)
  end

end
