# -*- coding: utf-8 -*-
class InitAdvanceSettingMenu < ActiveRecord::Migration
  def self.up
    advance_setting_menu = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_MENUS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    advance_setting_menu.menu_entries_tls.build(:language=>'zh',:name=>'菜单',:description=>'菜单',:source_lang=>'en')
    advance_setting_menu.menu_entries_tls.build(:language=>'en',:name=>'Menus',:description=>'Menus',:source_lang=>'en')
    advance_setting_menu.save

    advance_setting_ldap = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_AUTH_SOURCES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    advance_setting_ldap.menu_entries_tls.build(:language=>'zh',:name=>'LDAP认证',:description=>'LDAP认证',:source_lang=>'en')
    advance_setting_ldap.menu_entries_tls.build(:language=>'en',:name=>'LDAP Auth source',:description=>'LDAP Auth source',:source_lang=>'en')
    advance_setting_ldap.save

    advance_setting_global_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_GLOBAL_SETTINGS_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    advance_setting_global_setting.menu_entries_tls.build(:language=>'zh',:name=>'全局设置',:description=>'全局设置',:source_lang=>'en')
    advance_setting_global_setting.menu_entries_tls.build(:language=>'en',:name=>'Global Setting',:description=>'LDAP Auth source',:source_lang=>'en')
    advance_setting_global_setting.save

    advance_setting_language = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_LANGUAGES_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    advance_setting_language.menu_entries_tls.build(:language=>'zh',:name=>'语言',:description=>'语言',:source_lang=>'en')
    advance_setting_language.menu_entries_tls.build(:language=>'en',:name=>'Languages',:description=>'Languages',:source_lang=>'en')
    advance_setting_language.save

    advance_setting_product_module = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_PRODUCT_MODULES_INDEX',
                                         :display_sequence=>50,
                                         :not_auto_mult=>true)
    advance_setting_product_module.menu_entries_tls.build(:language=>'zh',:name=>'产品模块',:description=>'产品模块',:source_lang=>'en')
    advance_setting_product_module.menu_entries_tls.build(:language=>'en',:name=>'Product modules',:description=>'Product modules',:source_lang=>'en')
    advance_setting_product_module.save

    advance_setting_condition = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_CONDITIONS_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    advance_setting_condition.menu_entries_tls.build(:language=>'zh',:name=>'触发条件',:description=>'触发条件',:source_lang=>'en')
    advance_setting_condition.menu_entries_tls.build(:language=>'en',:name=>'Conditions',:description=>'Conditions',:source_lang=>'en')
    advance_setting_condition.save

    advance_setting_action = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_ACTIONS_INDEX',
                                         :display_sequence=>70,
                                         :not_auto_mult=>true)
    advance_setting_action.menu_entries_tls.build(:language=>'zh',:name=>'执行动作',:description=>'执行动作',:source_lang=>'en')
    advance_setting_action.menu_entries_tls.build(:language=>'en',:name=>'Actions',:description=>'Actions',:source_lang=>'en')
    advance_setting_action.save


    advance_setting_script = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_SCRIPTS_INDEX',
                                         :display_sequence=>80,
                                         :not_auto_mult=>true)
    advance_setting_script.menu_entries_tls.build(:language=>'zh',:name=>'服务宏',:description=>'服务宏',:source_lang=>'en')
    advance_setting_script.menu_entries_tls.build(:language=>'en',:name=>'Scripts',:description=>'Scripts',:source_lang=>'en')
    advance_setting_script.save

    advance_setting_mail_template = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_MAIL_TEMPLATES_INDEX',
                                         :display_sequence=>90,
                                         :not_auto_mult=>true)
    advance_setting_mail_template.menu_entries_tls.build(:language=>'zh',:name=>'邮件模板',:description=>'邮件模板',:source_lang=>'en')
    advance_setting_mail_template.menu_entries_tls.build(:language=>'en',:name=>'Mail templates',:description=>'Mail templates',:source_lang=>'en')
    advance_setting_mail_template.save

    advance_setting_currency = Irm::MenuEntry.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_CURRENCIES_INDEX',
                                         :display_sequence=>100,
                                         :not_auto_mult=>true)
    advance_setting_currency.menu_entries_tls.build(:language=>'zh',:name=>'货币',:description=>'货币',:source_lang=>'en')
    advance_setting_currency.menu_entries_tls.build(:language=>'en',:name=>'Currencies',:description=>'Currencies',:source_lang=>'en')
    advance_setting_currency.save

  end

  def self.down
  end
end
