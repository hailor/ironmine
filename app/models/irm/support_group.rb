class Irm::SupportGroup < ActiveRecord::Base
  set_table_name :irm_support_groups

  #多语言关系
  attr_accessor :name,:description
  has_many :support_groups_tls,:dependent => :destroy
  acts_as_multilingual

  validates_presence_of :group_code
  validates_uniqueness_of :group_code, :if => Proc.new { |i| !i.group_code.blank? }
  validates_format_of :group_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.group_code.blank?}

  #加入activerecord的通用方法和scope
  query_extend

  scope :query_by_group_code,lambda{|group_code| where(:group_code=>group_code)}


  scope :query_by_company,lambda{|language,company_id| select("#{table_name}.id,#{Irm::SupportGroupsTl.table_name}.name,#{Irm::SupportGroupsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? AND #{table_name}.company_id=?",language,company_id)}

  #company_id
  scope :query_wrap_info,lambda{|language| select("#{table_name}.id,#{Irm::SupportGroupsTl.table_name}.name,#{Irm::SupportGroupsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning,v2.name company_name,v3.name organization_name,"+
                                                          "v4.meaning support_role_name,#{table_name}.vendor_group_flag,#{table_name}.oncall_group_flag").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_organizations_vl v3").
                                                   joins(",irm_lookup_values_vl v4").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v4.lookup_type='IRM_SUPPORT_ROLE' AND v4.lookup_code = #{table_name}.support_role_code AND "+
                                                         "#{table_name}.company_id = v2.id AND v2.language=? AND "+
                                                         "#{table_name}.organization_id = v3.id AND v3.language=? AND "+
                                                         "v1.language=? AND v4.language=?",
                                                         language,language,language,language)}

  scope :not_include_person,lambda{|person_id|
    where("NOT EXISTS(SELECT 1 FROM #{Irm::SupportGroupMember.table_name} sgm WHERE sgm.person_id =? AND support_group_code = #{table_name}.group_code)",person_id)
  }

  scope :with_company,lambda{|language|
    joins("JOIN #{Irm::Company.view_name} ON #{Irm::Company.view_name}.id = #{table_name}.company_id").
    select("#{Irm::Company.view_name}.name company_name").
    where("#{Irm::Company.view_name}.language = ?",language)
  }
end
