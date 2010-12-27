class Irm::SupportGroupMember < ActiveRecord::Base
  set_table_name :irm_support_group_members

  scope :query_wrap_info,lambda{|language,support_group_code| select("#{table_name}.id,v2.name company_name,CONCAT(t3.last_name,t3.first_name) person_name,v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   joins(",irm_people t3").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "#{table_name}.support_group_code = ? AND #{table_name}.person_id = t3.id AND "+
                                                         "v1.language=?",support_group_code,language)}

end