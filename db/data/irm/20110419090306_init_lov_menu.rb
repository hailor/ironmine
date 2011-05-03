# -*- coding: utf-8 -*-
class InitLovMenu < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_118= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_BUSINESS_OBJECT_MENU',:sub_menu_code=>nil,:page_controller=>'irm/list_of_values',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_118.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'值列表',:description=>'值列表')
    irm_menu_entiry_118.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'List of Value',:description=>'List of Value')
    irm_menu_entiry_118.save
  end

  def self.down
  end
end
