Irm::AccessControl.map do |map|
  #============= 系统主页==============================
  # 主页
  map.function :home_page,{"irm/home"=>[:index]}
  #=====common setting===================
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
end