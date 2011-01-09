# -*- coding: utf-8 -*-
class AddSetingMenuPermission < ActiveRecord::Migration
  def self.up
    irm_setting_index = Irm::Permission.new(:permission_code=>'IRM_SETTING_INDEX',
                                             :page_controller=>'irm/setting',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_setting_index.permissions_tls.build(:language=>'zh',:name=>'系统设置页面入口',:description=>'系统设置页面入口',:source_lang=>'en')
    irm_setting_index.permissions_tls.build(:language=>'en',:name=>'System Setting Entrance',:description=>'System Setting Entrance',:source_lang=>'en')
    irm_setting_index.save

    irm_setting_common = Irm::Permission.new(:permission_code=>'IRM_SETTING_COMMON',
                                             :page_controller=>'irm/setting',
                                             :page_action=>'common',
                                             :not_auto_mult=>true)
    irm_setting_common.permissions_tls.build(:language=>'zh',:name=>'系统设置通用页面',:description=>'系统设置通用页面',:source_lang=>'en')
    irm_setting_common.permissions_tls.build(:language=>'en',:name=>'System Setting Common',:description=>'System Setting Common',:source_lang=>'en')
    irm_setting_common.save

    irm_setting_entrance_menu = Irm::Menu.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:not_auto_mult=>true)
    irm_setting_entrance_menu.menus_tls.build(:language=>'zh',:name=>'系统设置菜单',:description=>'系统设置菜单',:source_lang=>'en')
    irm_setting_entrance_menu.menus_tls.build(:language=>'en',:name=>'System Setting Menu',:description=>'System Setting Menu',:source_lang=>'en')
    irm_setting_entrance_menu.save

    entrance_admin = Irm::MenuEntry.where(:menu_code=>'IRM_ENTRANCE_MENU',:sub_menu_code=>'IRM_ADMIN_MENU',:permission_code=>'IRM_NAVIGATIONS_ADMIN').first

    entrance_admin.destroy if entrance_admin

    setting_admin = Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_ADMIN_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    setting_admin.menu_entries_tls.build(:language=>'zh',:name=>'设置',:description=>'设置',:source_lang=>'en')
    setting_admin.menu_entries_tls.build(:language=>'en',:name=>'Setting',:description=>'Setting',:source_lang=>'en')
    setting_admin.save

    admin_advance_setting = Irm::MenuEntry.where(:menu_code=>'IRM_ADMIN_MENU',:sub_menu_code=>'IRM_ADVANCE_SETTING_MENU',:permission_code=>'IRM_NAVIGATIONS_ADVNACE_SETTIN').first
    admin_advance_setting.update_attributes(:permission_code=>nil) if admin_advance_setting

    admin_base_setting = Irm::MenuEntry.where(:menu_code=>'IRM_ADMIN_MENU',:sub_menu_code=>'IRM_BASE_SETTING_MENU',:permission_code=>'IRM_NAVIGATIONS_BASE_SETTIN').first
    admin_base_setting.update_attributes(:permission_code=>nil) if admin_advance_setting

    admin_icm_setting = Irm::MenuEntry.where(:menu_code=>'IRM_ADMIN_MENU',:sub_menu_code=>'IRM_ICM_SETTING_MENU',:permission_code=>'IRM_NAVIGATIONS_ICM_SETTING').first
    admin_icm_setting.update_attributes(:permission_code=>nil) if admin_advance_setting

    setting_common = Irm::MenuEntry.new(:menu_code=>'IRM_SETTING_ENTRANCE_MENU',
                                         :permission_code=>'IRM_SETTING_COMMON',
                                         :display_flag => "N",
                                         :display_sequence=>100,
                                         :not_auto_mult=>true)
    setting_common.menu_entries_tls.build(:language=>'zh',:name=>'设置公用页面',:description=>'设置公用页面',:source_lang=>'en')
    setting_common.menu_entries_tls.build(:language=>'en',:name=>'Setting Common',:description=>'Setting Common',:source_lang=>'en')
    setting_common.save
  end

  def self.down
  end
end
