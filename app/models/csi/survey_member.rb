class Csi::SurveyMember < ActiveRecord::Base
  set_table_name :csi_survey_members

  scope :query_by_survey_id,lambda{|survey_id| where(:survey_id => survey_id)}
  scope :query_by_person_id,lambda{|person_id| where(:person_id => person_id)}
end