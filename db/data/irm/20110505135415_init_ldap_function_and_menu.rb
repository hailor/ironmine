# -*- coding: utf-8 -*-
class InitLdapFunctionAndMenu < ActiveRecord::Migration
  def self.up
    deleteable_menuentries = Irm::MenuEntry.where("#{Irm::MenuEntry.table_name}.menu_code IN (?)",["LDAP_INTEGRATION"])

    deleteable_menuentries.each do |dm|
      dm.delete
    end

    irm_ldap_user= Irm::Menu.new(:menu_code=>'LDAP_USER',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_ldap_user.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP用户',:description=>'LDAP用户')
    irm_ldap_user.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP User',:description=>'LDAP User')
    irm_ldap_user.save
    irm_ldap_organization= Irm::Menu.new(:menu_code=>'LDAP_ORGANIZATION',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_ldap_organization.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP组织',:description=>'LDAP组织')
    irm_ldap_organization.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Organization',:description=>'LDAP Organization')
    irm_ldap_organization.save

    irm_menu_entiry_91= Irm::MenuEntry.new(:menu_code=>'LDAP_INTEGRATION',:sub_menu_code=>nil,:page_controller=>'irm/ldap_sources',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP源',:description=>'LDAP源')
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Source',:description=>'LDAP Source')
    irm_menu_entiry_91.save
    irm_menu_entiry_92= Irm::MenuEntry.new(:menu_code=>'LDAP_INTEGRATION',:sub_menu_code=>'LDAP_USER',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户',:description=>'用户')
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User',:description=>'User')
    irm_menu_entiry_92.save
    irm_menu_entiry_93= Irm::MenuEntry.new(:menu_code=>'LDAP_USER',:sub_menu_code=>nil,:page_controller=>'irm/ldap_auth_headers',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户验证',:description=>'用户验证')
    irm_menu_entiry_93.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP User Auth',:description=>'LDAP User Auth')
    irm_menu_entiry_93.save
    irm_menu_entiry_94= Irm::MenuEntry.new(:menu_code=>'LDAP_USER',:sub_menu_code=>nil,:page_controller=>'irm/ldap_auth_attributes',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户验证属性',:description=>'用户验证属性')
    irm_menu_entiry_94.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'User Auth Attribute',:description=>'User Auth Attribute')
    irm_menu_entiry_94.save
    irm_menu_entiry_95= Irm::MenuEntry.new(:menu_code=>'LDAP_INTEGRATION',:sub_menu_code=>'LDAP_ORGANIZATION',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织',:description=>'组织')
    irm_menu_entiry_95.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Organization',:description=>'Organization')
    irm_menu_entiry_95.save
    irm_menu_entiry_96= Irm::MenuEntry.new(:menu_code=>'LDAP_ORGANIZATION',:sub_menu_code=>nil,:page_controller=>'irm/ldap_syn_headers',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构同步',:description=>'组织结构同步')
    irm_menu_entiry_96.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Sync Organization Structure',:description=>'Sync Organization Structure')
    irm_menu_entiry_96.save
    irm_menu_entiry_97= Irm::MenuEntry.new(:menu_code=>'LDAP_ORGANIZATION',:sub_menu_code=>nil,:page_controller=>'irm/ldap_syn_attributes',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组织结构同步属性',:description=>'组织结构同步属性')
    irm_menu_entiry_97.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Sync Organization Structure Attribute',:description=>'Sync Organization Structure Attribute')
    irm_menu_entiry_97.save



    irm_irm_ldap_integration= Irm::FunctionGroup.new(:group_code=>'IRM_LDAP_INTEGRATION',:not_auto_mult=>true)
    irm_irm_ldap_integration.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP集成',:description=>'LDAP集成')
    irm_irm_ldap_integration.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDPA Integration',:description=>'LDPA Integration')
    irm_irm_ldap_integration.save


    irm_view_ldap_sources= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'VIEW_LDAP_SOURCES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_ldap_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'LDAP源',:description=>'LDAP源')
    irm_view_ldap_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'LDAP Source',:description=>'LDAP Source')
    irm_view_ldap_sources.save
    irm_create_ldap_sources= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'CREATE_LDAP_SOURCES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_ldap_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建LDAP源',:description=>'新建LDAP源')
    irm_create_ldap_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New LDAP Source',:description=>'New LDAP Source')
    irm_create_ldap_sources.save
    irm_edit_ldap_sources= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'EDIT_LDAP_SOURCES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_ldap_sources.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑LDAP源',:description=>'编辑LDAP源')
    irm_edit_ldap_sources.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit LDAP Source',:description=>'Edit LDAP Source')
    irm_edit_ldap_sources.save
    irm_view_ldap_auth_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'VIEW_LDAP_AUTH_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_ldap_auth_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户',:description=>'用户')
    irm_view_ldap_auth_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'User',:description=>'User')
    irm_view_ldap_auth_headers.save
    irm_create_ldap_auth_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'CREATE_LDAP_AUTH_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_ldap_auth_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建用户',:description=>'新建用户')
    irm_create_ldap_auth_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New User',:description=>'New User')
    irm_create_ldap_auth_headers.save
    irm_edit_ldap_auth_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'EDIT_LDAP_AUTH_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_ldap_auth_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑用户',:description=>'编辑用户')
    irm_edit_ldap_auth_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit User',:description=>'Edit User')
    irm_edit_ldap_auth_headers.save
    irm_view_ldap_syn_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'VIEW_LDAP_SYN_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_ldap_syn_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公司&组织',:description=>'公司&组织')
    irm_view_ldap_syn_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company&Organization',:description=>'Company&Organization')
    irm_view_ldap_syn_headers.save
    irm_create_ldap_syn_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'CREATE_LDAP_SYN_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_ldap_syn_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建公司&组织',:description=>'新建公司&组织')
    irm_create_ldap_syn_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Company&Organization',:description=>'New Company&Organization')
    irm_create_ldap_syn_headers.save
    irm_edit_ldap_syn_headers= Irm::Function.new(:group_code=>'IRM_LDAP_INTEGRATION',:function_code=>'EDIT_LDAP_SYN_HEADERS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_ldap_syn_headers.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑公司&组织',:description=>'编辑公司&组织')
    irm_edit_ldap_syn_headers.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Company&Organization',:description=>'Edit Company&Organization')
    irm_edit_ldap_syn_headers.save
  end

  def self.down
  end
end
