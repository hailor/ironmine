Irm::AccessControl.map do |map|
  #===================skm/entry_statuses============================
  #["index", "edit", "update", "new", "create", "get_data", "show"]
  map.function :view_entry_statuses,{"skm/entry_statuses"=>["index", "show", "get_data"]}
  map.function :create_entry_statuses,{"skm/entry_statuses"=>["new", "create"]}
  map.function :edit_entry_statuses,{"skm/entry_statuses"=>["edit", "update"]}

  #===================skm/entry_templates============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "remove_element", "add_elements", "select_elements", "get_owned_elements_data", "get_available_elements", "up_element", "down_element", "edit_detail", "update_detail"]
  map.function :view_entry_templates,{"skm/entry_templates"=>["index", "show", "get_data", "get_owned_elements_data", "select_elements"]}
  map.function :create_entry_templates,{"skm/entry_templates"=>["new", "create", "add_elements", "get_available_elements"]}
  map.function :edit_entry_templates,{"skm/entry_templates"=>["edit", "update", "edit_detail",
                                                              "update_detail", "remove_element", "up_element", "down_element"]}

  #===================skm/entry_template_elements============================
  #["index", "edit", "update", "new", "create", "get_data", "show"]
  map.function :view_entry_template_elements,{"skm/entry_template_elements"=>["index", "show", "get_data"]}
  map.function :create_entry_template_elements,{"skm/entry_template_elements"=>["new", "create"]}
  map.function :edit_entry_template_elements,{"skm/entry_template_elements"=>["edit", "update"]}

  #===================skm/settings ====================================
  map.function :view_skm_settings, {"skm/settings" => ["index"]}
  map.function :edit_skm_settings, {"skm/settings" => ["edit", "update"]}


  #===================skm/entries ==========================================
  map.function :view_skm_entries, {"skm/entry_headers" => ["index", "show", "index_search", "get_history_entries_data", "get_data",
                                                           "my_favorites_data", "my_favorites", "add_favorites", "data_grid"],
                                   "icm/incident_journals" => ["get_entry_header_data", "apply_entry_header"]}
  map.function :create_skm_entries, {"skm/entry_headers" => ["new", "create", "new_step_1", "new_step_2", "new_step_3", "new_step_4", "new_from_icm_request"]}
  map.function :edit_skm_entries, {"skm/entry_headers" => ["edit", "update"]}

  map.function :login_function,{ "skm/entry_reports" => ["get_rpt_apply_data", "get_rpt_show_data", "get_search_history_data"]}

end