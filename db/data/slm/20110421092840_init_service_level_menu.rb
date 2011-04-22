# -*- coding: utf-8 -*-
class InitServiceLevelMenu < ActiveRecord::Migration
  def self.up
     slm_service_level_management_menu= Irm::Menu.new(:menu_code=>'SLM_ADMIN_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
     slm_service_level_management_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务级别管理',:description=>'服务级别管理')
     slm_service_level_management_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Level Management',:description=>'Service Level Management')
     slm_service_level_management_menu.save
     slm_service_catalog_menu= Irm::Menu.new(:menu_code=>'SLM_ADMIN_CATALOG_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
     slm_service_catalog_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务目录',:description=>'服务级别管理')
     slm_service_catalog_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Catalog',:description=>'Service Catalog')
     slm_service_catalog_menu.save
     slm_service_agreement_menu= Irm::Menu.new(:menu_code=>'SLM_ADMIN_AGREEMENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
     slm_service_agreement_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务协议',:description=>'服务级别管理')
     slm_service_agreement_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Agreement',:description=>'Service Agreement')
     slm_service_agreement_menu.save

     slm_menu_entry_1= Irm::MenuEntry.new(:menu_code=>'SLM_ADMIN_SETTING_MENU',:sub_menu_code=>'SLM_ADMIN_CATALOG_MENU',:page_controller=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry_1.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务目录设置',:description=>'服务目录设置')
     slm_menu_entry_1.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Catalog Setting',:description=>'Service Catalog Setting')
     slm_menu_entry_1.save

     slm_menu_entry_2= Irm::MenuEntry.new(:menu_code=>'SLM_ADMIN_SETTING_MENU',:sub_menu_code=>'SLM_ADMIN_AGREEMENT_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry_2.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务协议设置',:description=>'服务协议设置')
     slm_menu_entry_2.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Agreement Setting',:description=>'Service Agreement Setting')
     slm_menu_entry_2.save

     slm_menu_entry_3= Irm::MenuEntry.new(:menu_code=>'SLM_ADMIN_CATALOG_MENU',:sub_menu_code=>nil,:page_controller=>"slm/service_categories",:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry_3.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务类别',:description=>'服务类别')
     slm_menu_entry_3.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Category',:description=>'Service Category')
     slm_menu_entry_3.save

     slm_menu_entry_4= Irm::MenuEntry.new(:menu_code=>'SLM_ADMIN_CATALOG_MENU',:sub_menu_code=>nil,:page_controller=>"slm/service_catalogs",:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry_4.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务目录',:description=>'服务目录')
     slm_menu_entry_4.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Catalog',:description=>'Service Catalog')
     slm_menu_entry_4.save

     slm_menu_entry_5= Irm::MenuEntry.new(:menu_code=>'SLM_ADMIN_AGREEMENT_MENU',:sub_menu_code=>nil,:page_controller=>"slm/service_agreements",:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
     slm_menu_entry_5.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务协议',:description=>'服务协议')
     slm_menu_entry_5.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service Agreement',:description=>'Service Agreement')
     slm_menu_entry_5.save

  end

  def self.down
  end
end
