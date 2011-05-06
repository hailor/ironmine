Irm::AccessControl.map do |map|
  #============= 调查问卷==============================
  #map.function :view_survey,{"csi/surveys"=>[:index,:show,:show_result]}
  #map.function :new_survey,{"csi/surveys"=>[:new,:create],"csi/survey_subjects"=>[:new,:create]}
  map.function :view_survey, {"csi/surveys" => [:index, :show, :get_data],
                              "csi/survey_subjects" => [:index, :show, :get_data],
                              "csi/survey_ranges" => ["index", "show","get_data"]}
  map.function :new_survey, {"csi/surveys" => [:new, :create],
                             "csi/survey_subjects" => [:new, :create],
                             "csi/survey_ranges" => [:new, :create]}
  map.function :edit_survey, {"csi/surveys" => [:edit, :update,:active],
                              "csi/survey_subjects" => [:edit, :update],
                              "csi/survey_ranges" => [:edit, :update]}
  map.function :view_survey_result, {"csi/surveys" => [:export_result, :show_result, :survey_report]}
  map.function :reply_survey, {"csi/surveys" => [:reply, :create_result,:show_reply,:thanks,:password]}
end