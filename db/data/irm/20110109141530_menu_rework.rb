# -*- coding: utf-8 -*-
class MenuRework < ActiveRecord::Migration
  def self.up
    Irm::Menu.delete_all
    Irm::MenuEntry.delete_all
    Irm::MenusTl.delete_all
    Irm::MenuEntriesTl.delete_all
    setting_entrance_menu = Irm::Menu.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:not_auto_mult=>true)
    setting_entrance_menu.menus_tls.build(:language=>'zh',:name=>'系统设置顶层菜单',:description=>'系统设置顶层菜单',:source_lang=>'en')
    setting_entrance_menu.menus_tls.build(:language=>'en',:name=>'Top System Setting Menu',:description=>'Top System Setting Menu',:source_lang=>'en')
    setting_entrance_menu.save

    irm_admin_menu = Irm::Menu.new(:menu_code=>'IRM_ADMIN_MENU',:not_auto_mult=>true)
    irm_admin_menu.menus_tls.build(:language=>'zh',:name=>'设置菜单',:description=>'设置菜单',:source_lang=>'en')
    irm_admin_menu.menus_tls.build(:language=>'en',:name=>'Setting Menu',:description=>'Setting Menu',:source_lang=>'en')
    irm_admin_menu.save

    entrance_admin = Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_ADMIN_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    entrance_admin.menu_entries_tls.build(:language=>'zh',:name=>'设置',:description=>'设置',:source_lang=>'en')
    entrance_admin.menu_entries_tls.build(:language=>'en',:name=>'Setting',:description=>'Setting',:source_lang=>'en')
    entrance_admin.save

    personal_setting_menu = Irm::Menu.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',:not_auto_mult=>true)
    personal_setting_menu.menus_tls.build(:language=>'zh',:name=>'个人设置菜单',:description=>'个人设置菜单',:source_lang=>'en')
    personal_setting_menu.menus_tls.build(:language=>'en',:name=>'Personal Setting Menu',:description=>'Personal Setting Menu',:source_lang=>'en')
    personal_setting_menu.save

    admin_personal = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_PERSONAL_SETTING_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    admin_personal.menu_entries_tls.build(:language=>'zh',:name=>'个人设置',:description=>'个人设置',:source_lang=>'en')
    admin_personal.menu_entries_tls.build(:language=>'en',:name=>'Personal Setting',:description=>'Personal Setting',:source_lang=>'en')
    admin_personal.save

    my_personal_info_menu = Irm::Menu.new(:menu_code=>'IRM_MY_PERSONAL_INFO_MENU',:not_auto_mult=>true)
    my_personal_info_menu.menus_tls.build(:language=>'zh',:name=>'我的个人信息菜单',:description=>'我的个人信息菜单',:source_lang=>'en')
    my_personal_info_menu.menus_tls.build(:language=>'en',:name=>'My Personal Info Menu',:description=>'My Personal Info Menu',:source_lang=>'en')
    my_personal_info_menu.save

    personal_personal = Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',
                                         :sub_menu_code=>'IRM_MY_PERSONAL_INFO_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    personal_personal.menu_entries_tls.build(:language=>'zh',:name=>'我的个人信息',:description=>'我的个人信息',:source_lang=>'en')
    personal_personal.menu_entries_tls.build(:language=>'en',:name=>'My Personal Info',:description=>'My Personal Info',:source_lang=>'en')
    personal_personal.save


    personal_info_password = Irm::MenuEntry.new(:menu_code=>'IRM_MY_PERSONAL_INFO_MENU',
                                         :permission_code=>'IRM_IDENTITIES_EDIT_PASSWORD',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    personal_info_password.menu_entries_tls.build(:language=>'zh',:name=>'更改我的密码',:description=>'更改我的密码',:source_lang=>'en')
    personal_info_password.menu_entries_tls.build(:language=>'en',:name=>'Change My Password',:description=>'Change My Password',:source_lang=>'en')
    personal_info_password.save

    base_setting_menu = Irm::Menu.new(:menu_code=>'IRM_BASE_SETTING_MENU',:not_auto_mult=>true)
    base_setting_menu.menus_tls.build(:language=>'zh',:name=>'基础设置菜单',:description=>'基础设置菜单',:source_lang=>'en')
    base_setting_menu.menus_tls.build(:language=>'en',:name=>'Base Setting Menu',:description=>'Base Setting Menu',:source_lang=>'en')
    base_setting_menu.save

    admin_base_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_BASE_SETTING_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    admin_base_setting.menu_entries_tls.build(:language=>'zh',:name=>'基础设置',:description=>'基础设置',:source_lang=>'en')
    admin_base_setting.menu_entries_tls.build(:language=>'en',:name=>'Base Setting',:description=>'Base Setting',:source_lang=>'en')
    admin_base_setting.save

    common_setting_menu = Irm::Menu.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:not_auto_mult=>true)
    common_setting_menu.menus_tls.build(:language=>'zh',:name=>'常用设置菜单',:description=>'常用设置菜单',:source_lang=>'en')
    common_setting_menu.menus_tls.build(:language=>'en',:name=>'Common Setting Menu',:description=>'Common Setting Menu',:source_lang=>'en')
    common_setting_menu.save

    base_common_setting = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    base_common_setting.menu_entries_tls.build(:language=>'zh',:name=>'常用设置',:description=>'常用设置',:source_lang=>'en')
    base_common_setting.menu_entries_tls.build(:language=>'en',:name=>'Common Setting',:description=>'Common Setting',:source_lang=>'en')
    base_common_setting.save

    common_global_setting = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_GLOBAL_SETTINGS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    common_global_setting.menu_entries_tls.build(:language=>'zh',:name=>'全局设置',:description=>'全局设置',:source_lang=>'en')
    common_global_setting.menu_entries_tls.build(:language=>'en',:name=>'Global Setting',:description=>'Global Setting',:source_lang=>'en')
    common_global_setting.save

    common_authsource = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_AUTH_SOURCES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    common_authsource.menu_entries_tls.build(:language=>'zh',:name=>'LDAP认证源',:description=>'LDAP认证源',:source_lang=>'en')
    common_authsource.menu_entries_tls.build(:language=>'en',:name=>'LDAP Auth Source',:description=>'LDAP Auth Source',:source_lang=>'en')
    common_authsource.save

    common_menu = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_MENUS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    common_menu.menu_entries_tls.build(:language=>'zh',:name=>'菜单',:description=>'菜单',:source_lang=>'en')
    common_menu.menu_entries_tls.build(:language=>'en',:name=>'Menu',:description=>'Menu',:source_lang=>'en')
    common_menu.save

    common_lookup = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_LOOKUP_TYPES_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    common_lookup.menu_entries_tls.build(:language=>'zh',:name=>'快速编码',:description=>'快速编码',:source_lang=>'en')
    common_lookup.menu_entries_tls.build(:language=>'en',:name=>'Lookup Code',:description=>'Lookup Code',:source_lang=>'en')
    common_lookup.save

    common_value_set = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_VALUE_SETS_INDEX',
                                         :display_sequence=>70,
                                         :not_auto_mult=>true)
    common_value_set.menu_entries_tls.build(:language=>'zh',:name=>'值集定义',:description=>'值集定义',:source_lang=>'en')
    common_value_set.menu_entries_tls.build(:language=>'en',:name=>'Value Set',:description=>'Value Set',:source_lang=>'en')
    common_value_set.save

    base_org_menu = Irm::Menu.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',:not_auto_mult=>true)
    base_org_menu.menus_tls.build(:language=>'zh',:name=>'组织结构菜单',:description=>'组织结构菜单',:source_lang=>'en')
    base_org_menu.menus_tls.build(:language=>'en',:name=>'Organizational Structure Menu',:description=>'Organizational Structure Menu',:source_lang=>'en')
    base_org_menu.save

    base_org_mnu = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    base_org_mnu.menu_entries_tls.build(:language=>'zh',:name=>'组织结构',:description=>'组织结构',:source_lang=>'en')
    base_org_mnu.menu_entries_tls.build(:language=>'en',:name=>'Organizational Structure',:description=>'Organizational Structure',:source_lang=>'en')
    base_org_mnu.save

    org_company = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_COMPANIES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    org_company.menu_entries_tls.build(:language=>'zh',:name=>'公司',:description=>'公司',:source_lang=>'en')
    org_company.menu_entries_tls.build(:language=>'en',:name=>'Company',:description=>'Company',:source_lang=>'en')
    org_company.save

    org_org = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_ORGANIZATIONS_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    org_org.menu_entries_tls.build(:language=>'zh',:name=>'组织',:description=>'组织',:source_lang=>'en')
    org_org.menu_entries_tls.build(:language=>'en',:name=>'Organization',:description=>'Organization',:source_lang=>'en')
    org_org.save

    org_dep = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_DEPARTMENTS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    org_dep.menu_entries_tls.build(:language=>'zh',:name=>'部门',:description=>'部门',:source_lang=>'en')
    org_dep.menu_entries_tls.build(:language=>'en',:name=>'Department',:description=>'Department',:source_lang=>'en')
    org_dep.save

    org_region = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_REGIONS_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    org_region.menu_entries_tls.build(:language=>'zh',:name=>'区域',:description=>'区域',:source_lang=>'en')
    org_region.menu_entries_tls.build(:language=>'en',:name=>'Region',:description=>'Region',:source_lang=>'en')
    org_region.save

    org_site_group = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_SITE_GROUP_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    org_site_group.menu_entries_tls.build(:language=>'zh',:name=>'地点组',:description=>'地点组',:source_lang=>'en')
    org_site_group.menu_entries_tls.build(:language=>'en',:name=>'Site Group',:description=>'Site Group',:source_lang=>'en')
    org_site_group.save

    org_site = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_SITE_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    org_site.menu_entries_tls.build(:language=>'zh',:name=>'地点',:description=>'地点',:source_lang=>'en')
    org_site.menu_entries_tls.build(:language=>'en',:name=>'Site',:description=>'Site',:source_lang=>'en')
    org_site.save

    org_spt_group = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCTURE',
                                         :permission_code=>'IRM_SUPPORT_GROUP_INDEX',
                                         :display_sequence=>70,
                                         :not_auto_mult=>true)
    org_spt_group.menu_entries_tls.build(:language=>'zh',:name=>'支持组',:description=>'支持组',:source_lang=>'en')
    org_spt_group.menu_entries_tls.build(:language=>'en',:name=>'Support Group',:description=>'Support Group',:source_lang=>'en')
    org_spt_group.save

    base_permission_menu = Irm::Menu.new(:menu_code=>'IRM_PERMISSION_MENU',:not_auto_mult=>true)
    base_permission_menu.menus_tls.build(:language=>'zh',:name=>'权限菜单',:description=>'权限菜单',:source_lang=>'en')
    base_permission_menu.menus_tls.build(:language=>'en',:name=>'Permission Menu',:description=>'Permission Menu',:source_lang=>'en')
    base_permission_menu.save

    base_permission_mnu = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_PERMISSION_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    base_permission_mnu.menu_entries_tls.build(:language=>'zh',:name=>'权限',:description=>'权限',:source_lang=>'en')
    base_permission_mnu.menu_entries_tls.build(:language=>'en',:name=>'Permission',:description=>'Permission',:source_lang=>'en')
    base_permission_mnu.save

    per_identity = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_IDENTITIES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    per_identity.menu_entries_tls.build(:language=>'zh',:name=>'帐号',:description=>'帐号',:source_lang=>'en')
    per_identity.menu_entries_tls.build(:language=>'en',:name=>'Identity',:description=>'Identity',:source_lang=>'en')
    per_identity.save

    per_person = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_PEOPLE_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    per_person.menu_entries_tls.build(:language=>'zh',:name=>'人员',:description=>'人员',:source_lang=>'en')
    per_person.menu_entries_tls.build(:language=>'en',:name=>'People',:description=>'People',:source_lang=>'en')
    per_person.save

    per_function_group = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_FUNCTION_GROUPS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    per_function_group.menu_entries_tls.build(:language=>'zh',:name=>'功能组',:description=>'功能组',:source_lang=>'en')
    per_function_group.menu_entries_tls.build(:language=>'en',:name=>'Function Group',:description=>'Function Group',:source_lang=>'en')
    per_function_group.save

    per_function = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_FUNCTIONS_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    per_function.menu_entries_tls.build(:language=>'zh',:name=>'功能',:description=>'功能',:source_lang=>'en')
    per_function.menu_entries_tls.build(:language=>'en',:name=>'Function',:description=>'Function',:source_lang=>'en')
    per_function.save

    per_permission = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_PERMISSIONS_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    per_permission.menu_entries_tls.build(:language=>'zh',:name=>'权限',:description=>'权限',:source_lang=>'en')
    per_permission.menu_entries_tls.build(:language=>'en',:name=>'Permission',:description=>'Permission',:source_lang=>'en')
    per_permission.save



    #==========================================事故管理设置菜单==============================================
    
    icm_setting_menu = Irm::Menu.new(:menu_code=>'ICM_SETTING_MENU',:not_auto_mult=>true)
    icm_setting_menu.menus_tls.build(:language=>'zh',:name=>'事故管理设置菜单',:description=>'事故管理设置菜单',:source_lang=>'en')
    icm_setting_menu.menus_tls.build(:language=>'en',:name=>'Base Setting Menu',:description=>'Base Setting Menu',:source_lang=>'en')
    icm_setting_menu.save

    admin_icm_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'ICM_SETTING_MENU',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    admin_icm_setting.menu_entries_tls.build(:language=>'zh',:name=>'事故管理设置',:description=>'事故管理设置',:source_lang=>'en')
    admin_icm_setting.menu_entries_tls.build(:language=>'en',:name=>'Incident Management Setting',:description=>'Incident Management Setting',:source_lang=>'en')
    admin_icm_setting.save

    general_setting_menu = Irm::Menu.new(:menu_code=>'ICM_GENERAL_SETTING_MENU',:not_auto_mult=>true)
    general_setting_menu.menus_tls.build(:language=>'zh',:name=>'一般设置菜单',:description=>'一般设置菜单',:source_lang=>'en')
    general_setting_menu.menus_tls.build(:language=>'en',:name=>'General Setting Menu',:description=>'General Setting Menu',:source_lang=>'en')
    general_setting_menu.save

    icm_general_setting = Irm::MenuEntry.new(:menu_code=>'ICM_SETTING_MENU',
                                         :sub_menu_code=>'ICM_GENERAL_SETTING_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    icm_general_setting.menu_entries_tls.build(:language=>'zh',:name=>'一般设置',:description=>'一般设置',:source_lang=>'en')
    icm_general_setting.menu_entries_tls.build(:language=>'en',:name=>'General Setting',:description=>'General Setting',:source_lang=>'en')
    icm_general_setting.save

    general_rule_setting = Irm::MenuEntry.new(:menu_code=>'ICM_GENERAL_SETTING_MENU',
                                         :permission_code=>'ICM_RULE_SETTINGS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    general_rule_setting.menu_entries_tls.build(:language=>'zh',:name=>'规则设置',:description=>'规则设置',:source_lang=>'en')
    general_rule_setting.menu_entries_tls.build(:language=>'en',:name=>'Rule Setting',:description=>'Rule Setting',:source_lang=>'en')
    general_rule_setting.save

    incident_setting_menu = Irm::Menu.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',:not_auto_mult=>true)
    incident_setting_menu.menus_tls.build(:language=>'zh',:name=>'事故设置菜单',:description=>'事故设置菜单',:source_lang=>'en')
    incident_setting_menu.menus_tls.build(:language=>'en',:name=>'Incident Setting Menu',:description=>'Incident Setting Menu',:source_lang=>'en')
    incident_setting_menu.save

    icm_incident_setting = Irm::MenuEntry.new(:menu_code=>'ICM_SETTING_MENU',
                                         :sub_menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    icm_incident_setting.menu_entries_tls.build(:language=>'zh',:name=>'事故设置',:description=>'事故设置',:source_lang=>'en')
    icm_incident_setting.menu_entries_tls.build(:language=>'en',:name=>'Incident Setting',:description=>'Incident Setting',:source_lang=>'en')
    icm_incident_setting.save

    incident_urgence = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_URGENCE_CODES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    incident_urgence.menu_entries_tls.build(:language=>'zh',:name=>'紧急度',:description=>'紧急度',:source_lang=>'en')
    incident_urgence.menu_entries_tls.build(:language=>'en',:name=>'Urgence',:description=>'Urgence',:source_lang=>'en')
    incident_urgence.save

    incident_impact = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_IMPACT_RANGES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    incident_impact.menu_entries_tls.build(:language=>'zh',:name=>'影响度',:description=>'影响度',:source_lang=>'en')
    incident_impact.menu_entries_tls.build(:language=>'en',:name=>'Impact Range',:description=>'Impact Range',:source_lang=>'en')
    incident_impact.save

    incident_priority = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_PRIORITY_CODES_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    incident_priority.menu_entries_tls.build(:language=>'zh',:name=>'优先级',:description=>'优先级',:source_lang=>'en')
    incident_priority.menu_entries_tls.build(:language=>'en',:name=>'Priority',:description=>'Priority',:source_lang=>'en')
    incident_priority.save

    incident_status_entry = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_INCIDENT_STATUSES_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    incident_status_entry.menu_entries_tls.build(:language=>'zh',:name=>'事故单状态',:description=>'事故单状态',:source_lang=>'en')
    incident_status_entry.menu_entries_tls.build(:language=>'en',:name=>'Incident Status',:description=>'Incident Status',:source_lang=>'en')
    incident_status_entry.save

    incident_phase_entry = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_INCIDENT_PHASES_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    incident_phase_entry.menu_entries_tls.build(:language=>'zh',:name=>'事故单阶段',:description=>'事故单阶段',:source_lang=>'en')
    incident_phase_entry.menu_entries_tls.build(:language=>'en',:name=>'Incident Phase',:description=>'Incident Phase',:source_lang=>'en')
    incident_phase_entry.save

    incident_close_reason = Irm::MenuEntry.new(:menu_code=>'ICM_INCIDENT_SETTING_MENU',
                                         :permission_code=>'ICM_CLOSE_REASONS_INDEX',
                                         :display_sequence=>70,
                                         :not_auto_mult=>true)
    incident_close_reason.menu_entries_tls.build(:language=>'zh',:name=>'关闭原因',:description=>'关闭原因',:source_lang=>'en')
    incident_close_reason.menu_entries_tls.build(:language=>'en',:name=>'Incident Close Reason',:description=>'Incident Close Reason',:source_lang=>'en')
    incident_close_reason.save


    #==========================================高级设置菜单==============================================

    advance_setting_menu = Irm::Menu.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:not_auto_mult=>true)
    advance_setting_menu.menus_tls.build(:language=>'zh',:name=>'高级设置菜单',:description=>'高级设置菜单',:source_lang=>'en')
    advance_setting_menu.menus_tls.build(:language=>'en',:name=>'Advance Setting Menu',:description=>'Advance Setting Menu',:source_lang=>'en')
    advance_setting_menu.save

    admin_advance_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    admin_advance_setting.menu_entries_tls.build(:language=>'zh',:name=>'高级设置',:description=>'高级设置',:source_lang=>'en')
    admin_advance_setting.menu_entries_tls.build(:language=>'en',:name=>'Advance Setting',:description=>'Advance Setting',:source_lang=>'en')
    admin_advance_setting.save

    advance_menu = Irm::Menu.new(:menu_code=>'IRM_ADVANCE_MENU',:not_auto_mult=>true)
    advance_menu.menus_tls.build(:language=>'zh',:name=>'高级菜单',:description=>'高级菜单',:source_lang=>'en')
    advance_menu.menus_tls.build(:language=>'en',:name=>'Advance Menu',:description=>'Advance Menu',:source_lang=>'en')
    advance_menu.save

    advance_advance = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_ADVANCE_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    advance_advance.menu_entries_tls.build(:language=>'zh',:name=>'高级',:description=>'高级',:source_lang=>'en')
    advance_advance.menu_entries_tls.build(:language=>'en',:name=>'Advance',:description=>'Advance',:source_lang=>'en')
    advance_advance.save

    advance_currency = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',
                                         :permission_code=>'IRM_CURRENCIES_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    advance_currency.menu_entries_tls.build(:language=>'zh',:name=>'币种',:description=>'币种',:source_lang=>'en')
    advance_currency.menu_entries_tls.build(:language=>'en',:name=>'Currency',:description=>'Currency',:source_lang=>'en')
    advance_currency.save

    advance_language = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',
                                         :permission_code=>'IRM_LANGUAGES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    advance_language.menu_entries_tls.build(:language=>'zh',:name=>'语言',:description=>'语言',:source_lang=>'en')
    advance_language.menu_entries_tls.build(:language=>'en',:name=>'Language',:description=>'Language',:source_lang=>'en')
    advance_language.save
    
    advance_product = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_MENU',
                                         :permission_code=>'IRM_PRODUCT_MODULES_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    advance_product.menu_entries_tls.build(:language=>'zh',:name=>'产品模块',:description=>'产品模块',:source_lang=>'en')
    advance_product.menu_entries_tls.build(:language=>'en',:name=>'Product Module',:description=>'Product Module',:source_lang=>'en')
    advance_product.save

    mail_menu = Irm::Menu.new(:menu_code=>'IRM_MAIL_MENU',:not_auto_mult=>true)
    mail_menu.menus_tls.build(:language=>'zh',:name=>'邮件菜单',:description=>'邮件菜单',:source_lang=>'en')
    mail_menu.menus_tls.build(:language=>'en',:name=>'Mail Menu',:description=>'Mail Menu',:source_lang=>'en')
    mail_menu.save

    advance_mail = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_MAIL_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    advance_mail.menu_entries_tls.build(:language=>'zh',:name=>'邮件',:description=>'邮件',:source_lang=>'en')
    advance_mail.menu_entries_tls.build(:language=>'en',:name=>'Mail',:description=>'Mail',:source_lang=>'en')
    advance_mail.save


    mail_condition = Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',
                                         :permission_code=>'IRM_CONDITIONS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    mail_condition.menu_entries_tls.build(:language=>'zh',:name=>'Condition',:description=>'Condition',:source_lang=>'en')
    mail_condition.menu_entries_tls.build(:language=>'en',:name=>'Condition',:description=>'Condition',:source_lang=>'en')
    mail_condition.save

    mail_action = Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',
                                         :permission_code=>'IRM_ACTIONS_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    mail_action.menu_entries_tls.build(:language=>'zh',:name=>'Action',:description=>'Action',:source_lang=>'en')
    mail_action.menu_entries_tls.build(:language=>'en',:name=>'Action',:description=>'Action',:source_lang=>'en')
    mail_action.save


    mail_script = Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',
                                         :permission_code=>'IRM_SCRIPTS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    mail_script.menu_entries_tls.build(:language=>'zh',:name=>'Script',:description=>'Script',:source_lang=>'en')
    mail_script.menu_entries_tls.build(:language=>'en',:name=>'Script',:description=>'Script',:source_lang=>'en')
    mail_script.save

    mail_tempalate = Irm::MenuEntry.new(:menu_code=>'IRM_MAIL_MENU',
                                         :permission_code=>'IRM_TEMPLATES_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    mail_tempalate.menu_entries_tls.build(:language=>'zh',:name=>'模板',:description=>'模板',:source_lang=>'en')
    mail_tempalate.menu_entries_tls.build(:language=>'en',:name=>'Template',:description=>'Template',:source_lang=>'en')
    mail_tempalate.save

    #==========================================页面菜单==============================================
    entrance_menu = Irm::Menu.new(:menu_code=>'IRM_ENTRANCE_MENU',:not_auto_mult=>true)
    entrance_menu.menus_tls.build(:language=>'zh',:name=>'页面顶层菜单',:description=>'页面顶层菜单',:source_lang=>'en')
    entrance_menu.menus_tls.build(:language=>'en',:name=>'Top Page Menu',:description=>'Top Page Menu',:source_lang=>'en')
    entrance_menu.save

    #==========================================服务运营中心菜单==============================================
    service_operation_menu = Irm::Menu.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:not_auto_mult=>true)
    service_operation_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心菜单',:description=>'服务运营中心菜单',:source_lang=>'en')
    service_operation_menu.menus_tls.build(:language=>'en',:name=>'Service Operations Center Menu',:description=>'Service Operations Center Menu',:source_lang=>'en')
    service_operation_menu.save

    entrance_soc = Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    entrance_soc.menu_entries_tls.build(:language=>'zh',:name=>'服务运营中心',:description=>'服务运营中心',:source_lang=>'en')
    entrance_soc.menu_entries_tls.build(:language=>'en',:name=>'Service Operations Center',:description=>'Service Operations Center',:source_lang=>'en')
    entrance_soc.save

    soc_home_page_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_HOME_PAGE_MENU',:not_auto_mult=>true)
    soc_home_page_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心主页菜单',:description=>'服务运营中心主页菜单',:source_lang=>'en')
    soc_home_page_menu.menus_tls.build(:language=>'en',:name=>'SOC Home Page Menu',:description=>'SOC Home Page Menu',:source_lang=>'en')
    soc_home_page_menu.save

    soc_home_page = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_HOME_PAGE_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    soc_home_page.menu_entries_tls.build(:language=>'zh',:name=>'主页',:description=>'主页',:source_lang=>'en')
    soc_home_page.menu_entries_tls.build(:language=>'en',:name=>'Home Page',:description=>'Home Page',:source_lang=>'en')
    soc_home_page.save



    soc_incident_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',:not_auto_mult=>true)
    soc_incident_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心事故菜单',:description=>'服务运营中心事故菜单',:source_lang=>'en')
    soc_incident_menu.menus_tls.build(:language=>'en',:name=>'SOC Incident Menu',:description=>'SOC Incident Menu',:source_lang=>'en')
    soc_incident_menu.save

    soc_incident = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_INCIDENT_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    soc_incident.menu_entries_tls.build(:language=>'zh',:name=>'事故',:description=>'事故',:source_lang=>'en')
    soc_incident.menu_entries_tls.build(:language=>'en',:name=>'Incident',:description=>'Incident',:source_lang=>'en')
    soc_incident.save

    soc_problem_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_PROBLEM_MENU',:not_auto_mult=>true)
    soc_problem_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心问题菜单',:description=>'服务运营中心问题菜单',:source_lang=>'en')
    soc_problem_menu.menus_tls.build(:language=>'en',:name=>'SOC Problem Menu',:description=>'SOC Problem Menu',:source_lang=>'en')
    soc_problem_menu.save

    soc_problem = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_PROBLEM_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    soc_problem.menu_entries_tls.build(:language=>'zh',:name=>'问题',:description=>'问题',:source_lang=>'en')
    soc_problem.menu_entries_tls.build(:language=>'en',:name=>'Problem',:description=>'Problem',:source_lang=>'en')
    soc_problem.save

    soc_kb_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_KB_MENU',:not_auto_mult=>true)
    soc_kb_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心知识库菜单',:description=>'服务运营中心知识库菜单',:source_lang=>'en')
    soc_kb_menu.menus_tls.build(:language=>'en',:name=>'SOC Knowledge Base Menu',:description=>'SOC Knowledge Base Menu',:source_lang=>'en')
    soc_kb_menu.save

    soc_kb = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_KB_MENU',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    soc_kb.menu_entries_tls.build(:language=>'zh',:name=>'知识库',:description=>'知识库',:source_lang=>'en')
    soc_kb.menu_entries_tls.build(:language=>'en',:name=>'Knowledge Base',:description=>'Knowledge Base',:source_lang=>'en')
    soc_kb.save

    soc_rp_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_RP_MENU',:not_auto_mult=>true)
    soc_rp_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心报表菜单',:description=>'服务运营中心报表菜单',:source_lang=>'en')
    soc_rp_menu.menus_tls.build(:language=>'en',:name=>'SOC Report Menu',:description=>'SOC Report Menu',:source_lang=>'en')
    soc_rp_menu.save

    soc_rp = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_RP_MENU',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    soc_rp.menu_entries_tls.build(:language=>'zh',:name=>'报表',:description=>'报表',:source_lang=>'en')
    soc_rp.menu_entries_tls.build(:language=>'en',:name=>'Report',:description=>'Report',:source_lang=>'en')
    soc_rp.save

    #==========================================变更发布中心菜单==============================================
    change_management_menu = Irm::Menu.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',:not_auto_mult=>true)
    change_management_menu.menus_tls.build(:language=>'zh',:name=>'变更发布中心菜单',:description=>'变更发布中心菜单',:source_lang=>'en')
    change_management_menu.menus_tls.build(:language=>'en',:name=>'Chanage Management Menu',:description=>'Chanage Management Menu',:source_lang=>'en')
    change_management_menu.save

    entrance_cm = Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    entrance_cm.menu_entries_tls.build(:language=>'zh',:name=>'变更发布中心',:description=>'变更发布中心',:source_lang=>'en')
    entrance_cm.menu_entries_tls.build(:language=>'en',:name=>'Chanage Management',:description=>'Chanage Management',:source_lang=>'en')
    entrance_cm.save

    cm_home_page_menu = Irm::Menu.new(:menu_code=>'IRM_CM_HOME_PAGE_MENU',:not_auto_mult=>true)
    cm_home_page_menu.menus_tls.build(:language=>'zh',:name=>'变更发布中心主页菜单',:description=>'变更发布中心主页菜单',:source_lang=>'en')
    cm_home_page_menu.menus_tls.build(:language=>'en',:name=>'CM Home Page Menu',:description=>'CM Home Page Menu',:source_lang=>'en')
    cm_home_page_menu.save

    cm_home_page = Irm::MenuEntry.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',
                                         :sub_menu_code=>'IRM_CM_HOME_PAGE_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    cm_home_page.menu_entries_tls.build(:language=>'zh',:name=>'主页',:description=>'主页',:source_lang=>'en')
    cm_home_page.menu_entries_tls.build(:language=>'en',:name=>'Home Page',:description=>'Home Page',:source_lang=>'en')
    cm_home_page.save

    cm_change = Irm::Menu.new(:menu_code=>'IRM_CM_CHANGE_MENU',:not_auto_mult=>true)
    cm_change.menus_tls.build(:language=>'zh',:name=>'变更菜单',:description=>'变更菜单',:source_lang=>'en')
    cm_change.menus_tls.build(:language=>'en',:name=>'CM Change Menu',:description=>'CM Change Menu',:source_lang=>'en')
    cm_change.save

    cm_c = Irm::MenuEntry.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',
                                         :sub_menu_code=>'IRM_CM_CHANGE_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    cm_c.menu_entries_tls.build(:language=>'zh',:name=>'变更',:description=>'变更',:source_lang=>'en')
    cm_c.menu_entries_tls.build(:language=>'en',:name=>'Change',:description=>'Change',:source_lang=>'en')
    cm_c.save


    cm_publish = Irm::Menu.new(:menu_code=>'IRM_CM_PUBLISH_MENU',:not_auto_mult=>true)
    cm_publish.menus_tls.build(:language=>'zh',:name=>'变更菜单',:description=>'变更菜单',:source_lang=>'en')
    cm_publish.menus_tls.build(:language=>'en',:name=>'CM Publish Menu',:description=>'CM Publish Menu',:source_lang=>'en')
    cm_publish.save

    cm_p = Irm::MenuEntry.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',
                                         :sub_menu_code=>'IRM_CM_PUBLISH_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    cm_p.menu_entries_tls.build(:language=>'zh',:name=>'发布',:description=>'发布',:source_lang=>'en')
    cm_p.menu_entries_tls.build(:language=>'en',:name=>'Publish',:description=>'Publish',:source_lang=>'en')
    cm_p.save

    #==========================================Oracle EBS最佳实践菜单==============================================
    ebs_menu = Irm::Menu.new(:menu_code=>'IRM_ORACLE_EBS_MENU',:not_auto_mult=>true)
    ebs_menu.menus_tls.build(:language=>'zh',:name=>'ORAL_EBS最佳实践菜单',:description=>'ORAL_EBS最佳实践菜单',:source_lang=>'en')
    ebs_menu.menus_tls.build(:language=>'en',:name=>'Oracle EBS Menu',:description=>'Oracle EBS Menu',:source_lang=>'en')
    ebs_menu.save

    entrance_ebs = Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_ORACLE_EBS_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    entrance_ebs.menu_entries_tls.build(:language=>'zh',:name=>'Oracle EBS最佳实践',:description=>'Oracle EBS最佳实践',:source_lang=>'en')
    entrance_ebs.menu_entries_tls.build(:language=>'en',:name=>'Oracle EBS Best Practices',:description=>'Oracle EBS Best Practices',:source_lang=>'en')
    entrance_ebs.save

    ebs_home_page_menu = Irm::Menu.new(:menu_code=>'IRM_EBS_HOME_PAGE_MENU',:not_auto_mult=>true)
    ebs_home_page_menu.menus_tls.build(:language=>'zh',:name=>'主页菜单',:description=>'主页菜单',:source_lang=>'en')
    ebs_home_page_menu.menus_tls.build(:language=>'en',:name=>'Home Page Menu',:description=>'Home Page Menu',:source_lang=>'en')
    ebs_home_page_menu.save

    ebs_home_page = Irm::MenuEntry.new(:menu_code=>'IRM_ORACLE_EBS_MENU',
                                         :sub_menu_code=>'IRM_EBS_HOME_PAGE_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    ebs_home_page.menu_entries_tls.build(:language=>'zh',:name=>'主页',:description=>'主页',:source_lang=>'en')
    ebs_home_page.menu_entries_tls.build(:language=>'en',:name=>'Home Page',:description=>'Home Page',:source_lang=>'en')
    ebs_home_page.save

    ebs_asset = Irm::Menu.new(:menu_code=>'IRM_EBS_ASSET_MENU',:not_auto_mult=>true)
    ebs_asset.menus_tls.build(:language=>'zh',:name=>'资产菜单',:description=>'资产菜单',:source_lang=>'en')
    ebs_asset.menus_tls.build(:language=>'en',:name=>'EBS Asset Menu',:description=>'EBS Asset Menu',:source_lang=>'en')
    ebs_asset.save

    ebs_a = Irm::MenuEntry.new(:menu_code=>'IRM_ORACLE_EBS_MENU',
                                         :sub_menu_code=>'IRM_EBS_ASSET_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    ebs_a.menu_entries_tls.build(:language=>'zh',:name=>'资产',:description=>'资产',:source_lang=>'en')
    ebs_a.menu_entries_tls.build(:language=>'en',:name=>'Asset',:description=>'Asset',:source_lang=>'en')
    ebs_a.save

    ebs_change = Irm::Menu.new(:menu_code=>'IRM_EBS_CHANGE_MENU',:not_auto_mult=>true)
    ebs_change.menus_tls.build(:language=>'zh',:name=>'变更菜单',:description=>'变更菜单',:source_lang=>'en')
    ebs_change.menus_tls.build(:language=>'en',:name=>'EBS Change Menu',:description=>'EBS Change Menu',:source_lang=>'en')
    ebs_change.save

    ebs_c = Irm::MenuEntry.new(:menu_code=>'IRM_ORACLE_EBS_MENU',
                                         :sub_menu_code=>'IRM_EBS_CHANGE_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    ebs_c.menu_entries_tls.build(:language=>'zh',:name=>'变更',:description=>'变更',:source_lang=>'en')
    ebs_c.menu_entries_tls.build(:language=>'en',:name=>'Change',:description=>'Change',:source_lang=>'en')
    ebs_c.save


    ebs_publish = Irm::Menu.new(:menu_code=>'IRM_EBS_PUBLISH_MENU',:not_auto_mult=>true)
    ebs_publish.menus_tls.build(:language=>'zh',:name=>'变更菜单',:description=>'变更菜单',:source_lang=>'en')
    ebs_publish.menus_tls.build(:language=>'en',:name=>'EBS Publish Menu',:description=>'EBS Publish Menu',:source_lang=>'en')
    ebs_publish.save

    ebs_p = Irm::MenuEntry.new(:menu_code=>'IRM_ORACLE_EBS_MENU',
                                         :sub_menu_code=>'IRM_EBS_PUBLISH_MENU',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    ebs_p.menu_entries_tls.build(:language=>'zh',:name=>'发布',:description=>'发布',:source_lang=>'en')
    ebs_p.menu_entries_tls.build(:language=>'en',:name=>'Publish',:description=>'Publish',:source_lang=>'en')
    ebs_p.save
  end

  def self.down
  end
end
