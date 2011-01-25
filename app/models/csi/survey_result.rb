class Csi::SurveyResult < ActiveRecord::Base
  set_table_name :csi_survey_results

  validates_presence_of :subject_result,:if =>Proc.new { |a|
    (Csi::SurveySubject.query_by_subject_id(a.subject_id).first.required_flag.to_i==1)}

  scope :query_by_survey_id,lambda{|survey_id,response_batch,subject_id| select("#{table_name}.subject_result").
                                               joins(",#{Csi::SurveySubject.table_name} css").
                                               where("css.survey_id = ? AND css.id = #{table_name}.subject_id AND "+
                                                     "#{table_name}.response_batch = ? AND #{table_name}.subject_id=?",
                                                     survey_id,response_batch,subject_id)}


  scope :query_distinct_response_batch,lambda{|survey_id| select("distinct #{table_name}.response_batch,response_time").
                                                              joins(",#{Csi::SurveySubject.table_name} css").
                                                              where("css.survey_id = ? AND css.id = #{table_name}.subject_id",
                                                                     survey_id)}




end