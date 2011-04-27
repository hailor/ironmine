# -*- coding: utf-8 -*-
class ChangeAllMenu < ActiveRecord::Migration
  def self.up
    Irm::Menu.delete_all
    Irm::MenusTl.delete_all
    Irm::MenuEntry.delete_all
    Irm::MenuEntriesTl.delete_all
    irm_top_setup_menu= Irm::Menu.new(:menu_code=>'TOP_SETUP_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_top_setup_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'顶层设置',:description=>'顶层设置菜单')
    irm_top_setup_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Top Setup',:description=>'Top Setup Menu')
    irm_top_setup_menu.save
    irm_personal_menu= Irm::Menu.new(:menu_code=>'PERSONAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_personal_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的简档',:description=>'我的简档菜单')
    irm_personal_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal',:description=>'Personal Menu')
    irm_personal_menu.save
    irm_personal_setup= Irm::Menu.new(:menu_code=>'PERSONAL_SETUP',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_personal_setup.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置菜单')
    irm_personal_setup.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Setup',:description=>'Personal Setup menu')
    irm_personal_setup.save
    irm_personal_info= Irm::Menu.new(:menu_code=>'PERSONAL_INFO',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_personal_info.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的个人信息',:description=>'我的个人信息菜单')
    irm_personal_info.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Information',:description=>'Personal information menu')
    irm_personal_info.save
    irm_setup_menu= Irm::Menu.new(:menu_code=>'SETUP_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_setup_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'设置',:description=>'设置菜单')
    irm_setup_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setup',:description=>'Setup Menu')
    irm_setup_menu.save
    irm_app_studio= Irm::Menu.new(:menu_code=>'APP_STUDIO',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_app_studio.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'应用设置',:description=>'应用设置菜单')
    irm_app_studio.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Application Studio',:description=>'Application Studio Menu')
    irm_app_studio.save
    irm_customize= Irm::Menu.new(:menu_code=>'CUSTOMIZE',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_customize.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'自定义',:description=>'自定义菜单')
    irm_customize.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Customize',:description=>'Customize Menu')
    irm_customize.save
    irm_lookup= Irm::Menu.new(:menu_code=>'LOOKUP',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_lookup.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码菜单')
    irm_lookup.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup',:description=>'Lookup Menu')
    irm_lookup.save
    irm_value_set= Irm::Menu.new(:menu_code=>'VALUE_SET',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_value_set.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义菜单')
    irm_value_set.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set Definition',:description=>'Value Set Definition Menu')
    irm_value_set.save
    irm_flex_structure= Irm::Menu.new(:menu_code=>'FLEX_STRUCTURE',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_flex_structure.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构菜单')
    irm_flex_structure.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Sturcture',:description=>'Flex Sturcture Menu')
    irm_flex_structure.save
    irm_dev_tools= Irm::Menu.new(:menu_code=>'DEV_TOOLS',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_dev_tools.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'创建',:description=>'创建菜单')
    irm_dev_tools.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create',:description=>'Create Menu')
    irm_dev_tools.save
    irm_business_object= Irm::Menu.new(:menu_code=>'BUSINESS_OBJECT',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_business_object.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像菜单')
    irm_business_object.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object Menu')
    irm_business_object.save
    irm_security_components= Irm::Menu.new(:menu_code=>'SECURITY_COMPONENTS',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_security_components.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'安全性组件',:description=>'安全性组件菜单')
    irm_security_components.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Security Components',:description=>'Security Components Menu')
    irm_security_components.save
    irm_menu= Irm::Menu.new(:menu_code=>'MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单定义菜单')
    irm_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu Definition Menu')
    irm_menu.save
    irm_report_group= Irm::Menu.new(:menu_code=>'REPORT_GROUP',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_report_group.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_report_group.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group',:description=>'Report Group')
    irm_report_group.save
    irm_workflow= Irm::Menu.new(:menu_code=>'WORKFLOW',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_workflow.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流',:description=>'工作流菜单')
    irm_workflow.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow',:description=>'Workflow Menu')
    irm_workflow.save
    irm_dev_check_tools= Irm::Menu.new(:menu_code=>'DEV_CHECK_TOOLS',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_dev_check_tools.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'检测工具',:description=>'检测工具菜单')
    irm_dev_check_tools.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer Check Tools',:description=>'Developer Check Tools Menu')
    irm_dev_check_tools.save
    irm_admin_setup= Irm::Menu.new(:menu_code=>'ADMIN_SETUP',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_admin_setup.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理设置',:description=>'管理设置菜单')
    irm_admin_setup.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Admin Setup',:description=>'Admin Setup Menu')
    irm_admin_setup.save
    irm_manage_user= Irm::Menu.new(:menu_code=>'MANAGE_USER',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_manage_user.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理用户',:description=>'管理用户菜单')
    irm_manage_user.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Manage User',:description=>'Manage User Menu')
    irm_manage_user.save
    irm_user= Irm::Menu.new(:menu_code=>'USER',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_user.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户',:description=>'用户菜单')
    irm_user.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'User',:description=>'User Menu')
    irm_user.save
    irm_organization= Irm::Menu.new(:menu_code=>'ORGANIZATION',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_organization.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构菜单')
    irm_organization.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization Structure',:description=>'Organization Structure Menu')
    irm_organization.save
    irm_support_group= Irm::Menu.new(:menu_code=>'SUPPORT_GROUP',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_support_group.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组菜单')
    irm_support_group.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group Menu')
    irm_support_group.save
    irm_location= Irm::Menu.new(:menu_code=>'LOCATION',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_location.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点信息',:description=>'地点信息菜单')
    irm_location.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Location Information',:description=>'Location Information Menu')
    irm_location.save
    irm_external_system= Irm::Menu.new(:menu_code=>'EXTERNAL_SYSTEM',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_external_system.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统菜单')
    irm_external_system.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
    irm_external_system.save
    irm_external_user_mapping= Irm::Menu.new(:menu_code=>'EXTERNAL_USER_MAPPING',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_external_user_mapping.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户&外部用户映射',:description=>'用户&外部用户映射')
    irm_external_user_mapping.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Login Mapping',:description=>'Login Mapping')
    irm_external_user_mapping.save
    irm_incident_management= Irm::Menu.new(:menu_code=>'INCIDENT_MANAGEMENT',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_incident_management.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理',:description=>'事故管理菜单')
    irm_incident_management.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Management',:description=>'Incident Management Menu')
    irm_incident_management.save
    irm_service_level_management= Irm::Menu.new(:menu_code=>'SERVICE_LEVEL_MANAGEMENT',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_service_level_management.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务级别',:description=>'服务级别菜单')
    irm_service_level_management.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Level Management',:description=>'Service Level Management')
    irm_service_level_management.save
    irm_service_catalog= Irm::Menu.new(:menu_code=>'SERVICE_CATALOG',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_service_catalog.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务目录',:description=>'服务目录菜单')
    irm_service_catalog.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Catalog',:description=>'Service Catalog Menu')
    irm_service_catalog.save
    irm_service_knowledge= Irm::Menu.new(:menu_code=>'SERVICE_KNOWLEDGE',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_service_knowledge.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库菜单')
    irm_service_knowledge.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge Menu')
    irm_service_knowledge.save
    irm_ldap_integration= Irm::Menu.new(:menu_code=>'LDAP_INTEGRATION',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_ldap_integration.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP集成',:description=>'LDAP集成菜单')
    irm_ldap_integration.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Integration',:description=>'LDAP Integration Menu')
    irm_ldap_integration.save
    irm_communication_template= Irm::Menu.new(:menu_code=>'COMMUNICATION_TEMPLATE',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_communication_template.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'通信模板',:description=>'通信模板菜单')
    irm_communication_template.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Communication Template',:description=>'Communication Template')
    irm_communication_template.save
    irm_service_desk= Irm::Menu.new(:menu_code=>'SERVICE_DESK',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_service_desk.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务台',:description=>'服务台菜单')
    irm_service_desk.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Desk',:description=>'Service Desk Menu')
    irm_service_desk.save
    irm_home= Irm::Menu.new(:menu_code=>'HOME',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_home.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页菜单')
    irm_home.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home Menu')
    irm_home.save
    irm_incident_request= Irm::Menu.new(:menu_code=>'INCIDENT_REQUEST',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_incident_request.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单菜单')
    irm_incident_request.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request',:description=>'Incident Request Menu')
    irm_incident_request.save
    irm_service_knowledge_page= Irm::Menu.new(:menu_code=>'SERVICE_KNOWLEDGE_PAGE',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_service_knowledge_page.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库菜单')
    irm_service_knowledge_page.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge Menu')
    irm_service_knowledge_page.save
    irm_survery= Irm::Menu.new(:menu_code=>'SURVERY',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_survery.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷菜单')
    irm_survery.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    irm_survery.save
    irm_report= Irm::Menu.new(:menu_code=>'REPORT',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_report.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表菜单')
    irm_report.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report Menu')
    irm_report.save

    irm_menu_entiry_2= Irm::MenuEntry.new(:menu_code=>'TOP_SETUP_MENU',:sub_menu_code=>'PERSONAL_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的简档',:description=>'我的简档')
    irm_menu_entiry_2.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal',:description=>'Personal')
    irm_menu_entiry_2.save
    irm_menu_entiry_3= Irm::MenuEntry.new(:menu_code=>'PERSONAL_MENU',:sub_menu_code=>'PERSONAL_SETUP',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置')
    irm_menu_entiry_3.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Setup',:description=>'Personal Setup')
    irm_menu_entiry_3.save
    irm_menu_entiry_4= Irm::MenuEntry.new(:menu_code=>'PERSONAL_SETUP',:sub_menu_code=>'PERSONAL_INFO',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的个人信息',:description=>'我的个人信息')
    irm_menu_entiry_4.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal Information',:description=>'Personal Information')
    irm_menu_entiry_4.save
    irm_menu_entiry_5= Irm::MenuEntry.new(:menu_code=>'PERSONAL_INFO',:sub_menu_code=>nil,:page_controller=>'irm/my_info',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人信息',:description=>'个人信息')
    irm_menu_entiry_5.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'My Infomation',:description=>'My Information')
    irm_menu_entiry_5.save
    irm_menu_entiry_6= Irm::MenuEntry.new(:menu_code=>'PERSONAL_INFO',:sub_menu_code=>nil,:page_controller=>'irm/my_password',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'更改我的密码',:description=>'更改我的密码')
    irm_menu_entiry_6.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Change My Password',:description=>'Change My Password')
    irm_menu_entiry_6.save
    irm_menu_entiry_7= Irm::MenuEntry.new(:menu_code=>'PERSONAL_INFO',:sub_menu_code=>nil,:page_controller=>'irm/my_avatar',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'更改我的头像',:description=>'更改我的头像')
    irm_menu_entiry_7.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Change My Avatar',:description=>'Change My Avatar')
    irm_menu_entiry_7.save
    irm_menu_entiry_8= Irm::MenuEntry.new(:menu_code=>'PERSONAL_INFO',:sub_menu_code=>nil,:page_controller=>'irm/my_login_history',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'我的登录历史',:description=>'我的登录历史')
    irm_menu_entiry_8.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'My Login History',:description=>'My Login History')
    irm_menu_entiry_8.save
    irm_menu_entiry_9= Irm::MenuEntry.new(:menu_code=>'TOP_SETUP_MENU',:sub_menu_code=>'SETUP_MENU',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_9.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'设置',:description=>'设置')
    irm_menu_entiry_9.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setup',:description=>'Setup')
    irm_menu_entiry_9.save
    irm_menu_entiry_10= Irm::MenuEntry.new(:menu_code=>'SETUP_MENU',:sub_menu_code=>'APP_STUDIO',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'应用设置',:description=>'应用设置')
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Application Studio',:description=>'Application Studio')
    irm_menu_entiry_10.save
    irm_menu_entiry_11= Irm::MenuEntry.new(:menu_code=>'APP_STUDIO',:sub_menu_code=>'CUSTOMIZE',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'自定义',:description=>'自定义')
    irm_menu_entiry_11.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Customize',:description=>'Customize')
    irm_menu_entiry_11.save
    irm_menu_entiry_12= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>nil,:page_controller=>'irm/global_settings',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'全局设置',:description=>'全局设置')
    irm_menu_entiry_12.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global Setting',:description=>'Global Setting')
    irm_menu_entiry_12.save
    irm_menu_entiry_13= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>nil,:page_controller=>'irm/languages',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'语言',:description=>'语言')
    irm_menu_entiry_13.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Language',:description=>'Language')
    irm_menu_entiry_13.save
    irm_menu_entiry_14= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>nil,:page_controller=>'irm/currencies',:display_sequence=>30,:display_flag=>'',:not_auto_mult=>true)
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'币种',:description=>'币种')
    irm_menu_entiry_14.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Currency',:description=>'Currency')
    irm_menu_entiry_14.save
    irm_menu_entiry_15= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>'LOOKUP',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码')
    irm_menu_entiry_15.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Code',:description=>'Lookup Code')
    irm_menu_entiry_15.save
    irm_menu_entiry_16= Irm::MenuEntry.new(:menu_code=>'LOOKUP',:sub_menu_code=>nil,:page_controller=>'irm/lookup_types',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码类型',:description=>'快速编码类型')
    irm_menu_entiry_16.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Type',:description=>'Lookup Type')
    irm_menu_entiry_16.save
    irm_menu_entiry_17= Irm::MenuEntry.new(:menu_code=>'LOOKUP',:sub_menu_code=>nil,:page_controller=>'irm/lookup_values',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码值',:description=>'快速编码值')
    irm_menu_entiry_17.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup Value',:description=>'Lookup Value')
    irm_menu_entiry_17.save
    irm_menu_entiry_18= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>nil,:page_controller=>'irm/general_categories',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公共分类',:description=>'公共分类')
    irm_menu_entiry_18.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General Category',:description=>'General Category')
    irm_menu_entiry_18.save
    irm_menu_entiry_19= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>'VALUE_SET',:page_controller=>nil,:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集定义',:description=>'值集定义')
    irm_menu_entiry_19.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set Definition',:description=>'Value Set Definition')
    irm_menu_entiry_19.save
    irm_menu_entiry_20= Irm::MenuEntry.new(:menu_code=>'VALUE_SET',:sub_menu_code=>nil,:page_controller=>'irm/flex_value_sets',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集',:description=>'值集')
    irm_menu_entiry_20.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set',:description=>'Value Set')
    irm_menu_entiry_20.save
    irm_menu_entiry_21= Irm::MenuEntry.new(:menu_code=>'VALUE_SET',:sub_menu_code=>nil,:page_controller=>'irm/flex_values',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集值',:description=>'值集值')
    irm_menu_entiry_21.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set Value',:description=>'Value Set Value')
    irm_menu_entiry_21.save
    irm_menu_entiry_22= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>nil,:page_controller=>'irm/id_flexes',:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域',:description=>'弹性域')
    irm_menu_entiry_22.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex',:description=>'Flex')
    irm_menu_entiry_22.save
    irm_menu_entiry_23= Irm::MenuEntry.new(:menu_code=>'CUSTOMIZE',:sub_menu_code=>'FLEX_STRUCTURE',:page_controller=>nil,:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构')
    irm_menu_entiry_23.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments',:description=>'Flex Segments')
    irm_menu_entiry_23.save
    irm_menu_entiry_24= Irm::MenuEntry.new(:menu_code=>'FLEX_STRUCTURE',:sub_menu_code=>nil,:page_controller=>'irm/id_flex_structures',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域结构',:description=>'弹性域结构')
    irm_menu_entiry_24.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments Struct',:description=>'Flex Segments Struct')
    irm_menu_entiry_24.save
    irm_menu_entiry_25= Irm::MenuEntry.new(:menu_code=>'FLEX_STRUCTURE',:sub_menu_code=>nil,:page_controller=>'irm/id_flex_segments',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域段值',:description=>'弹性域段值')
    irm_menu_entiry_25.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Segments Value',:description=>'Flex Segments Value')
    irm_menu_entiry_25.save
    irm_menu_entiry_26= Irm::MenuEntry.new(:menu_code=>'APP_STUDIO',:sub_menu_code=>'DEV_TOOLS',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'创建',:description=>'创建')
    irm_menu_entiry_26.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create',:description=>'Create')
    irm_menu_entiry_26.save
    irm_menu_entiry_27= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>nil,:page_controller=>'irm/product_modules',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'产品模块',:description=>'产品模块')
    irm_menu_entiry_27.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Product Module',:description=>'Product Module')
    irm_menu_entiry_27.save
    irm_menu_entiry_28= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>'BUSINESS_OBJECT',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_menu_entiry_28.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_menu_entiry_28.save
    irm_menu_entiry_29= Irm::MenuEntry.new(:menu_code=>'BUSINESS_OBJECT',:sub_menu_code=>nil,:page_controller=>'irm/business_objects',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_menu_entiry_29.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_menu_entiry_29.save
    irm_menu_entiry_30= Irm::MenuEntry.new(:menu_code=>'BUSINESS_OBJECT',:sub_menu_code=>nil,:page_controller=>'irm/object_attributes',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像属性',:description=>'业务对像属性')
    irm_menu_entiry_30.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object Attribute',:description=>'Business Object Attribute')
    irm_menu_entiry_30.save
    irm_menu_entiry_31= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>nil,:page_controller=>'irm/list_of_values',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值列表',:description=>'值列表')
    irm_menu_entiry_31.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'List of Value',:description=>'List of Value')
    irm_menu_entiry_31.save
    irm_menu_entiry_32= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>nil,:page_controller=>'irm/reports',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_menu_entiry_32.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_menu_entiry_32.save
    irm_menu_entiry_33= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>'SECURITY_COMPONENTS',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'安全性组件',:description=>'安全性组件')
    irm_menu_entiry_33.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Security Component',:description=>'Security Component')
    irm_menu_entiry_33.save
    irm_menu_entiry_34= Irm::MenuEntry.new(:menu_code=>'SECURITY_COMPONENTS',:sub_menu_code=>'MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_34.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_34.save
    irm_menu_entiry_35= Irm::MenuEntry.new(:menu_code=>'MENU',:sub_menu_code=>nil,:page_controller=>'irm/menus',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_35.save
    irm_menu_entiry_36= Irm::MenuEntry.new(:menu_code=>'MENU',:sub_menu_code=>nil,:page_controller=>'irm/menu_entries',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单子项',:description=>'菜单子项')
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu Entry',:description=>'Menu Entry')
    irm_menu_entiry_36.save
    irm_menu_entiry_37= Irm::MenuEntry.new(:menu_code=>'SECURITY_COMPONENTS',:sub_menu_code=>nil,:page_controller=>'irm/functions',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能',:description=>'功能')
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function',:description=>'Function')
    irm_menu_entiry_37.save
    irm_menu_entiry_38= Irm::MenuEntry.new(:menu_code=>'SECURITY_COMPONENTS',:sub_menu_code=>nil,:page_controller=>'irm/function_groups',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能组',:description=>'功能组')
    irm_menu_entiry_38.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function Group',:description=>'Function Group')
    irm_menu_entiry_38.save
    irm_menu_entiry_39= Irm::MenuEntry.new(:menu_code=>'SECURITY_COMPONENTS',:sub_menu_code=>'REPORT_GROUP',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_39.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group',:description=>'Report Group')
    irm_menu_entiry_39.save
    irm_menu_entiry_40= Irm::MenuEntry.new(:menu_code=>'REPORT_GROUP',:sub_menu_code=>nil,:page_controller=>'irm/report_groups',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_menu_entiry_40.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group',:description=>'Report Group')
    irm_menu_entiry_40.save
    irm_menu_entiry_41= Irm::MenuEntry.new(:menu_code=>'REPORT_GROUP',:sub_menu_code=>nil,:page_controller=>'irm/report_group_members',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组成员',:description=>'报表组成员')
    irm_menu_entiry_41.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report Group Member',:description=>'Report Group Member')
    irm_menu_entiry_41.save
    irm_menu_entiry_42= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>'WORKFLOW',:page_controller=>nil,:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流',:description=>'工作流')
    irm_menu_entiry_42.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow',:description=>'Workflow')
    irm_menu_entiry_42.save
    irm_menu_entiry_43= Irm::MenuEntry.new(:menu_code=>'WORKFLOW',:sub_menu_code=>nil,:page_controller=>'irm/wf_rules',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流规则',:description=>'工作流规则')
    irm_menu_entiry_43.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Rule',:description=>'Workflow Rule')
    irm_menu_entiry_43.save
    irm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'WORKFLOW',:sub_menu_code=>nil,:page_controller=>'irm/wf_settings',:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'设置',:description=>'设置')
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setting',:description=>'Setting')
    irm_menu_entiry_44.save
    irm_menu_entiry_45= Irm::MenuEntry.new(:menu_code=>'DEV_TOOLS',:sub_menu_code=>'DEV_CHECK_TOOLS',:page_controller=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_45.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'检测工具',:description=>'检测工具')
    irm_menu_entiry_45.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Check Tools',:description=>'Check Tools')
    irm_menu_entiry_45.save
    irm_menu_entiry_46= Irm::MenuEntry.new(:menu_code=>'SETUP_MENU',:sub_menu_code=>'ADMIN_SETUP',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_46.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理设置',:description=>'管理设置')
    irm_menu_entiry_46.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Admin Setup',:description=>'Admin Setup')
    irm_menu_entiry_46.save
    irm_menu_entiry_47= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'MANAGE_USER',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_47.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理用户',:description=>'管理用户')
    irm_menu_entiry_47.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Manage User',:description=>'Manage User')
    irm_menu_entiry_47.save
    irm_menu_entiry_48= Irm::MenuEntry.new(:menu_code=>'MANAGE_USER',:sub_menu_code=>'USER',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_48.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户',:description=>'用户')
    irm_menu_entiry_48.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User',:description=>'User')
    irm_menu_entiry_48.save
    irm_menu_entiry_49= Irm::MenuEntry.new(:menu_code=>'USER',:sub_menu_code=>nil,:page_controller=>'irm/people',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_49.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户',:description=>'用户')
    irm_menu_entiry_49.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User',:description=>'User')
    irm_menu_entiry_49.save
    irm_menu_entiry_50= Irm::MenuEntry.new(:menu_code=>'USER',:sub_menu_code=>nil,:page_controller=>'irm/company_accesses',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_50.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户可访问公司',:description=>'用户可访问公司')
    irm_menu_entiry_50.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company Access',:description=>'Company Access')
    irm_menu_entiry_50.save
    irm_menu_entiry_51= Irm::MenuEntry.new(:menu_code=>'MANAGE_USER',:sub_menu_code=>nil,:page_controller=>'irm/roles',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_51.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'角色',:description=>'角色')
    irm_menu_entiry_51.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Role',:description=>'Role')
    irm_menu_entiry_51.save
    irm_menu_entiry_52= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'ORGANIZATION',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_52.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构')
    irm_menu_entiry_52.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization Structure',:description=>'Organization Structure')
    irm_menu_entiry_52.save
    irm_menu_entiry_53= Irm::MenuEntry.new(:menu_code=>'ORGANIZATION',:sub_menu_code=>nil,:page_controller=>'irm/companies',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_53.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司',:description=>'公司')
    irm_menu_entiry_53.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company',:description=>'Company')
    irm_menu_entiry_53.save
    irm_menu_entiry_54= Irm::MenuEntry.new(:menu_code=>'ORGANIZATION',:sub_menu_code=>nil,:page_controller=>'irm/organizations',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_54.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
    irm_menu_entiry_54.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
    irm_menu_entiry_54.save
    irm_menu_entiry_55= Irm::MenuEntry.new(:menu_code=>'ORGANIZATION',:sub_menu_code=>nil,:page_controller=>'irm/departments',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_55.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'部门',:description=>'部门')
    irm_menu_entiry_55.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Department',:description=>'Department')
    irm_menu_entiry_55.save
    irm_menu_entiry_56= Irm::MenuEntry.new(:menu_code=>'ORGANIZATION',:sub_menu_code=>'SUPPORT_GROUP',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_56.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_56.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group')
    irm_menu_entiry_56.save
    irm_menu_entiry_57= Irm::MenuEntry.new(:menu_code=>'SUPPORT_GROUP',:sub_menu_code=>nil,:page_controller=>'irm/support_groups',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_57.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_menu_entiry_57.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group')
    irm_menu_entiry_57.save
    irm_menu_entiry_58= Irm::MenuEntry.new(:menu_code=>'SUPPORT_GROUP',:sub_menu_code=>nil,:page_controller=>'irm/support_group_members',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_58.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组成员',:description=>'支持组成员')
    irm_menu_entiry_58.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group Member',:description=>'Support Group Member')
    irm_menu_entiry_58.save
    irm_menu_entiry_59= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'LOCATION',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_59.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点信息',:description=>'地点信息')
    irm_menu_entiry_59.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Location',:description=>'Location')
    irm_menu_entiry_59.save
    irm_menu_entiry_60= Irm::MenuEntry.new(:menu_code=>'LOCATION',:sub_menu_code=>nil,:page_controller=>'irm/regions',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_60.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'区域',:description=>'区域')
    irm_menu_entiry_60.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Region',:description=>'Region')
    irm_menu_entiry_60.save
    irm_menu_entiry_61= Irm::MenuEntry.new(:menu_code=>'LOCATION',:sub_menu_code=>nil,:page_controller=>'irm/site_groups',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点组',:description=>'地点组')
    irm_menu_entiry_61.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site Group',:description=>'Site Group')
    irm_menu_entiry_61.save
    irm_menu_entiry_62= Irm::MenuEntry.new(:menu_code=>'LOCATION',:sub_menu_code=>nil,:page_controller=>'irm/sites',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点',:description=>'地点')
    irm_menu_entiry_62.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site',:description=>'Site')
    irm_menu_entiry_62.save
    uid_menu_entiry_63= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'EXTERNAL_SYSTEM',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entiry_63.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统')
    uid_menu_entiry_63.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
    uid_menu_entiry_63.save
    uid_menu_entiry_64= Irm::MenuEntry.new(:menu_code=>'EXTERNAL_SYSTEM',:sub_menu_code=>nil,:page_controller=>'uid/external_systems',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entiry_64.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统定义',:description=>'系统定义')
    uid_menu_entiry_64.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Manage System',:description=>'Manage System')
    uid_menu_entiry_64.save
    uid_menu_entiry_65= Irm::MenuEntry.new(:menu_code=>'EXTERNAL_SYSTEM',:sub_menu_code=>nil,:page_controller=>'uid/external_logins',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entiry_65.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部LoginID',:description=>'外部LoginID')
    uid_menu_entiry_65.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External Login ID',:description=>'External Login ID')
    uid_menu_entiry_65.save
    uid_menu_entiry_66= Irm::MenuEntry.new(:menu_code=>'EXTERNAL_SYSTEM',:sub_menu_code=>'EXTERNAL_USER_MAPPING',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entiry_66.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户&外部用户映射',:description=>'用户&外部用户映射')
    uid_menu_entiry_66.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User&External LoingID Mapping',:description=>'User&External LoingID Mapping')
    uid_menu_entiry_66.save
    uid_menu_entiry_67= Irm::MenuEntry.new(:menu_code=>'EXTERNAL_USER_MAPPING',:sub_menu_code=>nil,:page_controller=>'uid/login_mappings',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entiry_67.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户映射',:description=>'用户映射')
    uid_menu_entiry_67.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User Mapping',:description=>'User Mapping')
    uid_menu_entiry_67.save
    uid_menu_entiry_68= Irm::MenuEntry.new(:menu_code=>'EXTERNAL_USER_MAPPING',:sub_menu_code=>nil,:page_controller=>'uid/auto_mapings',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    uid_menu_entiry_68.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'自动映射',:description=>'自动映射')
    uid_menu_entiry_68.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Auto Mapping',:description=>'Auto Mapping')
    uid_menu_entiry_68.save
    icm_menu_entiry_69= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'INCIDENT_MANAGEMENT',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_69.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理',:description=>'事故管理')
    icm_menu_entiry_69.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Management',:description=>'Incident Management')
    icm_menu_entiry_69.save
    icm_menu_entiry_70= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/close_reasons',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_70.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭原因',:description=>'关闭原因')
    icm_menu_entiry_70.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close Reason',:description=>'Close Reason')
    icm_menu_entiry_70.save
    icm_menu_entiry_71= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/group_assignments',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_71.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组指派',:description=>'组指派')
    icm_menu_entiry_71.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Group Assignment',:description=>'Group Assignment')
    icm_menu_entiry_71.save
    icm_menu_entiry_72= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/rule_settings',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_72.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'规则设置',:description=>'规则设置')
    icm_menu_entiry_72.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Rule',:description=>'Rule')
    icm_menu_entiry_72.save
    icm_menu_entiry_73= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/urgence_codes',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_73.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'紧急度',:description=>'紧急度')
    icm_menu_entiry_73.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Urgency',:description=>'Urgency')
    icm_menu_entiry_73.save
    icm_menu_entiry_74= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/impact_ranges',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_74.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'影响度',:description=>'影响度')
    icm_menu_entiry_74.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Impact Range',:description=>'Impact Range')
    icm_menu_entiry_74.save
    icm_menu_entiry_75= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/priority_codes',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_75.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'优先级',:description=>'优先级')
    icm_menu_entiry_75.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Priority',:description=>'Priority')
    icm_menu_entiry_75.save
    icm_menu_entiry_76= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/incident_phases',:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_76.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'阶段',:description=>'阶段')
    icm_menu_entiry_76.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Phase',:description=>'Incident Phase')
    icm_menu_entiry_76.save
    icm_menu_entiry_77= Irm::MenuEntry.new(:menu_code=>'INCIDENT_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'icm/incident_statuses',:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_77.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'状态',:description=>'状态')
    icm_menu_entiry_77.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Status',:description=>'Incident Status')
    icm_menu_entiry_77.save
    slm_menu_entiry_78= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'SERVICE_LEVEL_MANAGEMENT',:page_controller=>nil,:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    slm_menu_entiry_78.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务级别',:description=>'服务级别')
    slm_menu_entiry_78.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Level Management',:description=>'Service Level Management')
    slm_menu_entiry_78.save
    slm_menu_entiry_79= Irm::MenuEntry.new(:menu_code=>'SERVICE_LEVEL_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'slm/service_categories',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    slm_menu_entiry_79.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'类别',:description=>'类别')
    slm_menu_entiry_79.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Category',:description=>'Category')
    slm_menu_entiry_79.save
    slm_menu_entiry_80= Irm::MenuEntry.new(:menu_code=>'SERVICE_LEVEL_MANAGEMENT',:sub_menu_code=>'SERVICE_CATALOG',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    slm_menu_entiry_80.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'目录',:description=>'目录')
    slm_menu_entiry_80.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Catalog',:description=>'Catalog')
    slm_menu_entiry_80.save
    slm_menu_entiry_81= Irm::MenuEntry.new(:menu_code=>'SERVICE_CATALOG',:sub_menu_code=>nil,:page_controller=>'slm/service_catalogs',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    slm_menu_entiry_81.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'目录',:description=>'目录')
    slm_menu_entiry_81.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Catalog',:description=>'Catalog')
    slm_menu_entiry_81.save
    slm_menu_entiry_82= Irm::MenuEntry.new(:menu_code=>'SERVICE_CATALOG',:sub_menu_code=>nil,:page_controller=>'slm/service_members',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    slm_menu_entiry_82.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'目录使用人员',:description=>'目录使用人员')
    slm_menu_entiry_82.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Member',:description=>'Member')
    slm_menu_entiry_82.save
    slm_menu_entiry_83= Irm::MenuEntry.new(:menu_code=>'SERVICE_CATALOG',:sub_menu_code=>nil,:page_controller=>'slm/service_breaks',:display_sequence=>30,:display_flag=>'N',:not_auto_mult=>true)
    slm_menu_entiry_83.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务时间段',:description=>'服务时间段')
    slm_menu_entiry_83.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Break',:description=>'Break')
    slm_menu_entiry_83.save
    slm_menu_entiry_84= Irm::MenuEntry.new(:menu_code=>'SERVICE_LEVEL_MANAGEMENT',:sub_menu_code=>nil,:page_controller=>'slm/service_agreements',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    slm_menu_entiry_84.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'协议',:description=>'协议')
    slm_menu_entiry_84.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Agreement',:description=>'Agreement')
    slm_menu_entiry_84.save
    skm_menu_entiry_85= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'SERVICE_KNOWLEDGE',:page_controller=>nil,:display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_85.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_menu_entiry_85.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_85.save
    skm_menu_entiry_86= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE',:sub_menu_code=>nil,:page_controller=>'skm/entry_statuses',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_86.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'状态',:description=>'状态')
    skm_menu_entiry_86.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Status',:description=>'Status')
    skm_menu_entiry_86.save
    skm_menu_entiry_87= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE',:sub_menu_code=>nil,:page_controller=>'skm/entry_templates',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_87.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'模板',:description=>'模板')
    skm_menu_entiry_87.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Template',:description=>'Template')
    skm_menu_entiry_87.save
    skm_menu_entiry_88= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE',:sub_menu_code=>nil,:page_controller=>'skm/entry_template_elements',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_88.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'模板元素',:description=>'模板元素')
    skm_menu_entiry_88.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Template Element',:description=>'Template Element')
    skm_menu_entiry_88.save
    skm_menu_entiry_89= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE',:sub_menu_code=>nil,:page_controller=>'skm/settings',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_89.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'设置',:description=>'设置')
    skm_menu_entiry_89.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setting',:description=>'Setting')
    skm_menu_entiry_89.save
    irm_menu_entiry_90= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'LDAP_INTEGRATION',:page_controller=>nil,:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP 集成',:description=>'LDAP 集成')
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Integration',:description=>'LDAP Integration')
    irm_menu_entiry_90.save
    irm_menu_entiry_91= Irm::MenuEntry.new(:menu_code=>'LDAP_INTEGRATION',:sub_menu_code=>nil,:page_controller=>'irm/ldap_auth_headers',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户登录设置',:description=>'用户登录设置')
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User Login Setting',:description=>'User Login Setting')
    irm_menu_entiry_91.save
    irm_menu_entiry_92= Irm::MenuEntry.new(:menu_code=>'ADMIN_SETUP',:sub_menu_code=>'COMMUNICATION_TEMPLATE',:page_controller=>nil,:display_sequence=>90,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'通信模板',:description=>'通信模板')
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Communication Template',:description=>'Communication Template')
    irm_menu_entiry_92.save
    irm_menu_entiry_93= Irm::MenuEntry.new(:menu_code=>'COMMUNICATION_TEMPLATE',:sub_menu_code=>nil,:page_controller=>'irm/mail_templates',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件模板',:description=>'邮件模板')
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Template',:description=>'Mail Template')
    irm_menu_entiry_93.save
    irm_menu_entiry_94= Irm::MenuEntry.new(:menu_code=>'SERVICE_DESK',:sub_menu_code=>'HOME',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    irm_menu_entiry_94.save
    irm_menu_entiry_95= Irm::MenuEntry.new(:menu_code=>'HOME',:sub_menu_code=>nil,:page_controller=>'irm/home',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    irm_menu_entiry_95.save
    irm_menu_entiry_96= Irm::MenuEntry.new(:menu_code=>'HOME',:sub_menu_code=>nil,:page_controller=>'irm/wf_tasks',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Task',:description=>'Task')
    irm_menu_entiry_96.save
    irm_menu_entiry_97= Irm::MenuEntry.new(:menu_code=>'SERVICE_DESK',:sub_menu_code=>'INCIDENT_REQUEST',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request',:description=>'Incident Request')
    irm_menu_entiry_97.save
    icm_menu_entiry_98= Irm::MenuEntry.new(:menu_code=>'INCIDENT_REQUEST',:sub_menu_code=>nil,:page_controller=>'icm/incident_requests',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_98.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_menu_entiry_98.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request',:description=>'Incident Request')
    icm_menu_entiry_98.save
    icm_menu_entiry_99= Irm::MenuEntry.new(:menu_code=>'INCIDENT_REQUEST',:sub_menu_code=>nil,:page_controller=>'icm/incident_journals',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    icm_menu_entiry_99.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单回复',:description=>'事故单回复')
    icm_menu_entiry_99.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request Journal',:description=>'Incident Request Journal')
    icm_menu_entiry_99.save
    skm_menu_entiry_100= Irm::MenuEntry.new(:menu_code=>'SERVICE_DESK',:sub_menu_code=>'SERVICE_KNOWLEDGE_PAGE',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_100.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_menu_entiry_100.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_100.save
    skm_menu_entiry_101= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE_PAGE',:sub_menu_code=>nil,:page_controller=>'skm/entry_headers',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_101.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库文章',:description=>'知识库文章')
    skm_menu_entiry_101.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge',:description=>'Service Knowledge')
    skm_menu_entiry_101.save
    skm_menu_entiry_102= Irm::MenuEntry.new(:menu_code=>'SERVICE_KNOWLEDGE_PAGE',:sub_menu_code=>nil,:page_controller=>'skm/file_managements',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    skm_menu_entiry_102.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_102.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_102.save
    csi_menu_entiry_103= Irm::MenuEntry.new(:menu_code=>'SERVICE_DESK',:sub_menu_code=>'SURVERY',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_103.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷')
    csi_menu_entiry_103.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_103.save
    csi_menu_entiry_104= Irm::MenuEntry.new(:menu_code=>'SURVERY',:sub_menu_code=>nil,:page_controller=>'csi/surveys',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_104.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷')
    csi_menu_entiry_104.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_104.save
    csi_menu_entiry_105= Irm::MenuEntry.new(:menu_code=>'SURVERY',:sub_menu_code=>nil,:page_controller=>'csi/survey_subjects',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    csi_menu_entiry_105.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问题',:description=>'调查问题')
    csi_menu_entiry_105.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery Subject',:description=>'Survery Subject')
    csi_menu_entiry_105.save
    csi_menu_entiry_106= Irm::MenuEntry.new(:menu_code=>'SURVERY',:sub_menu_code=>nil,:page_controller=>'csi/survey_ranges',:display_sequence=>30,:display_flag=>'N',:not_auto_mult=>true)
    csi_menu_entiry_106.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷范围',:description=>'调查问卷范围')
    csi_menu_entiry_106.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery Range',:description=>'Survery Range')
    csi_menu_entiry_106.save
    irm_menu_entiry_107= Irm::MenuEntry.new(:menu_code=>'SERVICE_DESK',:sub_menu_code=>'REPORT',:page_controller=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_107.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_menu_entiry_107.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_menu_entiry_107.save
    irm_menu_entiry_108= Irm::MenuEntry.new(:menu_code=>'REPORT',:sub_menu_code=>nil,:page_controller=>'irm/report_lists',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_108.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表列表',:description=>'报表列表')
    irm_menu_entiry_108.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report List',:description=>'Report List')
    irm_menu_entiry_108.save
    icm_menu_entiry_109= Irm::MenuEntry.new(:menu_code=>'REPORT',:sub_menu_code=>nil,:page_controller=>'icm/incident_reports',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    icm_menu_entiry_109.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单报表',:description=>'事故单报表')
    icm_menu_entiry_109.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Report',:description=>'Incident Report')
    icm_menu_entiry_109.save
    skm_menu_entiry_110= Irm::MenuEntry.new(:menu_code=>'REPORT',:sub_menu_code=>nil,:page_controller=>'skm/entry_reports',:display_sequence=>30,:display_flag=>'N',:not_auto_mult=>true)
    skm_menu_entiry_110.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库报表',:description=>'知识库报表')
    skm_menu_entiry_110.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Knowledge Report',:description=>'Service Knowledge Report')
    skm_menu_entiry_110.save

  end

  def self.down
    Irm::Menu.delete_all
    Irm::MenusTl.delete_all
    Irm::MenuEntry.delete_all
    Irm::MenuEntriesTl.delete_all
  end
end
