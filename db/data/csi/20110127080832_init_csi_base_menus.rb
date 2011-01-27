# -*- coding: utf-8 -*-
class InitCsiBaseMenus < ActiveRecord::Migration
  def self.up
    csi_irm_soc_survey_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_SURVEY_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    csi_irm_soc_survey_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC问卷调查',:description=>'SOC问卷调查')
    csi_irm_soc_survey_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC survey',:description=>'SOC survey')
    csi_irm_soc_survey_menu.save

    csi_menu_entiry_70= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_SURVEY_MENU',:permission_code=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_70.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'问卷调查',:description=>'问卷调查')
    csi_menu_entiry_70.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_70.save
    csi_menu_entiry_71= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SURVEY_MENU',:sub_menu_code=>nil,:permission_code=>'CSI_SURVEY_SUBJECTS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_71.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'问卷调查主题',:description=>'问卷调查主题')
    csi_menu_entiry_71.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery subject',:description=>'Survery subject')
    csi_menu_entiry_71.save
    csi_menu_entiry_72= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SURVEY_MENU',:sub_menu_code=>nil,:permission_code=>'CSI_SURVEYS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entiry_72.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'问卷调查',:description=>'问卷调查')
    csi_menu_entiry_72.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survery',:description=>'Survery')
    csi_menu_entiry_72.save
  end

  def self.down
  end
end
