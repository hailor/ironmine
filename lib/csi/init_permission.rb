Irm::AccessControl.map do |map|
  #============= 调查问卷==============================
  map.function :view_survey,{"csi/surveys"=>[:index,:show,:show_result]}
  map.function :new_survey,{"csi/surveys"=>[:new,:create],"csi/survey_subjects"=>[:new,:create]}
end