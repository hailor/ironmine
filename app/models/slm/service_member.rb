class Slm::ServiceMember < ActiveRecord::Base
  set_table_name :slm_service_members
  query_extend


  scope :query_wrap_info,lambda{|language| select("v1.meaning status_meaning, v2.name service_company_name,CONCAT(ip1.last_name,ip1.first_name) service_person_name," +
                                                  "CONCAT(ip2.last_name,ip2.first_name) service_contract_name," +
                                                  "iov.name service_organization_name,idv.name service_department_name" ).
                                                   joins("left outer join irm_organizations_vl iov on #{table_name}.service_organization_id=iov.id AND iov.language = v2.language").
                                                   joins("left outer join irm_departments_vl idv on #{table_name}.service_department_id=idv.id AND idv.language = v2.language").
                                                   joins("left outer join irm_people ip1 on #{table_name}.service_person_id=ip1.id").
                                                   joins("left outer join irm_people ip2 on #{table_name}.service_contract_id=ip2.id").
                                                   joins("INNER JOIN irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=?",language)}

  scope :query_by_company_id,lambda{|language| joins("inner join irm_companies_vl v2").
                                               where("v2.id=#{table_name}.service_company_id AND "+
                                                     "v2.language=?",language)}

end