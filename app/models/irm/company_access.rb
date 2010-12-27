class Irm::CompanyAccess < ActiveRecord::Base
   set_table_name :irm_company_accesses

   scope :query_wrap_info,lambda{|language| select("#{table_name}.id,v2.name company_name,v1.meaning status_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_companies_vl v2").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "#{table_name}.accessable_company_id= v2.id AND v2.language = ? AND " +
                                                         "v1.language=?",language,language)}
end