# -*- coding: utf-8 -*-
class AddFileManagementMenuData2 < ActiveRecord::Migration
  def self.up
    skm_menu_entiry_85= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_FILE_MANAGEMENT_MENU',:sub_menu_code=>nil,:permission_code=>'SKM_FILE_MANAGEMENTs_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_85.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_85.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_85.save
    
  end

  def self.down
  end
end
