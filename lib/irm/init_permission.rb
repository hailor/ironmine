Irm::AccessControl.map do |map|
  #============= 系统主页==============================
  # 主页
  map.function :home_page,{"irm/home"=>[:index]}
  #=====common setting===================
  #===================irm/global_settings============================
  #["index", "edit", "update", "crop"]
  map.function :view_global_settings,{"irm/global_settings"=>["index"]}
  map.function :edit_global_settings,{"irm/global_settings"=>["edit", "update"]}
  #===================irm/auth_sources============================
  map.function :view_auth_sources,{"irm/auth_sources"=>["index", "show"]}
  map.function :create_auth_sources,{"irm/auth_sources"=>["new", "create"]}
  map.function :edit_auth_sources,{"irm/auth_sources"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/lookup_types irm/lookup_values============================
  map.function :view_lookup,{"irm/lookup_types"=>["index", "show"],
                             "irm/lookup_values"=>["index", "show"]}
  map.function :create_lookup,{"irm/lookup_types"=>["new", "create", "create_value", "create_edit_value", "add_code"],
                               "irm/lookup_values"=>["new", "create"]}
  map.function :edit_lookup,{"irm/lookup_types"=>["create_edit_value", "edit", "update"],
                             "irm/lookup_values"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/general_categories============================
  map.function :view_general_categories,{"irm/general_categories"=>["index", "show"]}
  map.function :create_general_categories,{"irm/general_categories"=>["new", "create"]}
  map.function :edit_general_categories,{"irm/general_categories"=>["edit", "update"]}

  #===================irm/flex_value_sets irm/flex_values============================
  map.function :view_value_sets,{"irm/flex_value_sets"=>["index", "show"],"irm/flex_values"=>["index", "show"]}
  map.function :create_value_sets,{"irm/flex_value_sets"=>["new", "create"],"irm/flex_values"=>["new", "create"]}
  map.function :edit_value_sets,{"irm/flex_value_sets"=>["edit", "update"],"irm/flex_values"=>["edit", "update"]}

  #===================irm/id_flexes irm/id_flex_structures irm/id_flex_segments============================
  map.function :view_flexes,{"irm/id_flexes"=>["index", "show"],
                                "irm/id_flex_structures"=>["index", "show"],
                                "irm/id_flex_segments"=>["index", "show"]}
  map.function :create_flexes,{"irm/id_flexes"=>["new", "create"],
                                  "irm/id_flex_structures"=>["new", "create"],
                                  "irm/id_flex_segments"=>["new", "create"]}
  map.function :edit_flexes,{"irm/id_flexes"=>["edit", "update"],
                                "irm/id_flex_structures"=>["edit", "update"],
                                "irm/id_flex_segments"=>["edit", "update"]}

  #=====org structure===================
  #===================irm/companies irm/locations============================
  map.function :view_companies,{"irm/companies"=>["index", "show"],
                                "irm/locations"=>["index", "show"]}
  map.function :create_companies,{"irm/companies"=>["new", "create", "add_site_info", "create_location"],
                                  "irm/locations"=>["new", "create"]}
  map.function :edit_companies,{"irm/companies"=>["edit", "update", "multilingual_edit", "multilingual_update", "edit_location", "update_location"],
                                "irm/locations"=>["edit", "update"]}
  #===================irm/organizations============================
  map.function :view_organizations,{"irm/organizations"=>["index", "show"]}
  map.function :create_organizations,{"irm/organizations"=>["new", "create"]}
  map.function :edit_organizations,{"irm/organizations"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/departments============================
  map.function :view_departments,{"irm/departments"=>["index", "show"]}
  map.function :create_departments,{"irm/departments"=>["new", "create"]}
  map.function :edit_departments,{"irm/departments"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/people============================
  map.function :view_people,{"irm/people"=>["index", "show"],"irm/company_accesses"=>["index"]}
  map.function :create_people,{"irm/people"=>["new", "create"]}
  map.function :edit_people,{"irm/people"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  map.function :people_add_role,{"irm/people"=>["add_roles","remove_role"]}
  map.function :people_edit_company_access,{"irm/company_accesses"=>["new", "create"]}

  #===================irm/regions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_regions,{"irm/regions"=>["index", "show"]}
  map.function :create_regions,{"irm/regions"=>["new", "create"]}
  map.function :edit_regions,{"irm/regions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/site_groups============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "get_current_group_site", "create_site", "belongs_to", "show", "add_site", "edit_site", "update_site", "current_site_group", "multilingual_site_edit", "multilingual_site_update", "get_by_region_code"]
  #===================irm/sites============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "select_site", "multilingual_edit", "multilingual_update", "get_by_site_group_code"]
  map.function :view_sites,{"irm/site_groups"=>["index", "show"],"irm/sites"=>["index", "show"]}
  map.function :create_sites,{"irm/site_groups"=>["new", "create"],"irm/sites"=>["new", "create"]}
  map.function :edit_sites,{"irm/site_groups"=>["edit", "update", "multilingual_edit", "multilingual_update"],"irm/sites"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/support_groups============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "belongs_to", "add_persons", "get_support_group_member", "choose_person", "create_member", "delete_member", "show"]
  #===================irm/support_group_members============================
  #["index", "edit", "update", "delete", "new", "create", "get_data", "select_person", "get_person"]
  map.function :view_support_groups,{"irm/support_groups"=>["index", "show"],"irm/support_group_members"=>["select_person","index"]}
  map.function :create_support_groups,{"irm/support_groups"=>["new", "create"],"irm/support_group_members"=>["new", "create"]}
  map.function :edit_support_groups,{"irm/support_groups"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #=====permission ===================
  #===================irm/identities============================
  #["index", "edit", "update", "new", "create", "get_data", "show"]
  map.function :view_identities,{"irm/identities"=>["index", "show"]}
  map.function :create_identities,{"irm/identities"=>["new", "create"]}
  map.function :edit_identities,{"irm/identities"=>["edit", "update"]}

  #===================irm/roles============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_roles,{"irm/roles"=>["index", "show"]}
  map.function :create_roles,{"irm/roles"=>["new", "create"]}
  map.function :edit_roles,{"irm/roles"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/report_groups============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  #===================irm/report_group_members============================
  #["index", "new", "get_data", "get_selectable_data", "create", "destroy"]
  map.function :view_report_groups,{"irm/report_groups"=>["index", "show"],"irm/report_group_members"=>["index"]}
  map.function :create_report_groups,{"irm/report_groups"=>["new", "create"]}
  map.function :edit_report_groups,{"irm/report_groups"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  map.function :add_report_to_group,{"irm/report_group_members"=>["new", "create"]}

  #===================irm/scripts============================
  #["index", "get_data", "edit", "update", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_scripts,{"irm/scripts"=>["index", "show"]}
  map.function :create_scripts,{"irm/scripts"=>["new", "create"]}
  map.function :edit_scripts,{"irm/scripts"=>["edit", "update", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/mail_templates============================
  #["new", "get_data", "create", "copy", "copy_template", "test_mail_template", "index", "edit", "update", "destroy", "show", "get_script_context_fields", "get_mail_templates"]
  map.function :view_mail_templates,{"irm/mail_templates"=>["index", "show"]}
  map.function :create_mail_templates,{"irm/mail_templates"=>["new", "create"]}
  map.function :edit_mail_templates,{"irm/mail_templates"=>["edit", "update"]}

  #===================irm/menus============================
  #["index", "new", "create", "get_data", "edit", "update", "show", "remove_entry", "multilingual_edit", "multilingual_update"]
  #===================irm/menu_entries============================
  #["index", "new", "create", "get_data", "edit", "update", "destroy", "select_parent", "show"]
  map.function :view_menus,{"irm/menus"=>["index", "show"],"irm/menu_entries"=>["index", "show"]}
  map.function :create_menus,{"irm/menus"=>["new", "create"],"irm/menu_entries"=>["new", "create"]}
  map.function :edit_menus,{"irm/menus"=>["edit", "update", "multilingual_edit", "multilingual_update"],"irm/menu_entries"=>["edit", "update"]}

  #===================irm/function_groups============================
  #["index", "edit", "update", "new", "create", "show", "get_data"]
  map.function :view_function_groups,{"irm/function_groups"=>["index", "show"]}
  map.function :create_function_groups,{"irm/function_groups"=>["new", "create"]}
  map.function :edit_function_groups,{"irm/function_groups"=>["edit", "update"]}

  #===================irm/functions============================
  #["index", "edit", "update", "new", "create", "show", "get_data", "add_permissions", "get_available_permissions", "select_permissions", "add_permissions", "remove_permission"]
  map.function :view_functions,{"irm/functions"=>["index", "show"]}
  map.function :create_functions,{"irm/functions"=>["new", "create", "add_permissions", "add_permissions"]}
  map.function :edit_functions,{"irm/functions"=>["edit", "update"]}

  #===================irm/reports============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_reports,{"irm/reports"=>["index", "show"]}
  map.function :create_reports,{"irm/reports"=>["new", "create"]}
  map.function :edit_reports,{"irm/reports"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/actions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_actions,{"irm/actions"=>["index", "show"]}
  map.function :create_actions,{"irm/actions"=>["new", "create"]}
  map.function :edit_actions,{"irm/actions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/conditions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_conditions,{"irm/conditions"=>["index", "show"]}
  map.function :create_conditions,{"irm/conditions"=>["new", "create"]}
  map.function :edit_conditions,{"irm/conditions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/currencies============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_currencies,{"irm/currencies"=>["index", "show"]}
  map.function :create_currencies,{"irm/currencies"=>["new", "create"]}
  map.function :edit_currencies,{"irm/currencies"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/languages============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_languages,{"irm/languages"=>["index", "show"]}
  map.function :create_languages,{"irm/languages"=>["new", "create"]}
  map.function :edit_languages,{"irm/languages"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/product_modules============================
  #["index", "edit", "update", "new", "create", "get_data", "data_grid"]
  map.function :view_product_modules,{"irm/product_modules"=>["index"]}
  map.function :create_product_modules,{"irm/product_modules"=>["new", "create"]}
  map.function :edit_product_modules,{"irm/product_modules"=>["edit", "update"]}

  #===================irm/dev_tools============================
  #["index", "show_permissions", "show_permissions_data", "show_missed_permissions", "missed_permissions_data"]
  map.function :view_dev_tools,{"irm/dev_tools"=>["index", "show_permissions", "show_permissions_data", "show_missed_permissions"]}

  #===================irm/wf_tasks============================
  #["index", "show_permissions", "show_permissions_data", "show_missed_permissions", "missed_permissions_data"]
  map.function :view_wf_tasks,{"irm/wf_tasks"=>["index", "show", "quick_show"]}
  map.function :create_wf_tasks,{"irm/wf_tasks"=>["new", "create"]}
  map.function :edit_wf_tasks,{"irm/wf_tasks"=>["edit", "update"]}


end