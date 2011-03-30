# -*- coding: utf-8 -*-
class InitFunctions < ActiveRecord::Migration
  def self.up
    Irm::FunctionGroup.delete_all
    Irm::FunctionGroupsTl.delete_all
    Irm::Function.delete_all
    Irm::FunctionsTl.delete_all
    Irm::RoleFunction.delete_all
    irm_irm_system_home_page= Irm::FunctionGroup.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:not_auto_mult=>true)
    irm_irm_system_home_page.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统主页',:description=>'系统主页')
    irm_irm_system_home_page.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'System home page',:description=>'System home page')
    irm_irm_system_home_page.save
    icm_icm_incident_request= Irm::FunctionGroup.new(:group_code=>'ICM_INCIDENT_REQUEST',:not_auto_mult=>true)
    icm_icm_incident_request.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_icm_incident_request.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    icm_icm_incident_request.save
    irm_irm_common_setting= Irm::FunctionGroup.new(:group_code=>'IRM_COMMON_SETTING',:not_auto_mult=>true)
    irm_irm_common_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'常用设置',:description=>'常用设置')
    irm_irm_common_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Common Setting',:description=>'Common Setting')
    irm_irm_common_setting.save
    irm_irm_org_structure= Irm::FunctionGroup.new(:group_code=>'IRM_ORG_STRUCTURE',:not_auto_mult=>true)
    irm_irm_org_structure.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构',:description=>'组织结构')
    irm_irm_org_structure.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization Structure',:description=>'Organization Structure')
    irm_irm_org_structure.save
    irm_irm_location= Irm::FunctionGroup.new(:group_code=>'IRM_LOCATION',:not_auto_mult=>true)
    irm_irm_location.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'位置',:description=>'位置')
    irm_irm_location.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Location',:description=>'Location')
    irm_irm_location.save
    irm_irm_permission= Irm::FunctionGroup.new(:group_code=>'IRM_PERMISSION',:not_auto_mult=>true)
    irm_irm_permission.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'权限',:description=>'权限')
    irm_irm_permission.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Permission',:description=>'Permission')
    irm_irm_permission.save
    irm_irm_automator= Irm::FunctionGroup.new(:group_code=>'IRM_AUTOMATOR',:not_auto_mult=>true)
    irm_irm_automator.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Automator',:description=>'Automator')
    irm_irm_automator.save
    icm_icm_common_setting= Irm::FunctionGroup.new(:group_code=>'ICM_COMMON_SETTING',:not_auto_mult=>true)
    icm_icm_common_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故一般设置',:description=>'事故一般设置')
    icm_icm_common_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Common',:description=>'Incident Common')
    icm_icm_common_setting.save
    icm_icm_setting= Irm::FunctionGroup.new(:group_code=>'ICM_SETTING',:not_auto_mult=>true)
    icm_icm_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故设置',:description=>'事故设置')
    icm_icm_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Setting',:description=>'Incident Setting')
    icm_icm_setting.save
    skm_skm_setting= Irm::FunctionGroup.new(:group_code=>'SKM_SETTING',:not_auto_mult=>true)
    skm_skm_setting.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库设置',:description=>'知识库设置')
    skm_skm_setting.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Knowledge Base Setting',:description=>'Knowledge Base Setting')
    skm_skm_setting.save
    irm_irm_dev_permission= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_PERMISSION',:not_auto_mult=>true)
    irm_irm_dev_permission.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-权限',:description=>'开发人员-权限')
    irm_irm_dev_permission.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Permission',:description=>'Developer-Permission')
    irm_irm_dev_permission.save
    irm_irm_dev_automator= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_AUTOMATOR',:not_auto_mult=>true)
    irm_irm_dev_automator.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-Automator',:description=>'开发人员-Automator')
    irm_irm_dev_automator.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Automator',:description=>'Developer-Automator')
    irm_irm_dev_automator.save
    irm_irm_dev_advance= Irm::FunctionGroup.new(:group_code=>'IRM_DEV_ADVANCE',:not_auto_mult=>true)
    irm_irm_dev_advance.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-高级',:description=>'开发人员-高级')
    irm_irm_dev_advance.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Advance',:description=>'Developer-Advance')
    irm_irm_dev_advance.save
    
    irm_home_page= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'HOME_PAGE',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_home_page.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'首页',:description=>'首页')
    irm_home_page.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    irm_home_page.save
    icm_view_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'VIEW_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看',:description=>'查看')
    icm_view_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View',:description=>'View')
    icm_view_incident_request.save
    icm_view_all_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'VIEW_ALL_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_all_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看所有',:description=>'查看所有')
    icm_view_all_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View ALL',:description=>'View ALL')
    icm_view_all_incident_request.save
    icm_reply_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'REPLY_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    icm_reply_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复',:description=>'回复')
    icm_reply_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply',:description=>'Reply')
    icm_reply_incident_request.save
    icm_pass_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'PASS_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_pass_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'转交',:description=>'转交')
    icm_pass_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Pass',:description=>'Pass')
    icm_pass_incident_request.save
    icm_edit_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'EDIT_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑',:description=>'编辑')
    icm_edit_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit',:description=>'Edit')
    icm_edit_incident_request.save
    icm_create_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CREATE_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建',:description=>'新建')
    icm_create_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New',:description=>'New')
    icm_create_incident_request.save
    icm_create_icdt_rqst_for_other= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CREATE_ICDT_RQST_FOR_OTHER',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_icdt_rqst_for_other.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'为他人提单',:description=>'为他人提单')
    icm_create_icdt_rqst_for_other.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Summbit for other',:description=>'Summbit for other')
    icm_create_icdt_rqst_for_other.save
    icm_close_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CLOSE_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_close_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭',:description=>'关闭')
    icm_close_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close',:description=>'Close')
    icm_close_incident_request.save
    icm_assign_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'ASSIGN_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_assign_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'分配',:description=>'分配')
    icm_assign_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Assign',:description=>'Assign')
    icm_assign_incident_request.save
    irm_view_global_settings= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_GLOBAL_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_global_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'全局设置',:description=>'全局设置')
    irm_view_global_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Global Setting',:description=>'Global Setting')
    irm_view_global_settings.save
    irm_edit_global_settings= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_GLOBAL_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_global_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑全局设置',:description=>'编辑全局设置')
    irm_edit_global_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Global Setting',:description=>'Edit Global Setting')
    irm_edit_global_settings.save
    irm_view_auth_sources= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_AUTH_SOURCES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_auth_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP认证',:description=>'LDAP认证')
    irm_view_auth_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Authsources',:description=>'LDAP Authsources')
    irm_view_auth_sources.save
    irm_create_auth_sources= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'CREATE_AUTH_SOURCES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_auth_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建LDAP认证',:description=>'新建LDAP认证')
    irm_create_auth_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New LDAP Authsources',:description=>'New LDAP Authsources')
    irm_create_auth_sources.save
    irm_edit_auth_sources= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_AUTH_SOURCES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_auth_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑LDAP认证',:description=>'编辑LDAP认证')
    irm_edit_auth_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit LDAP Authsources',:description=>'Edit LDAP Authsources')
    irm_edit_auth_sources.save
    irm_view_lookup= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_LOOKUP',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_lookup.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'快速编码',:description=>'快速编码')
    irm_view_lookup.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Lookup code',:description=>'Lookup code')
    irm_view_lookup.save
    irm_create_lookup= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'CREATE_LOOKUP',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_lookup.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建快速编码',:description=>'新建快速编码')
    irm_create_lookup.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Lookup code',:description=>'New Lookup code')
    irm_create_lookup.save
    irm_edit_lookup= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_LOOKUP',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_lookup.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑快速编码',:description=>'编辑快速编码')
    irm_edit_lookup.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Lookup code',:description=>'Edit Lookup code')
    irm_edit_lookup.save
    irm_view_general_categories= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_GENERAL_CATEGORIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_general_categories.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公共分类',:description=>'公共分类')
    irm_view_general_categories.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'General Category',:description=>'General Category')
    irm_view_general_categories.save
    irm_create_general_categories= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'CREATE_GENERAL_CATEGORIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_general_categories.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建公共分类',:description=>'新建公共分类')
    irm_create_general_categories.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New General Category',:description=>'New General Category')
    irm_create_general_categories.save
    irm_edit_general_categories= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_GENERAL_CATEGORIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_general_categories.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑公共分类',:description=>'编辑公共分类')
    irm_edit_general_categories.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit General Category',:description=>'Edit General Category')
    irm_edit_general_categories.save
    irm_view_value_sets= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_VALUE_SETS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_value_sets.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值集',:description=>'值集')
    irm_view_value_sets.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Value Set',:description=>'Value Set')
    irm_view_value_sets.save
    irm_create_value_sets= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'CREATE_VALUE_SETS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_value_sets.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建值集',:description=>'新建值集')
    irm_create_value_sets.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Value Set',:description=>'New Value Set')
    irm_create_value_sets.save
    irm_edit_value_sets= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_VALUE_SETS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_value_sets.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑值集',:description=>'编辑值集')
    irm_edit_value_sets.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Value Set',:description=>'Edit Value Set')
    irm_edit_value_sets.save
    irm_view_flexes= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_FLEXES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_flexes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'弹性域',:description=>'弹性域')
    irm_view_flexes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Flex Field',:description=>'Flex Field')
    irm_view_flexes.save
    irm_create_flexes= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'CREATE_FLEXES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_flexes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建弹性域',:description=>'新建弹性域')
    irm_create_flexes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Flex Field',:description=>'New Flex Field')
    irm_create_flexes.save
    irm_edit_flexes= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'EDIT_FLEXES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_flexes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑弹性域',:description=>'编辑弹性域')
    irm_edit_flexes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Flex Field',:description=>'Edit Flex Field')
    irm_edit_flexes.save
    irm_view_companies= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'VIEW_COMPANIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_companies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司',:description=>'公司')
    irm_view_companies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company',:description=>'Company')
    irm_view_companies.save
    irm_create_companies= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'CREATE_COMPANIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_companies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建公司',:description=>'新建公司')
    irm_create_companies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Company',:description=>'New Company')
    irm_create_companies.save
    irm_edit_companies= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'EDIT_COMPANIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_companies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑公司',:description=>'编辑公司')
    irm_edit_companies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Company',:description=>'Edit Company')
    irm_edit_companies.save
    irm_view_organizations= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'VIEW_ORGANIZATIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_organizations.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
    irm_view_organizations.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
    irm_view_organizations.save
    irm_create_organizations= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'CREATE_ORGANIZATIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_organizations.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建组织',:description=>'新建组织')
    irm_create_organizations.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Organization',:description=>'New Organization')
    irm_create_organizations.save
    irm_edit_organizations= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'EDIT_ORGANIZATIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_organizations.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑组织',:description=>'编辑组织')
    irm_edit_organizations.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Organization',:description=>'Edit Organization')
    irm_edit_organizations.save
    irm_view_departments= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'VIEW_DEPARTMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_departments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'部门',:description=>'部门')
    irm_view_departments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Department',:description=>'Department')
    irm_view_departments.save
    irm_create_departments= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'CREATE_DEPARTMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_departments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建部门',:description=>'新建部门')
    irm_create_departments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Department',:description=>'New Department')
    irm_create_departments.save
    irm_edit_departments= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'EDIT_DEPARTMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_departments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑部门',:description=>'编辑部门')
    irm_edit_departments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Department',:description=>'Edit Department')
    irm_edit_departments.save
    irm_view_people= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'VIEW_PEOPLE',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_people.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_view_people.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Person',:description=>'Person')
    irm_view_people.save
    irm_create_people= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'CREATE_PEOPLE',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_people.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建人员',:description=>'新建人员')
    irm_create_people.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Person',:description=>'New Person')
    irm_create_people.save
    irm_edit_people= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'EDIT_PEOPLE',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_people.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑人员',:description=>'编辑人员')
    irm_edit_people.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Person',:description=>'Edit Person')
    irm_edit_people.save
    irm_people_add_role= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'PEOPLE_ADD_ROLE',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_people_add_role.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理人员角色',:description=>'管理人员角色')
    irm_people_add_role.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Manage Person Role',:description=>'Manage Person Role')
    irm_people_add_role.save
    irm_people_edit_company_access= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'PEOPLE_EDIT_COMPANY_ACCESS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_people_edit_company_access.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'管理人员可访问公司',:description=>'管理人员可访问公司')
    irm_people_edit_company_access.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Manage Person Company access',:description=>'Manage Person Company access')
    irm_people_edit_company_access.save
    irm_view_regions= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'VIEW_REGIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_regions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'区域',:description=>'区域')
    irm_view_regions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Region',:description=>'Region')
    irm_view_regions.save
    irm_create_regions= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'CREATE_REGIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_regions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建区域',:description=>'新建区域')
    irm_create_regions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Region',:description=>'New Region')
    irm_create_regions.save
    irm_edit_regions= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'EDIT_REGIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_regions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑区域',:description=>'编辑区域')
    irm_edit_regions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Region',:description=>'Edit Region')
    irm_edit_regions.save
    irm_view_sites= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'VIEW_SITES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_sites.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'地点',:description=>'地点')
    irm_view_sites.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Site',:description=>'Site')
    irm_view_sites.save
    irm_create_sites= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'CREATE_SITES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_sites.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建地点',:description=>'新建地点')
    irm_create_sites.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Site',:description=>'New Site')
    irm_create_sites.save
    irm_edit_sites= Irm::Function.new(:group_code=>'IRM_LOCATION',:function_code=>'EDIT_SITES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_sites.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑地点',:description=>'编辑地点')
    irm_edit_sites.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Site',:description=>'Edit Site')
    irm_edit_sites.save
    irm_view_support_groups= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'VIEW_SUPPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_support_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'支持组',:description=>'支持组')
    irm_view_support_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group',:description=>'Support Group')
    irm_view_support_groups.save
    irm_create_support_groups= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'CREATE_SUPPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_support_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建支持组',:description=>'新建支持组')
    irm_create_support_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Support Group',:description=>'New Support Group')
    irm_create_support_groups.save
    irm_edit_support_groups= Irm::Function.new(:group_code=>'IRM_ORG_STRUCTURE',:function_code=>'EDIT_SUPPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_support_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑支持组',:description=>'编辑支持组')
    irm_edit_support_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Support Group',:description=>'Edit Support Group')
    irm_edit_support_groups.save
    irm_view_identities= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'VIEW_IDENTITIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_identities.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'账号',:description=>'账号')
    irm_view_identities.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Identity',:description=>'Identity')
    irm_view_identities.save
    irm_create_identities= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'CREATE_IDENTITIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_identities.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建账号',:description=>'新建账号')
    irm_create_identities.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Identity',:description=>'New Identity')
    irm_create_identities.save
    irm_edit_identities= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'EDIT_IDENTITIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_identities.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑账号',:description=>'编辑账号')
    irm_edit_identities.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Identity',:description=>'Edit Identity')
    irm_edit_identities.save
    irm_view_roles= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'VIEW_ROLES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_roles.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'角色',:description=>'角色')
    irm_view_roles.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Role',:description=>'Role')
    irm_view_roles.save
    irm_create_roles= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'CREATE_ROLES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_roles.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建角色',:description=>'新建角色')
    irm_create_roles.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Role',:description=>'New Role')
    irm_create_roles.save
    irm_edit_roles= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'EDIT_ROLES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_roles.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑角色',:description=>'编辑角色')
    irm_edit_roles.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Role',:description=>'Edit Role')
    irm_edit_roles.save
    irm_view_report_groups= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'VIEW_REPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_report_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表组',:description=>'报表组')
    irm_view_report_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report group',:description=>'Report group')
    irm_view_report_groups.save
    irm_create_report_groups= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'CREATE_REPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_report_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建报表组',:description=>'新建报表组')
    irm_create_report_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Report group',:description=>'New Report group')
    irm_create_report_groups.save
    irm_edit_report_groups= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'EDIT_REPORT_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_report_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑报表组',:description=>'编辑报表组')
    irm_edit_report_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Report group',:description=>'Edit Report group')
    irm_edit_report_groups.save
    irm_add_report_to_group= Irm::Function.new(:group_code=>'IRM_PERMISSION',:function_code=>'ADD_REPORT_TO_GROUP',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_add_report_to_group.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'添加报表到报表组',:description=>'添加报表到报表组')
    irm_add_report_to_group.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Add Report to Report group',:description=>'Add Report to Report group')
    irm_add_report_to_group.save
    irm_view_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'VIEW_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务宏',:description=>'服务宏')
    irm_view_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Script',:description=>'Script')
    irm_view_scripts.save
    irm_create_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'CREATE_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建服务宏',:description=>'新建服务宏')
    irm_create_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Script',:description=>'New Script')
    irm_create_scripts.save
    irm_edit_scripts= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'EDIT_SCRIPTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_scripts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑服务宏',:description=>'编辑服务宏')
    irm_edit_scripts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Script',:description=>'Edit Script')
    irm_edit_scripts.save
    irm_view_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'VIEW_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件模板',:description=>'邮件模板')
    irm_view_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Template',:description=>'Mail Template')
    irm_view_mail_templates.save
    irm_create_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'CREATE_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建邮件模板',:description=>'新建邮件模板')
    irm_create_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Mail Template',:description=>'New Mail Template')
    irm_create_mail_templates.save
    irm_edit_mail_templates= Irm::Function.new(:group_code=>'IRM_AUTOMATOR',:function_code=>'EDIT_MAIL_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_mail_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑邮件模板',:description=>'编辑邮件模板')
    irm_edit_mail_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Mail Template',:description=>'Edit Mail Template')
    irm_edit_mail_templates.save
    irm_view_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_view_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_view_menus.save
    irm_create_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建菜单',:description=>'新建菜单')
    irm_create_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Menu',:description=>'New Menu')
    irm_create_menus.save
    irm_edit_menus= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_MENUS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_menus.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑菜单',:description=>'编辑菜单')
    irm_edit_menus.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Menu',:description=>'Edit Menu')
    irm_edit_menus.save
    irm_view_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能组',:description=>'功能组')
    irm_view_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function Group',:description=>'Function Group')
    irm_view_function_groups.save
    irm_create_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建功能组',:description=>'新建功能组')
    irm_create_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Function Group',:description=>'New Function Group')
    irm_create_function_groups.save
    irm_edit_function_groups= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_FUNCTION_GROUPS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_function_groups.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑功能组',:description=>'编辑功能组')
    irm_edit_function_groups.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Function Group',:description=>'Edit Function Group')
    irm_edit_function_groups.save
    irm_view_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'功能',:description=>'功能')
    irm_view_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Function',:description=>'Function')
    irm_view_functions.save
    irm_create_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建功能',:description=>'新建功能')
    irm_create_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Function',:description=>'New Function')
    irm_create_functions.save
    irm_edit_functions= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_FUNCTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_functions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑功能',:description=>'编辑功能')
    irm_edit_functions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Function',:description=>'Edit Function')
    irm_edit_functions.save
    irm_view_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'VIEW_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_view_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_view_reports.save
    irm_create_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'CREATE_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建报表',:description=>'新建报表')
    irm_create_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Report',:description=>'New Report')
    irm_create_reports.save
    irm_edit_reports= Irm::Function.new(:group_code=>'IRM_DEV_PERMISSION',:function_code=>'EDIT_REPORTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_reports.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑报表',:description=>'编辑报表')
    irm_edit_reports.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Report',:description=>'Edit Report')
    irm_edit_reports.save
    irm_view_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'VIEW_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'触发条件',:description=>'触发条件')
    irm_view_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Condition',:description=>'Condition')
    irm_view_conditions.save
    irm_create_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'CREATE_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建触发条件',:description=>'新建触发条件')
    irm_create_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Condition',:description=>'New Condition')
    irm_create_conditions.save
    irm_edit_conditions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'EDIT_CONDITIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_conditions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑触发条件',:description=>'编辑触发条件')
    irm_edit_conditions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Condition',:description=>'Edit Condition')
    irm_edit_conditions.save
    irm_view_actions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'VIEW_ACTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_actions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'执行动作',:description=>'执行动作')
    irm_view_actions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Action',:description=>'Action')
    irm_view_actions.save
    irm_create_actions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'CREATE_ACTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_actions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建执行动作',:description=>'新建执行动作')
    irm_create_actions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Action',:description=>'New Action')
    irm_create_actions.save
    irm_edit_actions= Irm::Function.new(:group_code=>'IRM_DEV_AUTOMATOR',:function_code=>'EDIT_ACTIONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_actions.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑执行动作',:description=>'编辑执行动作')
    irm_edit_actions.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Action',:description=>'Edit Action')
    irm_edit_actions.save
    irm_view_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'货币',:description=>'货币')
    irm_view_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Currency',:description=>'Currency')
    irm_view_currencies.save
    irm_create_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建货币',:description=>'新建货币')
    irm_create_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Currency',:description=>'New Currency')
    irm_create_currencies.save
    irm_edit_currencies= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_CURRENCIES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_currencies.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑货币',:description=>'编辑货币')
    irm_edit_currencies.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Currency',:description=>'Edit Currency')
    irm_edit_currencies.save
    irm_view_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'语言',:description=>'语言')
    irm_view_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Language',:description=>'Language')
    irm_view_languages.save
    irm_create_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建语言',:description=>'新建语言')
    irm_create_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Language',:description=>'New Language')
    irm_create_languages.save
    irm_edit_languages= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_LANGUAGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_languages.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑语言',:description=>'编辑语言')
    irm_edit_languages.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Language',:description=>'Edit Language')
    irm_edit_languages.save
    irm_view_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'产品模块',:description=>'产品模块')
    irm_view_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Product Module',:description=>'Product Module')
    irm_view_product_modules.save
    irm_create_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'CREATE_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建产品模块',:description=>'新建产品模块')
    irm_create_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Product Module',:description=>'New Product Module')
    irm_create_product_modules.save
    irm_edit_product_modules= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'EDIT_PRODUCT_MODULES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_product_modules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑产品模块',:description=>'编辑产品模块')
    irm_edit_product_modules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Product Module',:description=>'Edit Product Module')
    irm_edit_product_modules.save
    irm_view_dev_tools= Irm::Function.new(:group_code=>'IRM_DEV_ADVANCE',:function_code=>'VIEW_DEV_TOOLS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_dev_tools.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发工具',:description=>'开发工具')
    irm_view_dev_tools.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Dev Tools',:description=>'Dev Tools')
    irm_view_dev_tools.save
    irm_view_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'VIEW_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故规则',:description=>'事故规则')
    irm_view_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Rule',:description=>'Incident Rule')
    irm_view_rule_settings.save
    irm_create_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'CREATE_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故规则',:description=>'新建事故规则')
    irm_create_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Incident Rule',:description=>'New Incident Rule')
    irm_create_rule_settings.save
    irm_edit_rule_settings= Irm::Function.new(:group_code=>'ICM_COMMON_SETTING',:function_code=>'EDIT_RULE_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_rule_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故规则',:description=>'编辑事故规则')
    irm_edit_rule_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Incident Rule',:description=>'Edit Incident Rule')
    irm_edit_rule_settings.save
    icm_view_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'紧急度',:description=>'紧急度')
    icm_view_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Urgence Code',:description=>'Urgence Code')
    icm_view_urgence_codes.save
    icm_create_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建紧急度',:description=>'新建紧急度')
    icm_create_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Urgence Code',:description=>'New Urgence Code')
    icm_create_urgence_codes.save
    icm_edit_urgence_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_URGENCE_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_urgence_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑紧急度',:description=>'编辑紧急度')
    icm_edit_urgence_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Urgence Code',:description=>'Edit Urgence Code')
    icm_edit_urgence_codes.save
    icm_view_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'影响度',:description=>'影响度')
    icm_view_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Impact Range',:description=>'Impact Range')
    icm_view_impact_ranges.save
    icm_create_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建影响度',:description=>'新建影响度')
    icm_create_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Impact Range',:description=>'New Impact Range')
    icm_create_impact_ranges.save
    icm_edit_impact_ranges= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_IMPACT_RANGES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_impact_ranges.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑影响度',:description=>'编辑影响度')
    icm_edit_impact_ranges.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Impact Range',:description=>'Edit Impact Range')
    icm_edit_impact_ranges.save
    icm_view_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'优先级',:description=>'优先级')
    icm_view_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Priority',:description=>'Priority')
    icm_view_priority_codes.save
    icm_create_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建优先级',:description=>'新建优先级')
    icm_create_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Priority',:description=>'New Priority')
    icm_create_priority_codes.save
    icm_edit_priority_codes= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_PRIORITY_CODES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_priority_codes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑优先级',:description=>'编辑优先级')
    icm_edit_priority_codes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Priority',:description=>'Edit Priority')
    icm_edit_priority_codes.save
    icm_view_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组指派',:description=>'组指派')
    icm_view_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Group Assign',:description=>'Group Assign')
    icm_view_group_assignments.save
    icm_create_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建组指派',:description=>'新建组指派')
    icm_create_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Group Assign',:description=>'New Group Assign')
    icm_create_group_assignments.save
    icm_edit_group_assignments= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_GROUP_ASSIGNMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_group_assignments.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑组指派',:description=>'编辑组指派')
    icm_edit_group_assignments.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Group Assign',:description=>'Edit Group Assign')
    icm_edit_group_assignments.save
    icm_view_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故阶段',:description=>'事故阶段')
    icm_view_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Phase',:description=>'Phase')
    icm_view_incident_phases.save
    icm_create_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故阶段',:description=>'新建事故阶段')
    icm_create_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Phase',:description=>'New Phase')
    icm_create_incident_phases.save
    icm_edit_incident_phases= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_INCIDENT_PHASES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_incident_phases.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故阶段',:description=>'编辑事故阶段')
    icm_edit_incident_phases.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Phase',:description=>'Edit Phase')
    icm_edit_incident_phases.save
    icm_view_incident_statuses= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'VIEW_INCIDENT_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_view_incident_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单状态',:description=>'事故单状态')
    icm_view_incident_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Status',:description=>'Status')
    icm_view_incident_statuses.save
    icm_create_incident_statuses= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'CREATE_INCIDENT_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_create_incident_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事故单状态',:description=>'新建事故单状态')
    icm_create_incident_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Status',:description=>'New Status')
    icm_create_incident_statuses.save
    icm_edit_incident_statuses= Irm::Function.new(:group_code=>'ICM_SETTING',:function_code=>'EDIT_INCIDENT_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    icm_edit_incident_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故单状态',:description=>'编辑事故单状态')
    icm_edit_incident_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Status',:description=>'Edit Status')
    icm_edit_incident_statuses.save
    skm_view_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库状态',:description=>'知识库状态')
    skm_view_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Stauts',:description=>'Stauts')
    skm_view_entry_statuses.save
    skm_create_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_create_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识库状态',:description=>'新建知识库状态')
    skm_create_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Stauts',:description=>'New Stauts')
    skm_create_entry_statuses.save
    skm_edit_entry_statuses= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_STATUSES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_entry_statuses.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识库状态',:description=>'编辑知识库状态')
    skm_edit_entry_statuses.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Stauts',:description=>'Edit Stauts')
    skm_edit_entry_statuses.save
    skm_view_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭原因',:description=>'关闭原因')
    skm_view_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close Reason',:description=>'Close Reason')
    skm_view_close_reasons.save
    skm_create_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_create_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建关闭原因',:description=>'新建关闭原因')
    skm_create_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Close Reason',:description=>'New Close Reason')
    skm_create_close_reasons.save
    skm_edit_close_reasons= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_CLOSE_REASONS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_close_reasons.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑关闭原因',:description=>'编辑关闭原因')
    skm_edit_close_reasons.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Close Reason',:description=>'Edit Close Reason')
    skm_edit_close_reasons.save
    skm_view_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识模板',:description=>'知识模板')
    skm_view_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry Template',:description=>'Entry Template')
    skm_view_entry_templates.save
    skm_create_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_create_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识模板',:description=>'新建知识模板')
    skm_create_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Entry Template',:description=>'New Entry Template')
    skm_create_entry_templates.save
    skm_edit_entry_templates= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_TEMPLATES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_entry_templates.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识模板',:description=>'编辑知识模板')
    skm_edit_entry_templates.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Entry Template',:description=>'Edit Entry Template')
    skm_edit_entry_templates.save
    skm_view_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识模板元素',:description=>'知识模板元素')
    skm_view_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Template Element',:description=>'Template Element')
    skm_view_entry_template_elements.save
    skm_create_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_create_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识模板元素',:description=>'新建知识模板元素')
    skm_create_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Template Element',:description=>'New Template Element')
    skm_create_entry_template_elements.save
    skm_edit_entry_template_elements= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_ENTRY_TEMPLATE_ELEMENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_entry_template_elements.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识模板元素',:description=>'编辑知识模板元素')
    skm_edit_entry_template_elements.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Template Element',:description=>'Edit Template Element')
    skm_edit_entry_template_elements.save
    skm_view_skm_settings= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_SKM_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_skm_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看知识库设置',:description=>'查看知识库设置')
    skm_view_skm_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View SKM Settings',:description=>'View SKM Settings')
    skm_view_skm_settings.save
    skm_edit_skm_settings= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_SKM_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_skm_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识库设置',:description=>'编辑知识库设置')
    skm_edit_skm_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit SKM Settings',:description=>'Edit SKM Settings')
    skm_edit_skm_settings.save
  end

  def self.down
  end
end
