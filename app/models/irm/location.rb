class Irm::Location < ActiveRecord::Base
   set_table_name :irm_locations

   scope :query_site_info,lambda{|language,company_id| select("#{table_name}.*,v1.meaning status_meaning,v2.name organization_name,v3.name department_name,"+
                                                              "v4.name site_group_name,v5.name site_name").
                                                   joins("left outer join irm_organizations_vl v2 on #{table_name}.organization_id = v2.id AND v2.language=v1.language").
                                                   joins("left outer join irm_departments_vl v3 on #{table_name}.department_id = v3.id AND v3.language=v1.language ").
                                                   joins(",irm_site_groups_vl v4").
                                                   joins(",irm_sites_vl v5").
                                                   where("#{table_name}.site_group_code = v4.group_code AND "+
                                                         "#{table_name}.site_code = v5.site_code AND "+
                                                         "v4.language=? AND v5.language=? AND #{table_name}.company_id=?",language,language,company_id) }


   scope :query_by_status_code,lambda{|language| joins("inner join irm_lookup_values_vl v1").
                                               where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                     "v1.language=?",language)}


  def person_ids
    person_ids = []
    if self.range_type == "ORGANIZATION"
      if self.range_department_id.present?
        people << Irm::Person.enabled.select("id").where("department_id = ?", r.range_department_id).collect{|i| i.id}
      elsif self.range_organization_id.present?
        people << Irm::Person.enabled.select("id").where("organization_id = ?", r.range_organization_id).collect{|i| i.id}
      elsif self.range_company_id.present?
        people << Irm::Person.enabled.select("id").where("company_id = ?", r.range_company_id).collect{|i| i.id}
      end
    elsif self.range_type == "ROLE"&&self.role_id.present?
      people << Irm::PersonRole.select("person_id").where(:role_id=>self.role_id).collect{|i| i.person_id}
    elsif self.range_type == "SITE"
      Irm::Location.where("department_id IS NULL").where("organization_id IS NULL").each do |loc|
        people << Irm::Person.where("company_id = ?", loc.company_id)
      end
    end
  end
end