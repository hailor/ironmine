class Irm::Function < ActiveRecord::Base
  set_table_name :irm_functions

  #多语言关系
  attr_accessor :name,:description
  has_many :functions_tls,:dependent => :destroy
  acts_as_multilingual

  query_extend
  # 验证编码唯一性
  validates_presence_of :function_code
  validates_uniqueness_of :function_code, :if => Proc.new { |i| !i.function_code.blank? }
  validates_format_of :function_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.function_code.blank?}

  scope :query_by_function_name, lambda {|name| where("#{Irm::FunctionsTl.table_name}.name LIKE '%#{name}%'")}
  scope :belong_to_group, lambda{|group_code|
    joins(",#{Irm::FunctionGroupMember.table_name}").
    where("#{Irm::FunctionGroupMember.table_name}.group_code = ?", group_code).
    where("#{Irm::FunctionGroupMember.table_name}.function_code = #{table_name}.function_code")
  }

  scope :without_group, lambda{|group_code|
    where("#{table_name}.function_code NOT IN (SELECT t.function_code FROM #{Irm::FunctionGroupMember.table_name} t WHERE t.function_code = #{table_name}.function_code AND t.group_code = ?)", group_code)
  }

  scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::FunctionsTl.table_name}.name name, #{Irm::FunctionsTl.table_name}.description description").
    joins(",#{Irm::FunctionsTl.table_name}").
    where("#{Irm::FunctionsTl.table_name}.function_id = #{table_name}.id").
    where("#{Irm::FunctionsTl.table_name}.language = ?", I18n.locale)
  }

  scope :query_hidden_functions,lambda{|person_id|
    joins("JOIN #{Irm::RoleFunction.table_name} ON #{Irm::RoleFunction.table_name}.function_id = #{table_name}.id").
    joins("JOIN #{Irm::Role.table_name} ON #{Irm::Role.table_name}.id = #{Irm::RoleFunction.table_name}.role_id").
    joins("JOIN #{Irm::PersonRole.table_name} ON #{Irm::PersonRole.table_name}.role_id = #{Irm::Role.table_name}.id").
    where("#{Irm::Role.table_name}.hidden_flag = ? AND #{Irm::PersonRole.table_name}.person_id = ?",Irm::Constant::SYS_YES,person_id)
  }
  
end
