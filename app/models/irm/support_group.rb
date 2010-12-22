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

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,#{Irm::SupportGroupsTl.table_name}.name,#{Irm::SupportGroupsTl.table_name}.description,"+
                                                          "v1.meaning status_meaning,v2.name company_name,v3.name organization_name,"+
                                                          "v4.meaning support_role_name,v5.meaning vendor_group_flag, v6.meaning oncall_group_flag").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_organizations_vl v3").
                                                   joins(",irm_lookup_values_vl v4").
                                                   joins(",irm_lookup_values_vl v5").
                                                   joins(",irm_lookup_values_vl v6").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v4.lookup_type='IRM_SUPPORT_ROLE' AND v4.lookup_code = #{table_name}.support_role_code AND "+
                                                         "v5.lookup_type='SYSTEM_YES_NO' AND v5.lookup_code = #{table_name}.vendor_group_flag AND "+
                                                         "v6.lookup_type='SYSTEM_YES_NO' AND v6.lookup_code = #{table_name}.oncall_group_flag AND "+
                                                         "#{table_name}.company_id = v2.id AND v2.language=? AND "+
                                                         "#{table_name}.organization_id = v3.id AND v3.language=? AND "+
                                                         "v1.language=? AND v4.language=? AND v5.language=? AND v6.language=?",
                                                         language,language,language,language,language,language)}
end
