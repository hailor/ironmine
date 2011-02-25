# -*- coding: utf-8 -*-
class AddFileManagementMenuData < ActiveRecord::Migration
  def self.up

    irm_irm_soc_file_management_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_FILE_MANAGEMENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_soc_file_management_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC文件管理',:description=>'SOC文件管理')
    irm_irm_soc_file_management_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC file management',:description=>'SOC file management')
    irm_irm_soc_file_management_menu.save
    skm_menu_entiry_84= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_FILE_MANAGEMENT_MENU',:permission_code=>nil,:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_84.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_84.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_84.save   
  end

  def self.down
  end
end
