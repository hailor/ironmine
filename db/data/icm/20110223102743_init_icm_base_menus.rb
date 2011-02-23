class InitIcmBaseMenus < ActiveRecord::Migration
  def self.up
    icm_icm_admin_general_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_GENERAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_general_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理一般设置',:description=>'事故管理一般设置')
    icm_icm_admin_general_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident admin general',:description=>'Incident admin general')
    icm_icm_admin_general_menu.save
    icm_icm_admin_incident_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_incident_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故菜单')
    icm_icm_admin_incident_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_icm_admin_incident_menu.save
    icm_icm_admin_setting_menu= Irm::Menu.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    icm_icm_admin_setting_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理设置',:description=>'事故管理设置')
    icm_icm_admin_setting_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident admin setting',:description=>'Incident admin setting')
    icm_icm_admin_setting_menu.save
    icm_menu_entiry_39= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_SETTING_MENU',:permission_code=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_39.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理设置',:description=>'事故管理设置')
    icm_menu_entiry_39.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident admin setting',:description=>'Incident admin setting')
    icm_menu_entiry_39.save
    icm_menu_entiry_40= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_GENERAL_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_40.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'一般设置',:description=>'一般设置')
    icm_menu_entiry_40.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General setting',:description=>'General setting')
    icm_menu_entiry_40.save
    icm_menu_entiry_41= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_RULE_SETTINGS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_41.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'规则设置',:description=>'规则设置')
    icm_menu_entiry_41.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Rule setting',:description=>'Rule setting')
    icm_menu_entiry_41.save
    icm_menu_entiry_42= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_SETTING_MENU',:sub_menu_code=>'ICM_ADMIN_INCIDENT_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_42.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故')
    icm_menu_entiry_42.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_menu_entiry_42.save
    icm_menu_entiry_43= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_URGENCE_CODES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_43.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'紧急度',:description=>'紧急度')
    icm_menu_entiry_43.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Urgency',:description=>'Urgency')
    icm_menu_entiry_43.save
    icm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_IMPACT_RANGES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'影响度',:description=>'影响度')
    icm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Impact range',:description=>'Impact range')
    icm_menu_entiry_44.save
    icm_menu_entiry_45= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_PRIORITY_CODES_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_45.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'优先级',:description=>'优先级')
    icm_menu_entiry_45.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Priority',:description=>'Priority')
    icm_menu_entiry_45.save
    icm_menu_entiry_46= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_INCIDENT_PHASES_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_46.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单阶段',:description=>'事故单位阶段')
    icm_menu_entiry_46.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident phase',:description=>'Incident phase')
    icm_menu_entiry_46.save
    icm_menu_entiry_47= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_INCIDENT_STATUSES_INDEX',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_47.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单状态',:description=>'事故单位状态')
    icm_menu_entiry_47.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident status',:description=>'Incident status')
    icm_menu_entiry_47.save
    icm_menu_entiry_48= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_CLOSE_REASONS_INDEX',:display_sequence=>60,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_48.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭原因',:description=>'关闭原因')
    icm_menu_entiry_48.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close reason',:description=>'Close reason')
    icm_menu_entiry_48.save
    icm_menu_entiry_66= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_INCIDENT_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_66.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故',:description=>'事故')
    icm_menu_entiry_66.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident',:description=>'Incident')
    icm_menu_entiry_66.save
    icm_menu_entiry_67= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_INCIDENT_REQUESTS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_67.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_menu_entiry_67.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    icm_menu_entiry_67.save
    icm_menu_entiry_68= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_INCIDENT_JOURNALS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_68.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单回复',:description=>'事故单回复')
    icm_menu_entiry_68.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request journal',:description=>'Incident request journal')
    icm_menu_entiry_68.save
  end

  def self.down
  end
end
