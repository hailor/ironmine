# -*- coding: utf-8 -*-
class InitCmsBaseMenus < ActiveRecord::Migration
  def self.up
    cms_irm_change_management_menu= Irm::Menu.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    cms_irm_change_management_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC变更发布中心',:description=>'SOC变更发布中心')
    cms_irm_change_management_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC change managment',:description=>'SOC change management')
    cms_irm_change_management_menu.save
    cms_irm_cmo_home_menu= Irm::Menu.new(:menu_code=>'IRM_CMO_HOME_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    cms_irm_cmo_home_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'CMO主页',:description=>'CMO主页')
    cms_irm_cmo_home_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'CMO home page',:description=>'CMO home page')
    cms_irm_cmo_home_menu.save

    cms_menu_entiry_75= Irm::MenuEntry.new(:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',:sub_menu_code=>'IRM_CMO_HOME_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    cms_menu_entiry_75.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    cms_menu_entiry_75.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    cms_menu_entiry_75.save
    cms_menu_entiry_76= Irm::MenuEntry.new(:menu_code=>'IRM_CMO_HOME_MENU',:sub_menu_code=>nil,:permission_code=>'CMS_HOME_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    cms_menu_entiry_76.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    cms_menu_entiry_76.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    cms_menu_entiry_76.save
  end

  def self.down
  end
end
