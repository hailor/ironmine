Irm::AccessControl.map do |map|
  #============= 事故单==============================
  # 查看事故单
  map.function :view_incident_request,{"icm/incident_requests"=>[:index]}
  # 创建事故单
  map.function :create_incident_request,{"icm/incident_requests"=>[:new,:create]}
  # 编辑事故单
  map.function :edit_incident_request,{"icm/incident_requests"=>[:edit,:update]}
  # 回复事故单
  map.function :reply_incident_request,{"icm/incident_journals"=>[:index,:new,:create]}
  # 关闭事故单
  map.function :close_incident_request,{"icm/incident_journals"=>[:edit_close,:update_close]}
  # 转交事故单
  map.function :pass_incident_request,{}
  # 分配事故单
  map.function :assign_incident_request,{}
  # 查看所有事故单
  map.function :view_all_incident_request ,{"icm/incident_requests"=>[:index]}
  # 为他人提交事故单
  map.function :create_icdt_rqst_for_other,{"icm/incident_requests"=>[:new,:create]}

end