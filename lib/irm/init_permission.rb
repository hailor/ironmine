Irm::AccessControl.map do |map|
  #============= 系统主页==============================
  # 主页
  map.function :home_page,{"irm/home"=>[:index], "irm/calendars" => ["get_full_calendar"]}
  map.function :public_function,{"irm/common"=>[:login], "irm/navigations" => ["access_deny", "combo"]}
  map.function :login_function,{ "irm/filters" => ["edit", "new", "create", "update", "index", "operator_value"],
                                 "irm/setting" => ["common"],
                                 "irm/navigations" => ["change_role", "index"]}
  #=====common setting===================
  #===================irm/global_settings============================
  #["index", "edit", "update", "crop"]
  map.function :view_global_settings,{"irm/global_settings"=>["index"]}
  map.function :edit_global_settings,{"irm/global_settings"=>["edit", "update"]}
  #===================irm/auth_sources============================
  map.function :view_auth_sources,{"irm/auth_sources"=>["index", "show", "get_data"]}
  map.function :create_auth_sources,{"irm/auth_sources"=>["new", "create"]}
  map.function :edit_auth_sources,{"irm/auth_sources"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/lookup_types irm/lookup_values============================
  map.function :view_lookup,{"irm/lookup_types"=>["index", "show", "get_lookup_types"],
                             "irm/lookup_values"=>["index", "show", "get_lookup_values", "select_lookup_type"]}
  map.function :create_lookup,{"irm/lookup_types"=>["new", "create", "create_value", "create_edit_value", "add_code"],
                               "irm/lookup_values"=>["new", "create"]}
  map.function :edit_lookup,{"irm/lookup_types"=>["create_edit_value", "edit", "update"],
                             "irm/lookup_values"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/general_categories============================
  map.function :view_general_categories,{"irm/general_categories"=>["index", "show", "get_data"]}
  map.function :create_general_categories,{"irm/general_categories"=>["new", "create"]}
  map.function :edit_general_categories,{"irm/general_categories"=>["edit", "update"]}

  #===================irm/flex_value_sets irm/flex_values============================
  map.function :view_value_sets,{"irm/flex_value_sets"=>["index", "show", "get_data"],"irm/flex_values"=>["index", "show", "get_data", "select_set"]}
  map.function :create_value_sets,{"irm/flex_value_sets"=>["new", "create"],"irm/flex_values"=>["new", "create"]}
  map.function :edit_value_sets,{"irm/flex_value_sets"=>["edit", "update"],"irm/flex_values"=>["edit", "update"]}

  #===================irm/id_flexes irm/id_flex_structures irm/id_flex_segments============================
  map.function :view_flexes,{"irm/id_flexes"=>["index", "show", "get_data"],
                                "irm/id_flex_structures"=>["index", "show", "get_data", "select_parent"],
                                "irm/id_flex_segments"=>["index", "show", "get_data"]}
  map.function :create_flexes,{"irm/id_flexes"=>["new", "create"],
                                  "irm/id_flex_structures"=>["new", "create"],
                                  "irm/id_flex_segments"=>["new", "create"]}
  map.function :edit_flexes,{"irm/id_flexes"=>["edit", "update"],
                                "irm/id_flex_structures"=>["edit", "update"],
                                "irm/id_flex_segments"=>["edit", "update"]}

  #=====org structure===================
  #===================irm/companies irm/locations============================
  map.function :view_companies,{"irm/companies"=>["index", "show", "get_data", "site_info",
                                                  "get_company_site", "get_company_info", "get_support_group", "get_choose_company"],
                                "irm/locations"=>["index", "show", "get_data"]}
  map.function :create_companies,{"irm/companies"=>["new", "create", "add_site_info", "create_location"],
                                  "irm/locations"=>["new", "create"]}
  map.function :edit_companies,{"irm/companies"=>["edit", "update", "multilingual_edit", "multilingual_update", "edit_location", "update_location"],
                                "irm/locations"=>["edit", "update"]}
  #===================irm/organizations============================
  map.function :view_organizations,{"irm/organizations"=>["index", "show", "get_data", "belongs_to", "get_by_company"]}
  map.function :create_organizations,{"irm/organizations"=>["new", "create"]}
  map.function :edit_organizations,{"irm/organizations"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/departments============================
  map.function :view_departments,{"irm/departments"=>["index", "show", "get_data", "belongs_to", "get_by_organization"]}
  map.function :create_departments,{"irm/departments"=>["new", "create"]}
  map.function :edit_departments,{"irm/departments"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/people============================
  map.function :view_people,{"irm/people"=>["index", "show", "get_data", "get_choose_people",
                                            "get_support_group", "get_owned_roles"],
                             "irm/company_accesses"=>["index"]}
  map.function :create_people,{"irm/people"=>["new", "create"]}
  map.function :edit_people,{"irm/people"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  map.function :people_add_role,{"irm/people"=>["add_roles","remove_role", "select_roles", "get_available_roles"]}
  map.function :people_edit_company_access,{"irm/company_accesses"=>["new", "create"]}

  #===================irm/regions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_regions,{"irm/regions"=>["index", "show", "get_data"]}
  map.function :create_regions,{"irm/regions"=>["new", "create"]}
  map.function :edit_regions,{"irm/regions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/site_groups============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "get_current_group_site", "create_site", "belongs_to", "show", "add_site", "edit_site", "update_site", "current_site_group", "multilingual_site_edit", "multilingual_site_update", "get_by_region_code"]
  #===================irm/sites============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "select_site", "multilingual_edit", "multilingual_update", "get_by_site_group_code"]
  map.function :view_sites,{"irm/site_groups" =>["index", "show", "get_data", "get_current_group_site", "get_by_region_code", "belongs_to"],
                            "irm/sites" => ["index", "show", "get_data", "select_site", "get_by_site_group_code"]}
  map.function :create_sites,{"irm/site_groups"=>["new", "create"],"irm/sites"=>["new", "create"]}
  map.function :edit_sites,{"irm/site_groups"=>["edit", "update", "multilingual_edit", "multilingual_update"],
                            "irm/sites"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/support_groups============================
  #["index", "edit", "update", "new", "create", "multilingual_edit", "multilingual_update", "get_data", "belongs_to", "add_persons", "get_support_group_member", "choose_person", "create_member", "delete_member", "show"]
  #===================irm/support_group_members============================
  #["index", "edit", "update", "delete", "new", "create", "get_data", "select_person", "get_person"]
  map.function :view_support_groups,{"irm/support_groups"=>["index", "show", "get_data", "get_support_group_member", "choose_person"],
                                     "irm/support_group_members"=>["select_person","index", "get_person", "get_options"]}
  map.function :create_support_groups,{"irm/support_groups"=>["new", "create"],
                                       "irm/support_group_members"=>["new", "create"]}
  map.function :edit_support_groups,{"irm/support_groups"=>["edit", "update", "multilingual_edit", "multilingual_update",
                                                            "delete_member", "create_member"]}

  #=====permission ===================
  #===================irm/identities============================
  #["index", "edit", "update", "new", "create", "get_data", "show"]
  map.function :view_identities,{"irm/identities"=>["index", "show", "get_data"]}
  map.function :create_identities,{"irm/identities"=>["new", "create"]}
  map.function :edit_identities,{"irm/identities"=>["edit", "update"]}

  #===================irm/roles============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_roles,{"irm/roles"=>["index", "show", "get_data"]}
  map.function :create_roles,{"irm/roles"=>["new", "create"]}
  map.function :edit_roles,{"irm/roles"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/report_groups============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  #===================irm/report_group_members============================
  #["index", "new", "get_data", "get_selectable_data", "create", "destroy"]
  map.function :view_report_groups,{"irm/report_groups"=>["index", "show", "get_data"],
                                    "irm/report_group_members"=>["index", "get_data", "get_selectable_data"]}
  map.function :create_report_groups,{"irm/report_groups"=>["new", "create"]}
  map.function :edit_report_groups,{"irm/report_groups"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  map.function :add_report_to_group,{"irm/report_group_members"=>["new", "create"]}

  #===================irm/scripts============================
  #["index", "get_data", "edit", "update", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_scripts,{"irm/scripts"=>["index", "show", "get_data"]}
  map.function :create_scripts,{"irm/scripts"=>["new", "create"]}
  map.function :edit_scripts,{"irm/scripts"=>["edit", "update", "update", "multilingual_edit", "multilingual_update"]}

  #===================irm/mail_templates============================
  #["new", "get_data", "create", "copy", "copy_template", "test_mail_template", "index", "edit", "update", "destroy", "show", "get_script_context_fields", "get_mail_templates"]
  map.function :view_mail_templates,{"irm/mail_templates"=>["index", "show", "get_data", "get_script_context_fields",
                                                            "get_mail_templates"]}
  map.function :create_mail_templates,{"irm/mail_templates"=>["new", "create"]}
  map.function :edit_mail_templates,{"irm/mail_templates"=>["edit", "update"]}

  #===================irm/menus============================
  #["index", "new", "create", "get_data", "edit", "update", "show", "remove_entry", "multilingual_edit", "multilingual_update"]
  #===================irm/menu_entries============================
  #["index", "new", "create", "get_data", "edit", "update", "destroy", "select_parent", "show"]
  map.function :view_menus,{"irm/menus"=>["index", "show", "get_data"],
                            "irm/menu_entries"=>["index", "show", "get_data", "select_parent"]}
  map.function :create_menus,{"irm/menus"=>["new", "create"],
                              "irm/menu_entries"=>["new", "create"]}
  map.function :edit_menus,{"irm/menus"=>["edit", "update", "multilingual_edit", "multilingual_update", "remove_entry"],
                            "irm/menu_entries"=>["edit", "update"]}

  #===================irm/function_groups============================
  #["index", "edit", "update", "new", "create", "show", "get_data"]
  map.function :view_function_groups,{"irm/function_groups"=>["index", "show", "get_data"]}
  map.function :create_function_groups,{"irm/function_groups"=>["new", "create"]}
  map.function :edit_function_groups,{"irm/function_groups"=>["edit", "update"]}

  #===================irm/functions============================
  #["index", "edit", "update", "new", "create", "show", "get_data", "add_permissions", "get_available_permissions", "select_permissions", "add_permissions", "remove_permission"]
  map.function :view_functions,{"irm/functions"=>["index", "show", "get_data"]}
  map.function :create_functions,{"irm/functions"=>["new", "create", "add_permissions", "add_permissions"]}
  map.function :edit_functions,{"irm/functions"=>["edit", "update"]}

  #===================irm/reports============================
  #["index", "edit", "update", "new", "create", "get_data", "show", "multilingual_edit", "multilingual_update"]
  map.function :view_reports,{"irm/reports"=>["index", "show", "get_data"]}
  map.function :create_reports,{"irm/reports"=>["new", "create"]}
  map.function :edit_reports,{"irm/reports"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/actions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_actions,{"irm/actions"=>["index", "show", "get_data"]}
  map.function :create_actions,{"irm/actions"=>["new", "create"]}
  map.function :edit_actions,{"irm/actions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/conditions============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_conditions,{"irm/conditions"=>["index", "show", "get_data"]}
  map.function :create_conditions,{"irm/conditions"=>["new", "create"]}
  map.function :edit_conditions,{"irm/conditions"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/currencies============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_currencies,{"irm/currencies"=>["index", "show", "get_data"]}
  map.function :create_currencies,{"irm/currencies"=>["new", "create"]}
  map.function :edit_currencies,{"irm/currencies"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/languages============================
  #["index", "get_data", "edit", "update", "new", "show", "create", "multilingual_edit", "multilingual_update"]
  map.function :view_languages,{"irm/languages"=>["index", "show", "get_data"]}
  map.function :create_languages,{"irm/languages"=>["new", "create"]}
  map.function :edit_languages,{"irm/languages"=>["edit", "update", "multilingual_edit", "multilingual_update"]}
  #===================irm/product_modules============================
  #["index", "edit", "update", "new", "create", "get_data", "data_grid"]
  map.function :view_product_modules,{"irm/product_modules"=>["index", "get_data"]}
  map.function :create_product_modules,{"irm/product_modules"=>["new", "create"]}
  map.function :edit_product_modules,{"irm/product_modules"=>["edit", "update"]}

  #===================irm/dev_tools============================
  #["index", "show_permissions", "show_permissions_data", "show_missed_permissions", "missed_permissions_data"]
  map.function :view_dev_tools,{"irm/dev_tools"=>["index", "show_permissions", "show_permissions_data", "show_missed_permissions"]}

  #===================irm/wf_tasks============================
  #["index", "show_permissions", "show_permissions_data", "show_missed_permissions", "missed_permissions_data"]
  map.function :view_wf_tasks,{"irm/wf_tasks"=>["index", "show", "quick_show",
                                                "my_tasks_index", "get_data", "my_tasks_get_data"]}
  map.function :create_wf_tasks,{"irm/wf_tasks"=>["new", "create"]}
  map.function :edit_wf_tasks,{"irm/wf_tasks"=>["edit", "update",
                                                "edit_recurrence", "update_recurrence"]}

  #===================irm/business_objects============================
  #["index", "new", "create", "get_data", "edit", "update", "show", "execute_test", "multilingual_edit", "multilingual_update"]
  #===================irm/object_attributes============================
  #["index", "new", "create", "get_data", "edit", "update", "show", "destroy", "multilingual_edit", "multilingual_update", "relation_columns", "selectable_columns"]
  map.function :view_business_objects,{"irm/business_objects"=>["index", "show", "get_data"],
                                       "irm/object_attributes"=>["index", "show", "get_data"]}
  map.function :create_business_objects,{"irm/business_objects"=>["new", "create"],
                                         "irm/object_attributes"=>["new", "create", "selectable_columns", "relation_columns"]}
  map.function :edit_business_objects,{"irm/business_objects"=>["edit", "update", "multilingual_edit", "multilingual_update"],
                                       "irm/object_attributes"=>["edit", "update", "multilingual_edit", "multilingual_update",
                                                                 "selectable_columns", "relation_columns"]}

  #===================irm/list_of_values============================
  #["index", "new", "create", "get_data", "edit", "update", "show", "multilingual_edit", "multilingual_update", "execute_test", "get_lov_data"]
  map.function :view_list_of_values,{"irm/list_of_values"=>["index", "show", "get_lov_data", "get_data"]}
  map.function :create_list_of_values,{"irm/list_of_values"=>["new", "create"]}
  map.function :edit_list_of_values,{"irm/list_of_values"=>["edit", "update", "multilingual_edit", "multilingual_update"]}

  #====================irm/my_info =================================
  map.function :view_my_info, {"irm/my_info" => ["index", "filter_company"],
                               "irm/my_login_history" => ["index", "get_login_data"],
                               "irm/my_password" => ["index"],
                               "irm/my_avatar" => ["index"]}
  map.function :edit_my_info, {"irm/my_info" => ["edit", "update", "update_company_access"],
                               "irm/my_avatar" => ["avatar_crop", "edit", "update"],
                               "irm/my_password" => ["edit_password", "update_password"]}

  #====================irm/bulletins ==================================
  map.function :view_bulletins, {"irm/bulletins" => ["index", "show", "get_data"]}
  map.function :new_bulletins, {"irm/bulletins" => ["new", "create", "get_ava_departments", "get_ava_organizations"]}
  map.function :edit_bulletins, {"irm/bulletins" => ["edit", "update", "get_ava_departments", "get_ava_organizations"]}

  #====================irm/watchers ========================================
  map.function :view_watchers, {}
  map.function :edit_watchers, {"irm/watchers" => ["add_watcher", "delete_watcher"]}

  #===================irm/wf_settings============================
  #["index", "edit", "update"]
  map.function :workflow_setting,{"irm/wf_settings"=>["index","edit", "update"]}
  #===================irm/wf_rules============================
  #["index", "new", "create", "get_data", "edit", "update", "show"]
  map.function :view_wf_rules,{"irm/wf_rules"=>["index", "show"]}
  map.function :create_wf_rules,{"irm/wf_rules"=>["new", "create"]}
  map.function :edit_wf_rules,{"irm/wf_rules"=>["edit", "update"]}
end