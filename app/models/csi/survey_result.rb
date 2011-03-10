# -*- coding: utf-8 -*-
class Csi::SurveyResult < ActiveRecord::Base
  set_table_name :csi_survey_results

  validates_presence_of :subject_result,:if =>Proc.new { |a|
    (Csi::SurveySubject.query_by_subject_id(a.subject_id).first.required_flag=="Y")}

  scope :query_by_survey_id,lambda{|survey_id,response_batch,subject_id| select("#{table_name}.subject_result").
                                               joins(",#{Csi::SurveySubject.table_name} css").
                                               where("css.survey_id = ? AND css.id = #{table_name}.subject_id AND "+
                                                     "#{table_name}.response_batch = ? AND #{table_name}.subject_id=?",
                                                     survey_id,response_batch,subject_id)}


  scope :query_distinct_response_batch,lambda{|survey_id| select("distinct #{table_name}.response_batch,response_time,person_id").
                                                              joins(",#{Csi::SurveySubject.table_name} css").
                                                              where("css.survey_id = ? AND css.id = #{table_name}.subject_id",
                                                                     survey_id)}


  scope :query_by_option_type,lambda{|subject_id,option_type| select("#{table_name}.subject_result,sum(1) result_count").
                                                              where("#{table_name}.subject_id = ? AND #{table_name}.option_type = ? ",
                                                                     subject_id,option_type).
                                                              group("#{table_name}.subject_result")}

  scope :query_other_option_type,lambda{|subject_id,option_type| select("'其它' subject_result,sum(1) result_count").
                                                              where("#{table_name}.subject_id = ? AND #{table_name}.option_type = ? ",
                                                                     subject_id,option_type)}

  scope :query_survey_members,lambda{|survey_id,person_id|  select("#{table_name}.*")
                                                     joins(",#{Csi::SurveySubject.table_name} css").
                                                     where("css.survey_id = ? AND css.id = #{table_name}.subject_id AND "+
                                                     "#{table_name}.person_id = ?",
                                                     survey_id,person_id)}

end