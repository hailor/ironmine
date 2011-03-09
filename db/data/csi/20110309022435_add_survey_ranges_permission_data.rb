class AddSurveyRangesPermissionData < ActiveRecord::Migration
  def self.up
    csi_survey_ranges_create= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_CREATE',:page_controller=>'csi/survey_ranges',:page_action=>'create',:not_auto_mult=>true)
    csi_survey_ranges_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_ranges_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_ranges_create.save
    csi_survey_ranges_edit= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_EDIT',:page_controller=>'csi/survey_ranges',:page_action=>'edit',:not_auto_mult=>true)
    csi_survey_ranges_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_ranges_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_ranges_edit.save
    csi_survey_ranges_get_data= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_GET_DATA',:page_controller=>'csi/survey_ranges',:page_action=>'get_data',:not_auto_mult=>true)
    csi_survey_ranges_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    csi_survey_ranges_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    csi_survey_ranges_get_data.save
    csi_survey_ranges_index= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_INDEX',:page_controller=>'csi/survey_ranges',:page_action=>'index',:not_auto_mult=>true)
    csi_survey_ranges_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    csi_survey_ranges_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    csi_survey_ranges_index.save
    csi_survey_ranges_new= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_NEW',:page_controller=>'csi/survey_ranges',:page_action=>'new',:not_auto_mult=>true)
    csi_survey_ranges_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_ranges_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_ranges_new.save
    csi_survey_ranges_show= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_SHOW',:page_controller=>'csi/survey_ranges',:page_action=>'show',:not_auto_mult=>true)
    csi_survey_ranges_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    csi_survey_ranges_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    csi_survey_ranges_show.save
    csi_survey_ranges_update= Irm::Permission.new(:permission_code=>'CSI_SURVEY_RANGES_UPDATE',:page_controller=>'csi/survey_ranges',:page_action=>'update',:not_auto_mult=>true)
    csi_survey_ranges_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_ranges_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_ranges_update.save

    csi_menu_entry_72= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SURVEY_MENU',:sub_menu_code=>nil,:permission_code=>'CSI_SURVEY_RANGES_INDEX',:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    csi_menu_entry_72.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查范围',:description=>'调查范围')
    csi_menu_entry_72.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survey Range',:description=>'Survey Range')
    csi_menu_entry_72.save
  end

  def self.down
  end
end
