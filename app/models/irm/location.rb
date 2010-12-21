class Irm::Location < ActiveRecord::Base
   set_table_name :irm_locations

   scope :query_site_info,lambda{|language,company_id| select("#{table_name}.*,v1.meaning status_meaning,v2.name organization_name,v3.name department_name,"+
                                                              "v4.name site_group_name,v5.name site_name").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_organizations_vl v2").
                                                   joins(",irm_departments_vl v3").
                                                   joins(",irm_site_groups_vl v4").
                                                   joins(",irm_sites_vl v5").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "#{table_name}.organization_id = v2.id AND "+
                                                         "#{table_name}.department_id = v3.id AND "+
                                                         "#{table_name}.site_group_code = v4.group_code AND "+
                                                         "#{table_name}.site_code = v5.site_code AND "+
                                                         "v1.language=? AND v2.language=? AND v3.language=? AND "+
                                                         "v4.language=? AND v5.language=? AND #{table_name}.company_id=?",language,language,language,language,language,company_id) }
end