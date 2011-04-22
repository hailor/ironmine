class AddUidFunctionToIrmMenu < ActiveRecord::Migration
  def self.up
     uid_external_system_menu= Irm::Menu.new(:menu_code=>'IRM_EXTERNAL_SYSTEM_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
     uid_external_system_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统')
     uid_external_system_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
     uid_external_system_menu.save

     uid_menu_entry_1= Irm::MenuEntry.new(:menu_code=>'IRM_EXTERNAL_SYSTEM_MENU',:sub_menu_code=>nil,:page_controller=>"uid/external_logins",:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entry_1.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部 Login ID',:description=>'外部 Login ID')
     uid_menu_entry_1.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External Login ID',:description=>'External Login ID')
     uid_menu_entry_1.save

     uid_menu_entry_2= Irm::MenuEntry.new(:menu_code=>'IRM_EXTERNAL_SYSTEM_MENU',:sub_menu_code=>nil,:page_controller=>"uid/external_systems",:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entry_2.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统定义',:description=>'系统定义')
     uid_menu_entry_2.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'System',:description=>'System')
     uid_menu_entry_2.save

     uid_menu_entry_3= Irm::MenuEntry.new(:menu_code=>'IRM_EXTERNAL_SYSTEM_MENU',:sub_menu_code=>nil,:page_controller=>"uid/login_mappings",:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entry_3.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'统一用户',:description=>'统一用户')
     uid_menu_entry_3.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Unify User',:description=>'Unify User')
     uid_menu_entry_3.save

     uid_menu_entry_4= Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',:sub_menu_code=>'IRM_EXTERNAL_SYSTEM_MENU',:page_controller=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
     uid_menu_entry_4.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'外部系统',:description=>'外部系统')
     uid_menu_entry_4.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'External System',:description=>'External System')
     uid_menu_entry_4.save

  end

  def self.down
  end
end
