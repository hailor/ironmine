# -*- coding: utf-8 -*-
class InitBoMenu < ActiveRecord::Migration
  def self.up
    irm_irm_dev_business_object_menu= Irm::Menu.new(:menu_code=>'IRM_DEV_BUSINESS_OBJECT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_dev_business_object_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_irm_dev_business_object_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_irm_dev_business_object_menu.save
    irm_irm_bo_menu= Irm::Menu.new(:menu_code=>'IRM_BO_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_bo_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像管理',:description=>'业务对像管理')
    irm_irm_bo_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object Management',:description=>'Business Object Management')
    irm_irm_bo_menu.save
    irm_menu_entiry_114= Irm::MenuEntry.new(:menu_code=>'IRM_DEVELOPER_MENU',:sub_menu_code=>'IRM_DEV_BUSINESS_OBJECT_MENU',:page_controller=>nil,:display_sequence=>25,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_114.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_menu_entiry_114.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_menu_entiry_114.save
    irm_menu_entiry_115= Irm::MenuEntry.new(:menu_code=>'IRM_DEV_BUSINESS_OBJECT_MENU',:sub_menu_code=>'IRM_BO_MENU',:page_controller=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_115.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像管理',:description=>'业务对像管理')
    irm_menu_entiry_115.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object Management',:description=>'Business Object Management')
    irm_menu_entiry_115.save
    irm_menu_entiry_116= Irm::MenuEntry.new(:menu_code=>'IRM_BO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/business_objects',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_116.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像',:description=>'业务对像')
    irm_menu_entiry_116.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object',:description=>'Business Object')
    irm_menu_entiry_116.save
    irm_menu_entiry_117= Irm::MenuEntry.new(:menu_code=>'IRM_BO_MENU',:sub_menu_code=>nil,:page_controller=>'irm/object_attributes',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_117.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'业务对像属性',:description=>'业务对像属性')
    irm_menu_entiry_117.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Business Object Attribute',:description=>'Business Object Attribute')
    irm_menu_entiry_117.save
  end

  def self.down
  end
end
