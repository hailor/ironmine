class Irm::Role < ActiveRecord::Base
  set_table_name :irm_roles

  #多语言关系
  attr_accessor :name,:description
  has_many :roles_tls,:dependent => :destroy
  acts_as_multilingual

  has_many :person_roles
  has_many :people, :through => :person_roles

  has_many :role_functions
  has_many :functions,:through => :role_functions
  
  # 验证权限编码唯一性
  validates_presence_of :role_code
  validates_uniqueness_of :role_code, :if => Proc.new { |i| !i.role_code.blank? }
  validates_format_of :role_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.role_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  #查找权限列表
  scope :list_all, lambda{select("#{table_name}.*, #{Irm::RolesTl.table_name}.name name, #{Irm::RolesTl.table_name}.description description, mt.name menu_name").
    joins("LEFT OUTER JOIN #{Irm::Menu.table_name} m ON m.menu_code = #{table_name}.menu_code").
    joins("LEFT OUTER JOIN #{Irm::MenusTl.table_name} mt ON mt.language = '#{I18n.locale}' AND mt.menu_id = m.id ").
    joins(",#{Irm::RolesTl.table_name}").
    where("#{Irm::RolesTl.table_name}.role_id = #{table_name}.id").
    where("#{Irm::RolesTl.table_name}.language = ?", I18n.locale)}
  
  scope :without_person, lambda{|person_id|
    where("#{table_name}.id NOT IN (SELECT t.role_id FROM #{Irm::PersonRole.table_name} t WHERE t.role_id = #{table_name}.id AND t.person_id = ?)", person_id)
  }

  scope :belongs_to_person, lambda{|person_id|
    joins(",#{Irm::PersonRole.table_name}").
    where("#{Irm::PersonRole.table_name}.person_id = ?", person_id).
    where("#{Irm::PersonRole.table_name}.role_id = #{table_name}.id")
  }

  scope :query_by_role_name, lambda {|name| where("#{Irm::RolesTl.table_name}.name LIKE '%#{name}%'")}

  scope :query_by_role_code, lambda {|role_code| where(:role_code=>role_code)}


  scope :assignable,lambda{
    where("#{table_name}.role_type = ? OR #{table_name}.role_type = ?","SETTING","BUSSINESS")
  }

  scope :query_by_permission,lambda{|controller,action|
    joins("JOIN #{Irm::RoleFunction.table_name} ON #{Irm::RoleFunction.table_name}.role_id = #{table_name}.id").
    joins("JOIN #{Irm::Function.table_name} ON #{Irm::Function.table_name}.id = #{Irm::RoleFunction.table_name}.function_id").
    joins("JOIN #{Irm::Permission.table_name}").
    where("#{Irm::Function.table_name}.function_code = #{Irm::Permission.table_name}.function_code AND #{Irm::Permission.table_name}.page_controller = ? AND #{Irm::Permission.table_name}.page_action = ?",controller,action)
  }

  scope :query_by_person,lambda{|person_id|
    joins("JOIN #{Irm::PersonRole.table_name} ON #{Irm::PersonRole.table_name}.role_id = #{table_name}.id").
    joins("JOIN #{Irm::Person.table_name}").
    where("#{Irm::Person.table_name}.id = ?",person_id)
  }

  def self.current
    @current_role
  end

  def self.current=(role)
    @current_role = role
  end

  def allowed_to?(function_codes)
    @functions ||=functions.collect{|f| f.function_code}
    return true if function_codes.detect{|fc| @functions.include?(fc)}
    false
  end

end
