Irm::AccessControl.map do |map|
  #============= 事故单==============================
  # 查看事故单
  map.function :view_incident_request,{"icm/incident_requests"=>[:index, :get_data, :get_help_desk_data,
                                                                 :get_external_systems,
                                                                 :get_slm_services],
                                       "icm/incident_journals"=>[:index,:new]}
  # 创建事故单
  map.function :create_incident_request,{"icm/incident_requests"=>[:new,:create]}
  # 编辑事故单
  map.function :edit_incident_request,{"icm/incident_requests"=>[:edit,:update]}
  # 回复事故单
  map.function :reply_incident_request,{"icm/incident_journals"=>[:index,:new,:create,
                                                                  :get_entry_header_data, :apply_entry_header]}
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


  #===================icm/rule_settings============================
  #["index", "edit", "update", "new", "create", "get_data", "show"]
  map.function :view_rule_settings,{"icm/rule_settings"=>["index", "show", "get_data"]}
  map.function :create_rule_settings,{"icm/rule_settings"=>["new", "create"]}
  map.function :edit_rule_settings,{"icm/rule_settings"=>["edit", "update"]}

  #===================icm/urgence_codes============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "show"]
  map.function :view_urgence_codes,{"icm/urgence_codes"=>["index", "show", "get_data"]}
  map.function :create_urgence_codes,{"icm/urgence_codes"=>["new", "create"]}
  map.function :edit_urgence_codes,{"icm/urgence_codes"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================icm/impact_ranges============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_impact_ranges,{"icm/impact_ranges"=>["index", "show", "get_data"]}
  map.function :create_impact_ranges,{"icm/impact_ranges"=>["new", "create"]}
  map.function :edit_impact_ranges,{"icm/impact_ranges"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================icm/priority_codes============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "show"]
  map.function :view_priority_codes,{"icm/priority_codes"=>["index", "show", "get_data"]}
  map.function :create_priority_codes,{"icm/priority_codes"=>["new", "create"]}
  map.function :edit_priority_codes,{"icm/priority_codes"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================icm/group_assignments============================
  #["index", "edit", "update", "new", "create", "get_data", "destroy", "get_customer_departments", "get_customer_sites", "get_customer_site_groups", "get_customer_people", "get_customer_organizations"]
  map.function :view_group_assignments,{"icm/group_assignments"=>["index", "get_data"]}
  map.function :create_group_assignments,{"icm/group_assignments"=>["new", "create", "get_customer_departments", "get_customer_people", "get_customer_organizations"]}
  map.function :edit_group_assignments,{"icm/group_assignments"=>["edit", "update", "get_customer_departments", "get_customer_people", "get_customer_organizations"]}

  #===================icm/incident_phases============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_incident_phases,{"icm/incident_phases"=>["index", "show", "get_data"]}
  map.function :create_incident_phases,{"icm/incident_phases"=>["new", "create"]}
  map.function :edit_incident_phases,{"icm/incident_phases"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================icm/incident_statuses============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "show"]
  map.function :view_incident_statuses,{"icm/incident_statuses"=>["index", "show", "get_data"]}
  map.function :create_incident_statuses,{"icm/incident_statuses"=>["new", "create"]}
  map.function :edit_incident_statuses,{"icm/incident_statuses"=>["edit", "update", "multilingual_edit", "multilingual_update"]}


  #===================icm/close_reasons============================
  #["index", "edit", "update", "new", "create", "show", "get_data"]
  map.function :view_close_reasons,{"icm/close_reasons"=>["index", "show", "get_data"]}
  map.function :create_close_reasons,{"icm/close_reasons"=>["new", "create"]}
  map.function :edit_close_reasons,{"icm/close_reasons"=>["edit", "update"]}

end