module Csi
  module Jobs
    class CsiSurveyMemberJob < Struct.new(:survey_range_id)
      def perform
        #调查范围设计的组织维度，角色维度以及地点维度来找到相应的人员
        #从而进行相应的调查范围成员确定。
        #确保每一个调查问卷针对于同一人都只调查一次，根据调查问卷的结果来进行判断
        survey_range = Csi::SurveyRange.query(survey_range_id)

        if survey_range.status_code == "ENABLED"
           process_survey_range(survey_range_id)
        else
        #如果当前的survey_range的状态变为不是enabled的话，将根据所有survey_range
        #进行重算一遍。
          Csi::SurveyMember.update_all("end_date_active= now()", "survey_range_id = #{survey_range_id}")
        end
      end
    private
       def process_survey_range(survey_range_id)
          survey_range = Csi::SurveyRange.query(survey_range_id)
          department_id = survey_range.department_id
          organization_id = survey_range.organization_id
          company_id = survey_range.company_id
          role_id = survey_range.role_id
          site_id = survey_range.site_id
          survey_id = survey_range.survey_id
          if department_id.present?
            department_people = Irm::Person.query_by_department(department_id)
            department_people.each do |t|
              #TODO performance tuning
              if check_survey_member(survey_id,t.id)
                 Csi::SurveyMember.create({:survey_id=>survey_id,
                                           :person_id => t.id,
                                           :survey_range_id =>survey_range_id})
              else
                 Csi::SurveyMember.update_attribute(:survey_range_id,survey_range_id)
              end
            end
          elsif department_id.blank? and organization_id.present?
            organization_people = Irm::Person.query_by_organization(organization_id)
            organization_people.each do |t|
              if check_survey_member(survey_id,t.id)
                 Csi::SurveyMember.create({:survey_id=>survey_id,
                                           :person_id => t.id,
                                           :survey_range_id =>survey_range_id})
              else
                 Csi::SurveyMember.update_attribute(:survey_range_id,survey_range_id)
              end
            end
          elsif department_id.blank? and organization_id.blank? and company_id.present?
            company_people = Irm::Person.query_by_company(company_id)
            company_people.each do |t|
              if check_survey_member(survey_id,t.id)
                 Csi::SurveyMember.create({:survey_id=>survey_id,
                                           :person_id => t.id,
                                           :survey_range_id =>survey_range_id})
              else
                 Csi::SurveyMember.update_attribute(:survey_range_id,survey_range_id)
              end
            end
          elsif role_id.present?
            role_people = Irm::Person.query_role_id(role_id)
            role_people.each do |t|
              if check_survey_member(survey_id,t.id)
                 Csi::SurveyMember.create({:survey_id=>survey_id,
                                           :person_id => t.id,
                                           :survey_range_id =>survey_range_id})
              else
                 Csi::SurveyMember.update_attribute(:survey_range_id,survey_range_id)
              end
            end
          elsif site_id.present?
            site_people = Irm::Person.query_site_id(site_id)
            site_people.each do |t|
              if check_survey_member(survey_id,t.id)
                 Csi::SurveyMember.create({:survey_id=>survey_id,
                                           :person_id => t.id,
                                           :survey_range_id =>survey_range_id})
              else
                 Csi::SurveyMember.update_attribute(:survey_range_id,survey_range_id)
              end
            end
          end
       end

       def check_survey_member(survey_id,person_id)
         survey_result = Csi::SurveyResult.query_survey_members(survey_id,person_id)
         if survey_result.blank?
            survey_member = Csi::SurveyMember.query_by_survey_id(survey_id).query_by_person_id(person_id)
            if survey_member.present?
               false
            else
               true
            end
         else
            false
         end
       end
    end
  end
end