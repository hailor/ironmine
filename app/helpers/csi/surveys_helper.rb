module Csi::SurveysHelper
  def get_survey_result(survey_id,response_batch,subject_id)
    @survey_result = Csi::SurveyResult.query_by_survey_id(survey_id,response_batch,subject_id)
    @count = Csi::SurveyResult.query_by_survey_id(survey_id,response_batch,subject_id).count
    @all_survey_result=""
    @survey_result.each do |t|
       if @count.to_i == 1
         @all_survey_result = t[:subject_result]
       else
         @all_survey_result = @all_survey_result + t[:subject_result]+','
       end
    end    
    @all_survey_result
  end


  def check_survey_result_exist?(survey_id)
    @count = Csi::SurveyResult.query_distinct_response_batch(survey_id).count
    if @count > 1
       false
    else
       true
    end
  end
end
