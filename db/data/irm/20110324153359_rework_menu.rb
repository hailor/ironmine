# -*- coding: utf-8 -*-
class ReworkMenu < ActiveRecord::Migration
  def self.up
    Irm::Menu.delete_all
    Irm::MenusTl.delete_all
    Irm::MenuEntry.delete_all
    Irm::MenuEntriesTl.delete_all
    irm_irm_setting_entrance_menu= Irm::Menu.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_setting_entrance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'顶层设置',:description=>'顶层设置菜单')
    irm_irm_setting_entrance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Top Setting',:description=>'Top Setting menu')
    irm_irm_setting_entrance_menu.save
    irm_irm_personal_menu= Irm::Menu.new(:menu_code=>'IRM_PERSONAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_personal_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置')
    irm_irm_personal_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Setting',:description=>'Personal Setting')
    irm_irm_personal_menu.save
    irm_irm_personal_setting_menu= Irm::Menu.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_personal_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置菜单')
    irm_irm_personal_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Setting',:description=>'Personal Setting menu')
    irm_irm_personal_setting_menu.save
    irm_irm_personal_info_menu= Irm::Menu.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_personal_info_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的个人信息',:description=>'我的个人信息菜单')
    irm_irm_personal_info_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Information',:description=>'Personal info menu')
    irm_irm_personal_info_menu.save
    irm_irm_system_setting_menu= Irm::Menu.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_system_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统管理员',:description=>'系统管理员')
    irm_irm_system_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Systme Administrator',:description=>'Systme Administrator')
    irm_irm_system_setting_menu.save
    irm_irm_base_setting_menu= Irm::Menu.new(:menu_code=>'IRM_BASE_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_base_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'基础设置',:description=>'基础设置菜单')
    irm_irm_base_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Base setting',:description=>'Base setting')
    irm_irm_base_setting_menu.save
    irm_irm_common_setting_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_common_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'常用设置',:description=>'常用设置菜单')
    irm_irm_common_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Common setting',:description=>'Common setting')
    irm_irm_common_setting_menu.save
    irm_irm_common_lookup_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_lookup_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码菜单')
    irm_irm_common_lookup_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup code',:description=>'Lookup code')
    irm_irm_common_lookup_menu.save
    irm_irm_common_value_set_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_value_set_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义菜单')
    irm_irm_common_value_set_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex value set',:description=>'Flex value set')
    irm_irm_common_value_set_menu.save
    irm_irm_common_flex_segment_menu= Irm::Menu.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_common_flex_segment_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段值',:description=>'弹性域段值菜单')
    irm_irm_common_flex_segment_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex segments',:description=>'Flex segments')
    irm_irm_common_flex_segment_menu.save
    irm_irm_organization_struct_menu= Irm::Menu.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_organization_struct_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构菜单')
    irm_irm_organization_struct_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization structure',:description=>'Organization structure')
    irm_irm_organization_struct_menu.save
    irm_irm_org_support_group_menu= Irm::Menu.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_org_support_group_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_irm_org_support_group_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support group',:description=>'Support group')
    irm_irm_org_support_group_menu.save
    irm_irm_permission_menu= Irm::Menu.new(:menu_code=>'IRM_PERMISSION_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_permission_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_irm_permission_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_irm_permission_menu.save
    irm_irm_permission_people_menu= Irm::Menu.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_permission_people_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员管理',:description=>'人员管理')
    irm_irm_permission_people_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'People menu',:description=>'People menu')
    irm_irm_permission_people_menu.save
    irm_irm_report_top_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_TOP_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_report_top_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表管理',:description=>'报表管理')
    irm_irm_report_top_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report manage',:description=>'Report manage')
    irm_irm_report_top_menu.save
    irm_irm_report_group_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_report_group_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_irm_report_group_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group',:description=>'Report group')
    irm_irm_report_group_menu.save
    icm_icm_admin_setting_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理设置',:description=>'事故管理设置')
    icm_icm_admin_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident admin setting',:description=>'Incident admin setting')
    icm_icm_admin_setting_menu.save
    icm_icm_admin_general_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_GENERAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_general_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理一般设置',:description=>'事故管理一般设置')
    icm_icm_admin_general_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident admin general',:description=>'Incident admin general')
    icm_icm_admin_general_menu.save
    icm_icm_admin_incident_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_incident_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故菜单')
    icm_icm_admin_incident_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_icm_admin_incident_menu.save
    skm_skm_admin_menu= Irm::Menu.new(:menu_code=>'SKM_ADMIN_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_skm_admin_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理',:description=>'知识库管理菜单')
    skm_skm_admin_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge admin',:description=>'Service knowledge admin')
    skm_skm_admin_menu.save
    skm_skm_admin_general_menu= Irm::Menu.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_skm_admin_general_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库一般设置',:description=>'知识库一般设置')
    skm_skm_admin_general_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge general',:description=>'Service knowledge general')
    skm_skm_admin_general_menu.save
    irm_irm_advance_setting_menu= Irm::Menu.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_advance_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级设置',:description=>'高级设置')
    irm_irm_advance_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance setting',:description=>'Advance setting')
    irm_irm_advance_setting_menu.save
    irm_irm_advance_menu= Irm::Menu.new(:menu_code=>'IRM_ADVANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_advance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级',:description=>'高级')
    irm_irm_advance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_irm_advance_menu.save
    irm_irm_automator_menu= Irm::Menu.new(:menu_code=>'IRM_AUTOMATOR_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_automator_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator_menu.save
    irm_irm_entrance_menu= Irm::Menu.new(:menu_code=>'IRM_ENTRANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_entrance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务类顶层',:description=>'业务类顶层菜单')
    irm_irm_entrance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Top bussiness menu',:description=>'Top bussiness')
    irm_irm_entrance_menu.save
    irm_irm_service_operation_menu= Irm::Menu.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_service_operation_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务运营中心',:description=>'服务运营中心')
    irm_irm_service_operation_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service operation center',:description=>'Service operation center')
    irm_irm_service_operation_menu.save
    irm_irm_home_menu= Irm::Menu.new(:menu_code=>'IRM_HOME_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_home_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务运营中心服务运营中心首页',:description=>'')
    irm_irm_home_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC home page',:description=>'SOC home page')
    irm_irm_home_menu.save
    irm_irm_incident_menu= Irm::Menu.new(:menu_code=>'IRM_INCIDENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_incident_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    irm_irm_incident_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC incident',:description=>'SOC incident')
    irm_irm_incident_menu.save
    csi_irm_survey_menu= Irm::Menu.new(:menu_code=>'IRM_SURVEY_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    csi_irm_survey_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'卷调查',:description=>'SOC问卷调查')
    csi_irm_survey_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC survey',:description=>'SOC survey')
    csi_irm_survey_menu.save
    skm_irm_service_knowledge_menu= Irm::Menu.new(:menu_code=>'IRM_SERVICE_KNOWLEDGE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_irm_service_knowledge_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_irm_service_knowledge_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC service knowledge',:description=>'SOC service knowledge')
    skm_irm_service_knowledge_menu.save
    irm_irm_file_management_menu= Irm::Menu.new(:menu_code=>'IRM_FILE_MANAGEMENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_file_management_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    irm_irm_file_management_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC file management',:description=>'SOC file management')
    irm_irm_file_management_menu.save
    irm_irm_report_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_report_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表中心',:description=>'报表中心')
    irm_irm_report_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC report',:description=>'SOC report')
    irm_irm_report_menu.save
    irm_irm_developer_menu= Irm::Menu.new(:menu_code=>'IRM_DEVELOPER_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_developer_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'应用开发员',:description=>'应用开发员')
    irm_irm_developer_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Application Developer',:description=>'Application Developer')
    irm_irm_developer_menu.save
    irm_irm_dev_permission_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_PERMISSION_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_permission_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_irm_dev_permission_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_irm_dev_permission_menu.save
    irm_irm_dev_menus_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_MENUS_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_dev_menus_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单设置',:description=>'菜单设置菜单')
    irm_irm_dev_menus_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu setting',:description=>'Menu setting')
    irm_irm_dev_menus_menu.save
    irm_irm_dev_report_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_REPORT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_report_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表管理',:description=>'报表管理')
    irm_irm_dev_report_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report manage',:description=>'Report manage')
    irm_irm_dev_report_menu.save
    irm_irm_dev_automator_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_AUTOMATOR_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_automator_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_dev_automator_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_dev_automator_menu.save
    irm_irm_dev_advance_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_ADVANCE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_advance_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级',:description=>'高级')
    irm_irm_dev_advance_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_irm_dev_advance_menu.save
    irm_irm_dev_hepler_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_HEPLER_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_hepler_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_irm_dev_hepler_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer tools',:description=>'Developer tools')
    irm_irm_dev_hepler_menu.save
    
    irm_menu_entiry_2= Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:sub_menu_code=>'IRM_PERSONAL_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置')
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Setting',:description=>'Personal Setting')
    irm_menu_entiry_2.save
    irm_menu_entiry_3= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_MENU',:sub_menu_code=>'IRM_PERSONAL_SETTING_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置')
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal',:description=>'Personal Setting')
    irm_menu_entiry_3.save
    irm_menu_entiry_4= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_SETTING_MENU',:sub_menu_code=>'IRM_PERSONAL_INFO_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的信息',:description=>'我的信息')
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Infomation',:description=>'Personal Information')
    irm_menu_entiry_4.save
    irm_menu_entiry_5= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/my_info',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人信息',:description=>'个人信息')
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'My Infomation',:description=>'My Information')
    irm_menu_entiry_5.save
    irm_menu_entiry_6= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/my_password',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'更改密码',:description=>'更改密码')
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Change Password',:description=>'Change Password')
    irm_menu_entiry_6.save
    irm_menu_entiry_7= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/my_avatar',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'更改头像',:description=>'更改头像')
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Change Avatar',:description=>'Change Avatar')
    irm_menu_entiry_7.save
    irm_menu_entiry_8= Irm::MenuEntry.new(:menu_code=>'IRM_PERSONAL_INFO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/my_login_history',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'登录历史',:description=>'登录历史')
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Login History',:description=>'Login History')
    irm_menu_entiry_8.save
    irm_menu_entiry_10= Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:sub_menu_code=>'IRM_SYSTEM_SETTING_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统管理员',:description=>'系统管理员')
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'System Administrator',:description=>'System Administrator')
    irm_menu_entiry_10.save
    irm_menu_entiry_11= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'IRM_BASE_SETTING_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'基础设置',:description=>'基础设置')
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General',:description=>'General')
    irm_menu_entiry_11.save
    irm_menu_entiry_12= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_SETTING_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'常用设置',:description=>'常用设置')
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Common',:description=>'Common')
    irm_menu_entiry_12.save
    irm_menu_entiry_13= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:page_controller=>'irm/global_settings',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'全局设置',:description=>'全局设置')
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global',:description=>'Global')
    irm_menu_entiry_13.save
    irm_menu_entiry_14= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:page_controller=>'irm/auth_sources',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP认证',:description=>'LDAP认证')
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Authsource',:description=>'LDAP Authsource')
    irm_menu_entiry_14.save
    irm_menu_entiry_15= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_LOOKUP_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码')
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Code',:description=>'Lookup Code')
    irm_menu_entiry_15.save
    irm_menu_entiry_16= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/lookup_types',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码类型',:description=>'快速编码类型')
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Type',:description=>'Lookup Type')
    irm_menu_entiry_16.save
    irm_menu_entiry_17= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_LOOKUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/lookup_values',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码值',:description=>'快速编码值')
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Value',:description=>'Lookup Value')
    irm_menu_entiry_17.save
    irm_menu_entiry_18= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:page_controller=>'irm/general_categories',:display_sequence=>45,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公共公类',:description=>'公共公类')
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General Category',:description=>'General Category')
    irm_menu_entiry_18.save
    irm_menu_entiry_19= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_VALUE_SET_MENU',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义')
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Value Set',:description=>'Flex Value Set')
    irm_menu_entiry_19.save
    irm_menu_entiry_20= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:sub_menu_code=>nil,:page_controller=>'irm/flex_value_sets',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集',:description=>'值集')
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set',:description=>'Value Set')
    irm_menu_entiry_20.save
    irm_menu_entiry_21= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_VALUE_SET_MENU',:sub_menu_code=>nil,:page_controller=>'irm/flex_values',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集值',:description=>'值集值')
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set Value',:description=>'Value Set Value')
    irm_menu_entiry_21.save
    irm_menu_entiry_22= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>nil,:page_controller=>'irm/id_flexes',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域',:description=>'弹性域结构')
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Struct',:description=>'Flex Struct')
    irm_menu_entiry_22.save
    irm_menu_entiry_23= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:page_controller=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构')
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments',:description=>'Flex Segments')
    irm_menu_entiry_23.save
    irm_menu_entiry_24= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/id_flex_structures',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构')
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments Struct',:description=>'Flex Segments Struct')
    irm_menu_entiry_24.save
    irm_menu_entiry_25= Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_FLEX_SEGMENT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/id_flex_segments',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段值',:description=>'弹性域段值')
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments Value',:description=>'Flex Segments Value')
    irm_menu_entiry_25.save
    irm_menu_entiry_26= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构')
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization Structure',:description=>'Organization Structure')
    irm_menu_entiry_26.save
    irm_menu_entiry_27= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/companies',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司',:description=>'公司')
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company',:description=>'Company')
    irm_menu_entiry_27.save
    irm_menu_entiry_28= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/organizations',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
    irm_menu_entiry_28.save
    irm_menu_entiry_29= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/departments',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'部门',:description=>'部门')
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Department',:description=>'Department')
    irm_menu_entiry_29.save
    irm_menu_entiry_30= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/regions',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'区域',:description=>'区域')
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Region',:description=>'Region')
    irm_menu_entiry_30.save
    irm_menu_entiry_31= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/site_groups',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点组',:description=>'地点组')
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site Group',:description=>'Site Group')
    irm_menu_entiry_31.save
    irm_menu_entiry_32= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/sites',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点',:description=>'地点')
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site',:description=>'Site')
    irm_menu_entiry_32.save
    irm_menu_entiry_33= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:page_controller=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group')
    irm_menu_entiry_33.save
    irm_menu_entiry_34= Irm::MenuEntry.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/support_groups',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group')
    irm_menu_entiry_34.save
    irm_menu_entiry_35= Irm::MenuEntry.new(:menu_code=>'IRM_ORG_SUPPORT_GROUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/support_group_members',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组成员',:description=>'支持组成员')
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group Member',:description=>'Support Group Member')
    irm_menu_entiry_35.save
    irm_menu_entiry_36= Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_STRUCT_MENU',:sub_menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:page_controller=>nil,:display_sequence=>35,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_36.save
    irm_menu_entiry_37= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/people',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_37.save
    irm_menu_entiry_38= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/company_accesses',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员访问公司限制',:description=>'人员访问公司限制')
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company Access',:description=>'Company Access')
    irm_menu_entiry_38.save
    irm_menu_entiry_39= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_PERMISSION_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_menu_entiry_39.save
    irm_menu_entiry_40= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>nil,:page_controller=>'irm/identities',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'账号',:description=>'账号')
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Identity',:description=>'Identity')
    irm_menu_entiry_40.save
    irm_menu_entiry_41= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>nil,:page_controller=>'irm/roles',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'角色',:description=>'角色')
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Role',:description=>'Role')
    irm_menu_entiry_41.save
    irm_menu_entiry_42= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>'IRM_REPORT_GROUP_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group',:description=>'Report Group')
    irm_menu_entiry_42.save
    irm_menu_entiry_43= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/report_groups',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group',:description=>'Report Group')
    irm_menu_entiry_43.save
    irm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_GROUP_MENU',:sub_menu_code=>nil,:page_controller=>'irm/report_group_members',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组成员',:description=>'报表组成员')
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group Member',:description=>'Report Group Member')
    irm_menu_entiry_44.save
    icm_menu_entiry_45= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_SETTING_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_45.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理设置',:description=>'事故管理设置')
    icm_menu_entiry_45.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_menu_entiry_45.save
    icm_menu_entiry_46= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_GENERAL_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_46.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'一般设置',:description=>'一般设置')
    icm_menu_entiry_46.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General',:description=>'General')
    icm_menu_entiry_46.save
    icm_menu_entiry_47= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:page_controller=>'icm/rule_settings',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_47.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'规则设置',:description=>'规则设置')
    icm_menu_entiry_47.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Rule',:description=>'Rule')
    icm_menu_entiry_47.save
    icm_menu_entiry_48= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_INCIDENT_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_48.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故')
    icm_menu_entiry_48.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_menu_entiry_48.save
    icm_menu_entiry_49= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/urgence_codes',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_49.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'紧急度',:description=>'紧急度')
    icm_menu_entiry_49.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Urgency',:description=>'Urgency')
    icm_menu_entiry_49.save
    icm_menu_entiry_50= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/impact_ranges',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_50.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'影响度',:description=>'影响度')
    icm_menu_entiry_50.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Impact Range',:description=>'Impact Range')
    icm_menu_entiry_50.save
    icm_menu_entiry_51= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/priority_codes',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_51.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'优先级',:description=>'优先级')
    icm_menu_entiry_51.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Priority',:description=>'Priority')
    icm_menu_entiry_51.save
    icm_menu_entiry_52= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/group_assignments',:display_sequence=>35,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_52.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组指派规则',:description=>'组指派规则')
    icm_menu_entiry_52.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group Assignment',:description=>'Support Group Assignment')
    icm_menu_entiry_52.save
    icm_menu_entiry_53= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/incident_phases',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_53.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单阶段',:description=>'事故单位阶段')
    icm_menu_entiry_53.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Phase',:description=>'Incident Phase')
    icm_menu_entiry_53.save
    icm_menu_entiry_54= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/incident_statuses',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_54.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单状态',:description=>'事故单位状态')
    icm_menu_entiry_54.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Status',:description=>'Incident Status')
    icm_menu_entiry_54.save
    icm_menu_entiry_55= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/close_reasons',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_55.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭原因',:description=>'关闭原因')
    icm_menu_entiry_55.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close Reason',:description=>'Close Reason')
    icm_menu_entiry_55.save
    skm_menu_entiry_56= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'SKM_ADMIN_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_56.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理',:description=>'知识库管理')
    skm_menu_entiry_56.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_56.save
    skm_menu_entiry_57= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_MENU',:sub_menu_code=>'SKM_ADMIN_GENERAL_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_57.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'一般设置',:description=>'一般设置')
    skm_menu_entiry_57.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General',:description=>'General')
    skm_menu_entiry_57.save
    skm_menu_entiry_58= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:page_controller=>'skm/entry_statuses',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_58.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库状态',:description=>'知识库状态')
    skm_menu_entiry_58.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry Status',:description=>'Entry Status')
    skm_menu_entiry_58.save
    skm_menu_entiry_59= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:page_controller=>'skm/entry_templates',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_59.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库模板',:description=>'知识库模板')
    skm_menu_entiry_59.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry Template',:description=>'Entry Template')
    skm_menu_entiry_59.save
    skm_menu_entiry_60= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:page_controller=>'skm/entry_template_elements',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_60.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库模板元素',:description=>'知识库模板元素')
    skm_menu_entiry_60.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry Template Element',:description=>'Entry Template Element')
    skm_menu_entiry_60.save
    irm_menu_entiry_61= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'IRM_ADVANCE_SETTING_MENU',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级设置',:description=>'高级设置')
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_menu_entiry_61.save
    irm_menu_entiry_62= Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:sub_menu_code=>'IRM_AUTOMATOR_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_menu_entiry_62.save
    irm_menu_entiry_63= Irm::MenuEntry.new(:menu_code=>'IRM_AUTOMATOR_MENU',:sub_menu_code=>nil,:page_controller=>'irm/scripts',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_63.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务宏',:description=>'服务宏')
    irm_menu_entiry_63.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Script',:description=>'Script')
    irm_menu_entiry_63.save
    irm_menu_entiry_64= Irm::MenuEntry.new(:menu_code=>'IRM_AUTOMATOR_MENU',:sub_menu_code=>nil,:page_controller=>'irm/mail_templates',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_64.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件模板',:description=>'邮件模板')
    irm_menu_entiry_64.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Template',:description=>'Mail template')
    irm_menu_entiry_64.save
    irm_menu_entiry_65= Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',:sub_menu_code=>'IRM_SERVICE_OPERATION_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_65.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务中心',:description=>'服务中心')
    irm_menu_entiry_65.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Center',:description=>'Service Center')
    irm_menu_entiry_65.save
    irm_menu_entiry_66= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_HOME_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_66.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_66.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    irm_menu_entiry_66.save
    irm_menu_entiry_67= Irm::MenuEntry.new(:menu_code=>'IRM_HOME_MENU',:sub_menu_code=>nil,:page_controller=>'irm/home',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_67.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_67.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home Page',:description=>'Home Page')
    irm_menu_entiry_67.save
    icm_menu_entiry_68= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_INCIDENT_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_68.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故')
    icm_menu_entiry_68.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_menu_entiry_68.save
    icm_menu_entiry_69= Irm::MenuEntry.new(:menu_code=>'IRM_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/incident_requests',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_69.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_menu_entiry_69.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request',:description=>'Incident Request')
    icm_menu_entiry_69.save
    icm_menu_entiry_70= Irm::MenuEntry.new(:menu_code=>'IRM_INCIDENT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/incident_journals',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_70.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单回复',:description=>'事故单回复')
    icm_menu_entiry_70.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request Journal',:description=>'Incident Request Journal')
    icm_menu_entiry_70.save
    csi_menu_entiry_71= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SURVEY_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_71.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷')
    csi_menu_entiry_71.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_71.save
    csi_menu_entiry_72= Irm::MenuEntry.new(:menu_code=>'IRM_SURVEY_MENU',:sub_menu_code=>nil,:page_controller=>'csi/surveys',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_72.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷')
    csi_menu_entiry_72.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_72.save
    csi_menu_entiry_73= Irm::MenuEntry.new(:menu_code=>'IRM_SURVEY_MENU',:sub_menu_code=>nil,:page_controller=>'csi/survey_subjects',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_73.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问题',:description=>'调查问题')
    csi_menu_entiry_73.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery Subject',:description=>'Survery Subject')
    csi_menu_entiry_73.save
    csi_menu_entiry_74= Irm::MenuEntry.new(:menu_code=>'IRM_SURVEY_MENU',:sub_menu_code=>nil,:page_controller=>'csi/survey_ranges',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_74.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷范围',:description=>'调查问卷范围')
    csi_menu_entiry_74.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery Range',:description=>'Survery Range')
    csi_menu_entiry_74.save
    skm_menu_entiry_75= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SERVICE_KNOWLEDGE_MENU',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_75.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_menu_entiry_75.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_75.save
    skm_menu_entiry_76= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_KNOWLEDGE_MENU',:sub_menu_code=>nil,:page_controller=>'skm/entry_headers',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_76.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库文章',:description=>'知识库文章')
    skm_menu_entiry_76.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_76.save
    skm_menu_entiry_77= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_FILE_MANAGEMENT_MENU',:page_controller=>nil,:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_77.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_77.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_77.save
    skm_menu_entiry_78= Irm::MenuEntry.new(:menu_code=>'IRM_FILE_MANAGEMENT_MENU',:sub_menu_code=>nil,:page_controller=>'skm/file_managements',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_78.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_78.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_78.save
    irm_menu_entiry_79= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_REPORT_MENU',:page_controller=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_79.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_menu_entiry_79.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_menu_entiry_79.save
    irm_menu_entiry_80= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/report_lists',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_80.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表列表',:description=>'报表列表')
    irm_menu_entiry_80.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report List',:description=>'Report List')
    irm_menu_entiry_80.save
    icm_menu_entiry_81= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_MENU',:sub_menu_code=>nil,:page_controller=>'icm/incident_reports',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_81.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单报表',:description=>'事故单报表')
    icm_menu_entiry_81.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Report',:description=>'Incident Report')
    icm_menu_entiry_81.save
    skm_menu_entiry_82= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_MENU',:sub_menu_code=>nil,:page_controller=>'skm/entry_reports',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_82.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库报表',:description=>'知识库报表')
    skm_menu_entiry_82.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge Report',:description=>'Service Knowledge Report')
    skm_menu_entiry_82.save
    irm_menu_entiry_83= Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:sub_menu_code=>'IRM_DEVELOPER_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_83.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'应用开发员',:description=>'应用开发员')
    irm_menu_entiry_83.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Application Developer',:description=>'Application Developer')
    irm_menu_entiry_83.save
    irm_menu_entiry_84= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_PERMISSION_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_84.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_menu_entiry_84.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_menu_entiry_84.save
    irm_menu_entiry_85= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_PERMISSION_MENU',:sub_menu_code=>'IRM_DEV_MENUS_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_85.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_85.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_85.save
    irm_menu_entiry_86= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_MENUS_MENU',:sub_menu_code=>nil,:page_controller=>'irm/menus',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_86.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_86.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_86.save
    irm_menu_entiry_87= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_MENUS_MENU',:sub_menu_code=>nil,:page_controller=>'irm/menu_entries',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_87.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单子项',:description=>'菜单子项')
    irm_menu_entiry_87.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu Entry',:description=>'Menu Entry')
    irm_menu_entiry_87.save
    irm_menu_entiry_88= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_PERMISSION_MENU',:sub_menu_code=>nil,:page_controller=>'irm/function_groups',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_88.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能组',:description=>'功能组')
    irm_menu_entiry_88.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function Group',:description=>'Function Group')
    irm_menu_entiry_88.save
    irm_menu_entiry_89= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_PERMISSION_MENU',:sub_menu_code=>nil,:page_controller=>'irm/functions',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_89.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能',:description=>'功能')
    irm_menu_entiry_89.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function',:description=>'Function')
    irm_menu_entiry_89.save
    irm_menu_entiry_90= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_REPORT_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表管理',:description=>'报表管理')
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Manage',:description=>'Report Manage')
    irm_menu_entiry_90.save
    irm_menu_entiry_91= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_REPORT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/reports',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_menu_entiry_91.save
    irm_menu_entiry_92= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_AUTOMATOR_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_menu_entiry_92.save
    irm_menu_entiry_93= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_AUTOMATOR_MENU',:sub_menu_code=>nil,:page_controller=>'irm/conditions',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_menu_entiry_93.save
    irm_menu_entiry_94= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_AUTOMATOR_MENU',:sub_menu_code=>nil,:page_controller=>'irm/actions',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Action',:description=>'Action')
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Action',:description=>'Action')
    irm_menu_entiry_94.save
    irm_menu_entiry_95= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_ADVANCE_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级',:description=>'高级')
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance',:description=>'Advance')
    irm_menu_entiry_95.save
    irm_menu_entiry_96= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_ADVANCE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/currencies',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'币种',:description=>'币种')
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Currency',:description=>'Currency')
    irm_menu_entiry_96.save
    irm_menu_entiry_97= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_ADVANCE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/languages',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'语言',:description=>'语言')
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Language',:description=>'Language')
    irm_menu_entiry_97.save
    irm_menu_entiry_98= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_ADVANCE_MENU',:sub_menu_code=>nil,:page_controller=>'irm/product_modules',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_98.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'产品模块',:description=>'产品模块')
    irm_menu_entiry_98.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Product Module',:description=>'Product Module')
    irm_menu_entiry_98.save
    irm_menu_entiry_99= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_HEPLER_MENU',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_99.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_menu_entiry_99.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer Tool',:description=>'Developer Tool')
    irm_menu_entiry_99.save
    irm_menu_entiry_100= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_HEPLER_MENU',:sub_menu_code=>nil,:page_controller=>'irm/dev_tools',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_100.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'检测工具',:description=>'检测工具')
    irm_menu_entiry_100.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Detect Tool',:description=>'Detect Tool')
    irm_menu_entiry_100.save
  end

  def self.down
  end
end
