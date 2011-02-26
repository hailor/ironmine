class InitIrmReportMenu < ActiveRecord::Migration
  def self.up
    irm_soc_report_list_menu= Irm::Menu.new(:menu_code=>'IRM_REPORT_LISTS_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_soc_report_list_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    irm_soc_report_list_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    irm_soc_report_list_menu.save
    report_menu_list_86= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_REPORT_LISTS_MENU',:permission_code=>nil,
                                            :display_sequence=>70,:display_flag=>'Y',:not_auto_mult=>true)
    report_menu_list_86.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    report_menu_list_86.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    report_menu_list_86.save
    
    report_menu_list_87= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_LISTS_MENU',:sub_menu_code=>nil,
                                            :permission_code=>'IRM_REPORT_LISTS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    report_menu_list_87.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'报表',:description=>'报表')
    report_menu_list_87.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Report',:description=>'Report')
    report_menu_list_87.save
  end

  def self.down
  end
end
