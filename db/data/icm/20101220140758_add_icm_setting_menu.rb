class AddIcmSettingMenu < ActiveRecord::Migration
  def self.up
    irm_navigations_icm_setting = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_ICM_SETTING',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'icm_setting',
                                             :not_auto_mult=>true)
    irm_navigations_icm_setting.permissions_tls.build(:language=>'zh',:name=>'事故管理设置',:description=>'事故管理设置',:source_lang=>'en')
    irm_navigations_icm_setting.permissions_tls.build(:language=>'en',:name=>'ICM Setting',:description=>'ICM Setting',:source_lang=>'en')
    irm_navigations_icm_setting.save

    irm_icm_setting_menu = Irm::Menu.new(:menu_code=>'IRM_ICM_SETTING_MENU',:icon=>'icm_settings.gif',:not_auto_mult=>true)
    irm_icm_setting_menu.menus_tls.build(:language=>'zh',:name=>'事故管理设置菜单',:description=>'事故管理设置菜单',:source_lang=>'en')
    irm_icm_setting_menu.menus_tls.build(:language=>'en',:name=>'ICM Setting Menu',:description=>'ICM Setting Menu',:source_lang=>'en')
    irm_icm_setting_menu.save

    admin_icm_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_ICM_SETTING',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    admin_icm_setting.menu_entries_tls.build(:language=>'zh',:name=>'事故管理设置',:description=>'事故管理设置',:source_lang=>'en')
    admin_icm_setting.menu_entries_tls.build(:language=>'en',:name=>'ICM Setting',:description=>'ICM Setting',:source_lang=>'en')
    admin_icm_setting.save

    icm_setting_rule_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_RULE_SETTINGS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    icm_setting_rule_setting.menu_entries_tls.build(:language=>'zh',:name=>'规则设置',:description=>'规则设置',:source_lang=>'en')
    icm_setting_rule_setting.menu_entries_tls.build(:language=>'en',:name=>'Rule setting',:description=>'Rule setting',:source_lang=>'en')
    icm_setting_rule_setting.save
  end

  def self.down
  end
end
