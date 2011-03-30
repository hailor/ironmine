# -*- coding: utf-8 -*-
class InitUidMenu < ActiveRecord::Migration
  def self.up

    uid_uum_menu= Irm::Menu.new(:menu_code=>'IRM_USER_MANAGE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    uid_uum_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户管理',:description=>'统一用户管理')
    uid_uum_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC UUM',:description=>'SOC UUM')
    uid_uum_menu.save

     uid_menu_entry_79= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_USER_MANAGE_MENU',
                                           :page_controller=>nil,:display_sequence=>80,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_79.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户管理',:description=>'统一用户管理')
    uid_menu_entry_79.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Unify User Management',:description=>'Unify User Management')
    uid_menu_entry_79.save
    uid_menu_entry_80= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/uid_home',
                                          :display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_80.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户管理',:description=>'统一用户管理')
    uid_menu_entry_80.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Unify User Management',:description=>'Unify User Management')
    uid_menu_entry_80.save

    uid_menu_entry_81= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/external_systems',
                                          :display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_81.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统')
    uid_menu_entry_81.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
    uid_menu_entry_81.save


    uid_menu_entry_82= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/external_logins',
                                          :display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_82.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统登录',:description=>'外部系统登录')
    uid_menu_entry_82.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External Login',:description=>'External Login')
    uid_menu_entry_82.save


    uid_menu_entry_83= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/login_mappings',
                                          :display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_83.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'匹配登录',:description=>'匹配登录')
    uid_menu_entry_83.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mapping Login',:description=>'Mapping Login')
    uid_menu_entry_83.save

    uid_menu_entry_84= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/auto_mappings',
                                          :display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_84.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'自动匹配',:description=>'自动匹配')
    uid_menu_entry_84.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Auto Mapping',:description=>'Auto Mapping')
    uid_menu_entry_84.save

    uid_menu_entry_85= Irm::MenuEntry.new(:menu_code=>'IRM_USER_MANAGE_MENU',:sub_menu_code=>nil,:page_controller=>'uid/import_files',
                                          :display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    uid_menu_entry_85.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'导入文件',:description=>'导入文件')
    uid_menu_entry_85.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Import File',:description=>'Import File')
    uid_menu_entry_85.save
  end

  def self.down
  end
end
