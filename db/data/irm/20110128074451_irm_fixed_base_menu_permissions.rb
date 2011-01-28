class IrmFixedBaseMenuPermissions < ActiveRecord::Migration
  def self.up
    irm_irm_permission_people_menu= Irm::Menu.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_irm_permission_people_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员管理',:description=>'人员管理')
    irm_irm_permission_people_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'People menu',:description=>'People menu')
    irm_irm_permission_people_menu.save

    people_index_menu_entry = Irm::MenuEntry.where(:menu_code => 'IRM_PERMISSION_MENU',:permission_code => 'IRM_PEOPLE_INDEX').first
    people_index_menu_entry.destroy

    irm_menu_entiry_35= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_35.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_35.save

    irm_menu_entiry_36= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_PEOPLE_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员',:description=>'人员')
    irm_menu_entiry_36.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'People',:description=>'People')
    irm_menu_entiry_36.save

    irm_menu_entiry_37= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_PEOPLE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_COMPANY_ACCESSES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'人员访问公司限制',:description=>'人员访问公司限制')
    irm_menu_entiry_37.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Company access',:description=>'Company access')
    irm_menu_entiry_37.save

    common_menu_menu_entry = Irm::MenuEntry.where(:menu_code=>'IRM_COMMON_SETTING_MENU',:sub_menu_code=>'IRM_COMMON_MENUS_MENU').first
    common_menu_menu_entry.destroy

    irm_menu_entiry_10= Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',:sub_menu_code=>'IRM_COMMON_MENUS_MENU',:permission_code=>nil,:display_sequence=>35,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'菜单',:description=>'菜单')
    irm_menu_entiry_10.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Menu',:description=>'Menu')
    irm_menu_entiry_10.save

    irm_filters_index= Irm::Permission.new(:permission_code=>'IRM_FILTERS_INDEX',:page_controller=>'irm/filters',:page_action=>'index',:not_auto_mult=>true)
    irm_filters_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_filters_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_filters_index.save

    irm_menu_entiry_90= Irm::MenuEntry.new(:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_FILTERS_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'视图',:description=>'视图')
    irm_menu_entiry_90.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'View',:description=>'View')
    irm_menu_entiry_90.save
    
  end

  def self.down
  end
end
