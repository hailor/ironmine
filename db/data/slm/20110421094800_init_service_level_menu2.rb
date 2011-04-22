# -*- coding: utf-8 -*-
class InitServiceLevelMenu2 < ActiveRecord::Migration
  def self.up
    slm_menu_entry= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'SLM_ADMIN_SETTING_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务级别管理',:description=>'服务级别管理')
     slm_menu_entry.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Level Management',:description=>'Service Level Management')
     slm_menu_entry.save
  end

  def self.down
  end
end
