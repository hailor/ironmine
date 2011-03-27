# -*- coding: utf-8 -*-
class InitCommonFunction < ActiveRecord::Migration
  def self.up
    Irm::FunctionGroup.delete_all
    Irm::FunctionGroupsTl.delete_all
    Irm::Function.delete_all
    Irm::FunctionsTl.delete_all
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
     irm_view_auth_sources= Irm::Function.new(:group_code=>'IRM_COMMON_SETTING',:function_code=>'VIEW_AUTH_SOURCES',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
     irm_view_auth_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看LDAP认证',:description=>'查看LDAP认证')
     irm_view_auth_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View LDAP Authsources',:description=>'View LDAP Authsources')
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
  end

  def self.down
  end
end
