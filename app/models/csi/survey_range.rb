class Csi::SurveyRange < ActiveRecord::Base
  set_table_name :csi_survey_ranges

  query_extend
  belongs_to :survey

  scope :query_by_survey_id,lambda{|survey_id| where(:survey_id=>survey_id)}

  scope :query_wrap_info,lambda{|language| select("#{table_name}.*,v1.meaning status_meaning,v2.meaning range_type_meaning").
                                                   joins(",irm_lookup_values_vl v1").
                                                   joins(",irm_lookup_values_vl v2").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v2.lookup_type='CSI_SURVEY_RANGE_TYPE' AND v2.lookup_code = #{table_name}.range_type AND "+
                                                         "v1.language=? AND v2.language = ?",language,language)}


  scope :query_status_meaning,lambda{|language| select("#{table_name}.*,v1.meaning status_meaning").
                                                   joins("inner join irm_lookup_values_vl v1").
                                                   where("v1.lookup_type='SYSTEM_STATUS_CODE' AND v1.lookup_code = #{table_name}.status_code AND "+
                                                         "v1.language=? ",language)}

  scope :query_range_meaning,lambda{|language| select("v2.meaning range_type_meaning").
                                                   joins("inner join irm_lookup_values_vl v2").
                                                   where("v2.lookup_type='CSI_SURVEY_RANGE_TYPE' AND v2.lookup_code = #{table_name}.range_type AND "+
                                                         "v2.language=? ",language)}


  scope :query_all_info,select("v3.name company_name,v4.name organization_name, v5.name department_name,v6.name role_name,v7.name site_name").
                        joins("left outer join irm_companies_vl v3 ON v3.id = #{table_name}.range_company_id AND v3.language = v1.language").
                        joins("left outer join irm_organizations_vl v4 ON v4.id = #{table_name}.range_organization_id AND v4.language = v1.language").
                        joins("left outer join irm_departments_vl v5 ON v5.id = #{table_name}.range_department_id and v5.language = v1.language").
                        joins("left outer join irm_roles_vl v6 ON v6.id = #{table_name}.role_id AND v6.language = v1.language").
                        joins("left outer join irm_sites_vl v7 ON v7.id = #{table_name}.site_id AND v7.language = v1.language")

  def self.query_range_person_count(survey_id)
    ranges = Csi::SurveyRange.query_by_survey_id(survey_id)
    people = []
    ranges.each do |r|
      if r.range_type == "ORGANIZATION"
        if !r.range_department_id.blank?
          people << Irm::Person.where("department_id = ?", r.range_department_id)
        elsif !r.range_organization_id.blank?
          people << Irm::Person.where("organization_id = ?", r.range_organization_id)
        elsif !r.range_company_id.blank?
          people << Irm::Person.where("company_id = ?", r.range_company_id)
        end
      elsif r.range_type == "ROLE"
        t = Irm::Role.where("id = ?", r.role_id).first
        people << t.people if t
      elsif r.range_type == "SITE"
        Irm::Location.where("department_id IS NULL").where("organization_id IS NULL").each do |loc|
          people << Irm::Person.where("company_id = ?", loc.company_id)
        end
      end
    end
    people = people.uniq
    people.size
  end


  def person_ids
    person_ids = []
    if self.range_type == "ORGANIZATION"
      if self.range_department_id.present?
        person_ids << Irm::Person.enabled.select("id").where("department_id = ?", self.range_department_id).collect{|i| i.id}
      elsif self.range_organization_id.present?
        person_ids << Irm::Person.enabled.select("id").where("organization_id = ?", self.range_organization_id).collect{|i| i.id}
      elsif self.range_company_id.present?
        person_ids << Irm::Person.enabled.select("id").where("company_id = ?", self.range_company_id).collect{|i| i.id}
      end
    elsif self.range_type == "ROLE"&&self.role_id.present?
      person_ids << Irm::PersonRole.select("person_id").where(:role_id=>self.role_id).collect{|i| i.person_id}
    #elsif self.range_type == "SITE"
    #  Irm::Location.where("department_id IS NULL").where("organization_id IS NULL").each do |loc|
    #    people << Irm::Person.where("company_id = ?", loc.company_id)
    #  end
    end
    person_ids.flatten!
    person_ids.uniq!
    person_ids
  end

  acts_as_recently_objects(:title => "title",
                           :target_controller => "csi/surveys",
                           :target => "survey")
end
