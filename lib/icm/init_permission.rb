Irm::AccessControl.map do |map|
  #============= 事故单==============================
  # 事故单首页
  map.function :view_incident_request,{"icm/incident_requests"=>[:index]}
  # 创建事故单
  map.function :create_incident_request,{"icm/incident_requests"=>[:new,:create]}
  # 编辑事故单
  map.function :edit_incident_request,{"icm/incident_requests"=>[:edit,:update]}
  # 回复事故单
  map.function :reply_incident_request,{"icm/incident_journals"=>[:new,:create]}
  # 关闭事故单
  map.function :close_incident_request,{"icm/incident_journals"=>[:edit_close,:update_close]}
end