class InitEbsBaseMenus < ActiveRecord::Migration
  def self.up
    ebs_irm_oracle_ebs_best_menu= Irm::Menu.new(:menu_code=>'IRM_ORACLE_EBS_BEST_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    ebs_irm_oracle_ebs_best_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'EBS最佳实践',:description=>'EBS最佳实践')
    ebs_irm_oracle_ebs_best_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Oracle EBS',:description=>'Oracle EBS')
    ebs_irm_oracle_ebs_best_menu.save

    ebs_menu_entiry_78= Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',:sub_menu_code=>'IRM_ORACLE_EBS_BEST_MENU',:permission_code=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    ebs_menu_entiry_78.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Oracle EBS最佳实践',:description=>'Oracle EBS最佳实践')
    ebs_menu_entiry_78.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Oracle EBS Best Practices',:description=>'Oracle EBS Best Practices')
    ebs_menu_entiry_78.save
    ebs_menu_entiry_79= Irm::MenuEntry.new(:menu_code=>'IRM_ORACLE_EBS_BEST_MENU',:sub_menu_code=>'IRM_EBP_HOME_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    ebs_menu_entiry_79.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    ebs_menu_entiry_79.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    ebs_menu_entiry_79.save
  end

  def self.down
  end
end
