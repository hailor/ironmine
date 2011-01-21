class Csi::SurveyResult < ActiveRecord::Base
  set_table_name :csi_survey_results

  validates_presence_of :subject_result,:if =>Proc.new { |a|
    (Csi::SurveySubject.query_by_subject_id(a.subject_id).first.required_flag.to_i==1)}


end