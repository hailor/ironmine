class AddInitPermissions < ActiveRecord::Migration
  def self.up
    Irm::Permission.find(:all).each do |f|
      f.destroy
    end

    cms_home_index= Irm::Permission.new(:permission_code=>'CMS_HOME_INDEX',:page_controller=>'cms/home',:page_action=>'index',:not_auto_mult=>true)
    cms_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    cms_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    cms_home_index.save
    csi_surveys_create= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_CREATE',:page_controller=>'csi/surveys',:page_action=>'create',:not_auto_mult=>true)
    csi_surveys_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_surveys_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_surveys_create.save
    csi_surveys_create_result= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_CREATE_RESULT',:page_controller=>'csi/surveys',:page_action=>'create_result',:not_auto_mult=>true)
    csi_surveys_create_result.permissions_tls.build(:language=>'zh',:name=>'创建问卷结果',:description=>'创建问卷结果',:source_lang=>'en')
    csi_surveys_create_result.permissions_tls.build(:language=>'en',:name=>'Create Result',:description=>'Create Result',:source_lang=>'en')
    csi_surveys_create_result.save
    csi_surveys_edit= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_EDIT',:page_controller=>'csi/surveys',:page_action=>'edit',:not_auto_mult=>true)
    csi_surveys_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_surveys_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_surveys_edit.save
    csi_surveys_get_data= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_GET_DATA',:page_controller=>'csi/surveys',:page_action=>'get_data',:not_auto_mult=>true)
    csi_surveys_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    csi_surveys_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    csi_surveys_get_data.save
    csi_surveys_index= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_INDEX',:page_controller=>'csi/surveys',:page_action=>'index',:not_auto_mult=>true)
    csi_surveys_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    csi_surveys_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    csi_surveys_index.save
    csi_surveys_new= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_NEW',:page_controller=>'csi/surveys',:page_action=>'new',:not_auto_mult=>true)
    csi_surveys_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_surveys_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_surveys_new.save
    csi_surveys_password= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_PASSWORD',:page_controller=>'csi/surveys',:page_action=>'password',:not_auto_mult=>true)
    csi_surveys_password.permissions_tls.build(:language=>'zh',:name=>'输入密码',:description=>'输入密码',:source_lang=>'en')
    csi_surveys_password.permissions_tls.build(:language=>'en',:name=>'Password',:description=>'Password',:source_lang=>'en')
    csi_surveys_password.save
    csi_surveys_reply= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_REPLY',:page_controller=>'csi/surveys',:page_action=>'reply',:not_auto_mult=>true)
    csi_surveys_reply.permissions_tls.build(:language=>'zh',:name=>'答题',:description=>'答题',:source_lang=>'en')
    csi_surveys_reply.permissions_tls.build(:language=>'en',:name=>'Reply',:description=>'Reply',:source_lang=>'en')
    csi_surveys_reply.save
    csi_surveys_show= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_SHOW',:page_controller=>'csi/surveys',:page_action=>'show',:not_auto_mult=>true)
    csi_surveys_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    csi_surveys_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    csi_surveys_show.save
    csi_surveys_show_result= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_SHOW_RESULT',:page_controller=>'csi/surveys',:page_action=>'show_result',:not_auto_mult=>true)
    csi_surveys_show_result.permissions_tls.build(:language=>'zh',:name=>'显示结果',:description=>'显示结果',:source_lang=>'en')
    csi_surveys_show_result.permissions_tls.build(:language=>'en',:name=>'Show Result',:description=>'Show Result',:source_lang=>'en')
    csi_surveys_show_result.save
    csi_surveys_thanks= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_THANKS',:page_controller=>'csi/surveys',:page_action=>'thanks',:not_auto_mult=>true)
    csi_surveys_thanks.permissions_tls.build(:language=>'zh',:name=>'感谢',:description=>'感谢',:source_lang=>'en')
    csi_surveys_thanks.permissions_tls.build(:language=>'en',:name=>'Thanks',:description=>'Thanks',:source_lang=>'en')
    csi_surveys_thanks.save
    csi_surveys_update= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_UPDATE',:page_controller=>'csi/surveys',:page_action=>'update',:not_auto_mult=>true)
    csi_surveys_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_surveys_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_surveys_update.save
    csi_survey_subjects_create= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_CREATE',:page_controller=>'csi/survey_subjects',:page_action=>'create',:not_auto_mult=>true)
    csi_survey_subjects_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_subjects_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_subjects_create.save
    csi_survey_subjects_destroy= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_DESTROY',:page_controller=>'csi/survey_subjects',:page_action=>'destroy',:not_auto_mult=>true)
    csi_survey_subjects_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    csi_survey_subjects_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    csi_survey_subjects_destroy.save
    csi_survey_subjects_edit= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_EDIT',:page_controller=>'csi/survey_subjects',:page_action=>'edit',:not_auto_mult=>true)
    csi_survey_subjects_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_subjects_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_subjects_edit.save
    csi_survey_subjects_get_data= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_GET_DATA',:page_controller=>'csi/survey_subjects',:page_action=>'get_data',:not_auto_mult=>true)
    csi_survey_subjects_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    csi_survey_subjects_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    csi_survey_subjects_get_data.save
    csi_survey_subjects_index= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_INDEX',:page_controller=>'csi/survey_subjects',:page_action=>'index',:not_auto_mult=>true)
    csi_survey_subjects_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    csi_survey_subjects_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    csi_survey_subjects_index.save
    csi_survey_subjects_new= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_NEW',:page_controller=>'csi/survey_subjects',:page_action=>'new',:not_auto_mult=>true)
    csi_survey_subjects_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_subjects_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_subjects_new.save
    csi_survey_subjects_show= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_SHOW',:page_controller=>'csi/survey_subjects',:page_action=>'show',:not_auto_mult=>true)
    csi_survey_subjects_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    csi_survey_subjects_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    csi_survey_subjects_show.save
    csi_survey_subjects_update= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_UPDATE',:page_controller=>'csi/survey_subjects',:page_action=>'update',:not_auto_mult=>true)
    csi_survey_subjects_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_subjects_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_subjects_update.save
    ebs_home_index= Irm::Permission.new(:permission_code=>'EBS_HOME_INDEX',:page_controller=>'ebs/home',:page_action=>'index',:not_auto_mult=>true)
    ebs_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    ebs_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    ebs_home_index.save
    icm_close_reasons_create= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_CREATE',:page_controller=>'icm/close_reasons',:page_action=>'create',:not_auto_mult=>true)
    icm_close_reasons_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_close_reasons_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_close_reasons_create.save
    icm_close_reasons_edit= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_EDIT',:page_controller=>'icm/close_reasons',:page_action=>'edit',:not_auto_mult=>true)
    icm_close_reasons_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_close_reasons_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_close_reasons_edit.save
    icm_close_reasons_get_data= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_GET_DATA',:page_controller=>'icm/close_reasons',:page_action=>'get_data',:not_auto_mult=>true)
    icm_close_reasons_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_close_reasons_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_close_reasons_get_data.save
    icm_close_reasons_index= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_INDEX',:page_controller=>'icm/close_reasons',:page_action=>'index',:not_auto_mult=>true)
    icm_close_reasons_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_close_reasons_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_close_reasons_index.save
    icm_close_reasons_new= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_NEW',:page_controller=>'icm/close_reasons',:page_action=>'new',:not_auto_mult=>true)
    icm_close_reasons_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_close_reasons_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_close_reasons_new.save
    icm_close_reasons_show= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_SHOW',:page_controller=>'icm/close_reasons',:page_action=>'show',:not_auto_mult=>true)
    icm_close_reasons_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_close_reasons_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_close_reasons_show.save
    icm_close_reasons_update= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_UPDATE',:page_controller=>'icm/close_reasons',:page_action=>'update',:not_auto_mult=>true)
    icm_close_reasons_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_close_reasons_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_close_reasons_update.save
    icm_close_reasons_mu_ed= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_MU_ED',:page_controller=>'icm/close_reasons',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_close_reasons_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_close_reasons_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_close_reasons_mu_ed.save
    icm_close_reasons_mu_ud= Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_MU_UD',:page_controller=>'icm/close_reasons',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_close_reasons_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_close_reasons_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_close_reasons_mu_ud.save
    icm_impact_ranges_create= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_CREATE',:page_controller=>'icm/impact_ranges',:page_action=>'create',:not_auto_mult=>true)
    icm_impact_ranges_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_impact_ranges_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_impact_ranges_create.save
    icm_impact_ranges_edit= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_EDIT',:page_controller=>'icm/impact_ranges',:page_action=>'edit',:not_auto_mult=>true)
    icm_impact_ranges_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_impact_ranges_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_impact_ranges_edit.save
    icm_impact_ranges_get_data= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_GET_DATA',:page_controller=>'icm/impact_ranges',:page_action=>'get_data',:not_auto_mult=>true)
    icm_impact_ranges_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_impact_ranges_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_impact_ranges_get_data.save
    icm_impact_ranges_index= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_INDEX',:page_controller=>'icm/impact_ranges',:page_action=>'index',:not_auto_mult=>true)
    icm_impact_ranges_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_impact_ranges_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_impact_ranges_index.save
    icm_impact_ranges_new= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_NEW',:page_controller=>'icm/impact_ranges',:page_action=>'new',:not_auto_mult=>true)
    icm_impact_ranges_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_impact_ranges_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_impact_ranges_new.save
    icm_impact_ranges_show= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_SHOW',:page_controller=>'icm/impact_ranges',:page_action=>'show',:not_auto_mult=>true)
    icm_impact_ranges_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_impact_ranges_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_impact_ranges_show.save
    icm_impact_ranges_update= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_UPDATE',:page_controller=>'icm/impact_ranges',:page_action=>'update',:not_auto_mult=>true)
    icm_impact_ranges_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_impact_ranges_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_impact_ranges_update.save
    icm_impact_ranges_mu_ed= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_MU_ED',:page_controller=>'icm/impact_ranges',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_impact_ranges_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_impact_ranges_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_impact_ranges_mu_ed.save
    icm_impact_ranges_mu_ud= Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_MU_UD',:page_controller=>'icm/impact_ranges',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_impact_ranges_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_impact_ranges_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_impact_ranges_mu_ud.save
    icm_incident_journals_create= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_CREATE',:page_controller=>'icm/incident_journals',:page_action=>'create',:not_auto_mult=>true)
    icm_incident_journals_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_journals_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_journals_create.save
    icm_incident_journals_ed_close= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_ED_CLOSE',:page_controller=>'icm/incident_journals',:page_action=>'edit_close',:not_auto_mult=>true)
    icm_incident_journals_ed_close.permissions_tls.build(:language=>'zh',:name=>'关闭',:description=>'关闭',:source_lang=>'en')
    icm_incident_journals_ed_close.permissions_tls.build(:language=>'en',:name=>'Close',:description=>'Close',:source_lang=>'en')
    icm_incident_journals_ed_close.save
    icm_incident_journals_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_INDEX',:page_controller=>'icm/incident_journals',:page_action=>'index',:not_auto_mult=>true)
    icm_incident_journals_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_incident_journals_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_incident_journals_index.save
    icm_incident_journals_new= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_NEW',:page_controller=>'icm/incident_journals',:page_action=>'new',:not_auto_mult=>true)
    icm_incident_journals_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_journals_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_journals_new.save
    icm_incident_journals_ud_close= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_UD_CLOSE',:page_controller=>'icm/incident_journals',:page_action=>'update_close',:not_auto_mult=>true)
    icm_incident_journals_ud_close.permissions_tls.build(:language=>'zh',:name=>'关闭',:description=>'关闭',:source_lang=>'en')
    icm_incident_journals_ud_close.permissions_tls.build(:language=>'en',:name=>'Close',:description=>'Close',:source_lang=>'en')
    icm_incident_journals_ud_close.save
    icm_incident_phases_create= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_CREATE',:page_controller=>'icm/incident_phases',:page_action=>'create',:not_auto_mult=>true)
    icm_incident_phases_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_phases_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_phases_create.save
    icm_incident_phases_edit= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_EDIT',:page_controller=>'icm/incident_phases',:page_action=>'edit',:not_auto_mult=>true)
    icm_incident_phases_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_phases_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_phases_edit.save
    icm_incident_phases_get_data= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_GET_DATA',:page_controller=>'icm/incident_phases',:page_action=>'get_data',:not_auto_mult=>true)
    icm_incident_phases_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_incident_phases_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_incident_phases_get_data.save
    icm_incident_phases_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_INDEX',:page_controller=>'icm/incident_phases',:page_action=>'index',:not_auto_mult=>true)
    icm_incident_phases_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_incident_phases_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_incident_phases_index.save
    icm_incident_phases_new= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_NEW',:page_controller=>'icm/incident_phases',:page_action=>'new',:not_auto_mult=>true)
    icm_incident_phases_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_phases_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_phases_new.save
    icm_incident_phases_show= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_SHOW',:page_controller=>'icm/incident_phases',:page_action=>'show',:not_auto_mult=>true)
    icm_incident_phases_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_incident_phases_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_incident_phases_show.save
    icm_incident_phases_update= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_UPDATE',:page_controller=>'icm/incident_phases',:page_action=>'update',:not_auto_mult=>true)
    icm_incident_phases_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_phases_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_phases_update.save
    icm_incident_phases_mu_ed= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_MU_ED',:page_controller=>'icm/incident_phases',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_incident_phases_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_incident_phases_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_incident_phases_mu_ed.save
    icm_incident_phases_mu_ud= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_MU_UD',:page_controller=>'icm/incident_phases',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_incident_phases_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_incident_phases_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_incident_phases_mu_ud.save
    icm_incident_requests_create= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_CREATE',:page_controller=>'icm/incident_requests',:page_action=>'create',:not_auto_mult=>true)
    icm_incident_requests_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_requests_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_requests_create.save
    icm_incident_requests_edit= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_EDIT',:page_controller=>'icm/incident_requests',:page_action=>'edit',:not_auto_mult=>true)
    icm_incident_requests_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_requests_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_requests_edit.save
    icm_incident_requests_get_data= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_GET_DATA',:page_controller=>'icm/incident_requests',:page_action=>'get_data',:not_auto_mult=>true)
    icm_incident_requests_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_incident_requests_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_incident_requests_get_data.save
    icm_incident_requests_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_INDEX',:page_controller=>'icm/incident_requests',:page_action=>'index',:not_auto_mult=>true)
    icm_incident_requests_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_incident_requests_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_incident_requests_index.save
    icm_incident_requests_new= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_NEW',:page_controller=>'icm/incident_requests',:page_action=>'new',:not_auto_mult=>true)
    icm_incident_requests_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_requests_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_requests_new.save
    icm_incident_requests_show= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_SHOW',:page_controller=>'icm/incident_requests',:page_action=>'show',:not_auto_mult=>true)
    icm_incident_requests_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_incident_requests_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_incident_requests_show.save
    icm_incident_requests_update= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_UPDATE',:page_controller=>'icm/incident_requests',:page_action=>'update',:not_auto_mult=>true)
    icm_incident_requests_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_requests_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_requests_update.save
    icm_incident_statuses_create= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_CREATE',:page_controller=>'icm/incident_statuses',:page_action=>'create',:not_auto_mult=>true)
    icm_incident_statuses_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_statuses_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_statuses_create.save
    icm_incident_statuses_edit= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_EDIT',:page_controller=>'icm/incident_statuses',:page_action=>'edit',:not_auto_mult=>true)
    icm_incident_statuses_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_statuses_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_statuses_edit.save
    icm_incident_statuses_get_data= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_GET_DATA',:page_controller=>'icm/incident_statuses',:page_action=>'get_data',:not_auto_mult=>true)
    icm_incident_statuses_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_incident_statuses_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_incident_statuses_get_data.save
    icm_incident_statuses_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_INDEX',:page_controller=>'icm/incident_statuses',:page_action=>'index',:not_auto_mult=>true)
    icm_incident_statuses_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_incident_statuses_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_incident_statuses_index.save
    icm_incident_statuses_mu_ed= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_MU_ED',:page_controller=>'icm/incident_statuses',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_incident_statuses_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_incident_statuses_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_incident_statuses_mu_ed.save
    icm_incident_statuses_mu_up= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_MU_UP',:page_controller=>'icm/incident_statuses',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_incident_statuses_mu_up.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_incident_statuses_mu_up.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_incident_statuses_mu_up.save
    icm_incident_statuses_new= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_NEW',:page_controller=>'icm/incident_statuses',:page_action=>'new',:not_auto_mult=>true)
    icm_incident_statuses_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_incident_statuses_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_incident_statuses_new.save
    icm_incident_statuses_show= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_SHOW',:page_controller=>'icm/incident_statuses',:page_action=>'show',:not_auto_mult=>true)
    icm_incident_statuses_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_incident_statuses_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_incident_statuses_show.save
    icm_incident_statuses_update= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_UPDATE',:page_controller=>'icm/incident_statuses',:page_action=>'update',:not_auto_mult=>true)
    icm_incident_statuses_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_incident_statuses_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_incident_statuses_update.save
    icm_priority_codes_create= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_CREATE',:page_controller=>'icm/priority_codes',:page_action=>'create',:not_auto_mult=>true)
    icm_priority_codes_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_priority_codes_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_priority_codes_create.save
    icm_priority_codes_edit= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_EDIT',:page_controller=>'icm/priority_codes',:page_action=>'edit',:not_auto_mult=>true)
    icm_priority_codes_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_priority_codes_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_priority_codes_edit.save
    icm_priority_codes_get_data= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_GET_DATA',:page_controller=>'icm/priority_codes',:page_action=>'get_data',:not_auto_mult=>true)
    icm_priority_codes_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_priority_codes_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_priority_codes_get_data.save
    icm_priority_codes_index= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_INDEX',:page_controller=>'icm/priority_codes',:page_action=>'index',:not_auto_mult=>true)
    icm_priority_codes_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_priority_codes_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_priority_codes_index.save
    icm_priority_codes_mu_ed= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_MU_ED',:page_controller=>'icm/priority_codes',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_priority_codes_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_priority_codes_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_priority_codes_mu_ed.save
    icm_priority_codes_mu_ud= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_MU_UD',:page_controller=>'icm/priority_codes',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_priority_codes_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_priority_codes_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_priority_codes_mu_ud.save
    icm_priority_codes_new= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_NEW',:page_controller=>'icm/priority_codes',:page_action=>'new',:not_auto_mult=>true)
    icm_priority_codes_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_priority_codes_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_priority_codes_new.save
    icm_priority_codes_show= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_SHOW',:page_controller=>'icm/priority_codes',:page_action=>'show',:not_auto_mult=>true)
    icm_priority_codes_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_priority_codes_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_priority_codes_show.save
    icm_priority_codes_update= Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_UPDATE',:page_controller=>'icm/priority_codes',:page_action=>'update',:not_auto_mult=>true)
    icm_priority_codes_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_priority_codes_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_priority_codes_update.save
    icm_rule_settings_create= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_CREATE',:page_controller=>'icm/rule_settings',:page_action=>'create',:not_auto_mult=>true)
    icm_rule_settings_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_rule_settings_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_rule_settings_create.save
    icm_rule_settings_edit= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_EDIT',:page_controller=>'icm/rule_settings',:page_action=>'edit',:not_auto_mult=>true)
    icm_rule_settings_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_rule_settings_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_rule_settings_edit.save
    icm_rule_settings_get_data= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_GET_DATA',:page_controller=>'icm/rule_settings',:page_action=>'get_data',:not_auto_mult=>true)
    icm_rule_settings_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_rule_settings_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_rule_settings_get_data.save
    icm_rule_settings_index= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_INDEX',:page_controller=>'icm/rule_settings',:page_action=>'index',:not_auto_mult=>true)
    icm_rule_settings_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_rule_settings_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_rule_settings_index.save
    icm_rule_settings_new= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_NEW',:page_controller=>'icm/rule_settings',:page_action=>'new',:not_auto_mult=>true)
    icm_rule_settings_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_rule_settings_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_rule_settings_new.save
    icm_rule_settings_show= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_SHOW',:page_controller=>'icm/rule_settings',:page_action=>'show',:not_auto_mult=>true)
    icm_rule_settings_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_rule_settings_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_rule_settings_show.save
    icm_rule_settings_update= Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_UPDATE',:page_controller=>'icm/rule_settings',:page_action=>'update',:not_auto_mult=>true)
    icm_rule_settings_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_rule_settings_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_rule_settings_update.save
    icm_urgence_codes_create= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_CREATE',:page_controller=>'icm/urgence_codes',:page_action=>'create',:not_auto_mult=>true)
    icm_urgence_codes_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_urgence_codes_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_urgence_codes_create.save
    icm_urgence_codes_edit= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_EDIT',:page_controller=>'icm/urgence_codes',:page_action=>'edit',:not_auto_mult=>true)
    icm_urgence_codes_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_urgence_codes_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_urgence_codes_edit.save
    icm_urgence_codes_get_data= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_GET_DATA',:page_controller=>'icm/urgence_codes',:page_action=>'get_data',:not_auto_mult=>true)
    icm_urgence_codes_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_urgence_codes_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_urgence_codes_get_data.save
    icm_urgence_codes_index= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_INDEX',:page_controller=>'icm/urgence_codes',:page_action=>'index',:not_auto_mult=>true)
    icm_urgence_codes_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_urgence_codes_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_urgence_codes_index.save
    icm_urgence_codes_mu_ed= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_MU_ED',:page_controller=>'icm/urgence_codes',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    icm_urgence_codes_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_urgence_codes_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_urgence_codes_mu_ed.save
    icm_urgence_codes_mu_ud= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_MU_UD',:page_controller=>'icm/urgence_codes',:page_action=>'multilingual_update',:not_auto_mult=>true)
    icm_urgence_codes_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    icm_urgence_codes_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    icm_urgence_codes_mu_ud.save
    icm_urgence_codes_new= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_NEW',:page_controller=>'icm/urgence_codes',:page_action=>'new',:not_auto_mult=>true)
    icm_urgence_codes_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_urgence_codes_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_urgence_codes_new.save
    icm_urgence_codes_show= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_SHOW',:page_controller=>'icm/urgence_codes',:page_action=>'show',:not_auto_mult=>true)
    icm_urgence_codes_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_urgence_codes_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_urgence_codes_show.save
    icm_urgence_codes_update= Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_UPDATE',:page_controller=>'icm/urgence_codes',:page_action=>'update',:not_auto_mult=>true)
    icm_urgence_codes_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_urgence_codes_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_urgence_codes_update.save
    irm_actions_create= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_CREATE',:page_controller=>'irm/actions',:page_action=>'create',:not_auto_mult=>true)
    irm_actions_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_actions_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_actions_create.save
    irm_actions_edit= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_EDIT',:page_controller=>'irm/actions',:page_action=>'edit',:not_auto_mult=>true)
    irm_actions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_actions_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_actions_edit.save
    irm_actions_get_data= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_GET_DATA',:page_controller=>'irm/actions',:page_action=>'get_data',:not_auto_mult=>true)
    irm_actions_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_actions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_actions_get_data.save
    irm_actions_index= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_INDEX',:page_controller=>'irm/actions',:page_action=>'index',:not_auto_mult=>true)
    irm_actions_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_actions_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_actions_index.save
    irm_actions_mu_ed= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_MU_ED',:page_controller=>'irm/actions',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_actions_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_actions_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_actions_mu_ed.save
    irm_actions_mu_ud= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_MU_UD',:page_controller=>'irm/actions',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_actions_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_actions_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_actions_mu_ud.save
    irm_actions_new= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_NEW',:page_controller=>'irm/actions',:page_action=>'new',:not_auto_mult=>true)
    irm_actions_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_actions_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_actions_new.save
    irm_actions_show= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_SHOW',:page_controller=>'irm/actions',:page_action=>'show',:not_auto_mult=>true)
    irm_actions_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_actions_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_actions_show.save
    irm_actions_update= Irm::Permission.new(:permission_code=>'IRM_ACTIONS_UPDATE',:page_controller=>'irm/actions',:page_action=>'update',:not_auto_mult=>true)
    irm_actions_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_actions_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_actions_update.save
    irm_auth_sources_create= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_CREATE',:page_controller=>'irm/auth_sources',:page_action=>'create',:not_auto_mult=>true)
    irm_auth_sources_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_auth_sources_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_auth_sources_create.save
    irm_auth_sources_edit= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_EDIT',:page_controller=>'irm/auth_sources',:page_action=>'edit',:not_auto_mult=>true)
    irm_auth_sources_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_auth_sources_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_auth_sources_edit.save
    irm_auth_sources_get_data= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_GET_DATA',:page_controller=>'irm/auth_sources',:page_action=>'get_data',:not_auto_mult=>true)
    irm_auth_sources_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_auth_sources_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_auth_sources_get_data.save
    irm_auth_sources_index= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_INDEX',:page_controller=>'irm/auth_sources',:page_action=>'index',:not_auto_mult=>true)
    irm_auth_sources_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_auth_sources_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_auth_sources_index.save
    irm_auth_sources_mu_ed= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_MU_ED',:page_controller=>'irm/auth_sources',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_auth_sources_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_auth_sources_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_auth_sources_mu_ed.save
    irm_auth_sources_mu_ud= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_MU_UD',:page_controller=>'irm/auth_sources',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_auth_sources_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_auth_sources_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_auth_sources_mu_ud.save
    irm_auth_sources_new= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_NEW',:page_controller=>'irm/auth_sources',:page_action=>'new',:not_auto_mult=>true)
    irm_auth_sources_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_auth_sources_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_auth_sources_new.save
    irm_auth_sources_show= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_SHOW',:page_controller=>'irm/auth_sources',:page_action=>'show',:not_auto_mult=>true)
    irm_auth_sources_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_auth_sources_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_auth_sources_show.save
    irm_auth_sources_update= Irm::Permission.new(:permission_code=>'IRM_AUTH_SOURCES_UPDATE',:page_controller=>'irm/auth_sources',:page_action=>'update',:not_auto_mult=>true)
    irm_auth_sources_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_auth_sources_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_auth_sources_update.save
    irm_common_forgot_password= Irm::Permission.new(:permission_code=>'IRM_COMMON_FORGOT_PASSWORD',:page_controller=>'irm/common',:page_action=>'forgot_password',:not_auto_mult=>true)
    irm_common_forgot_password.permissions_tls.build(:language=>'zh',:name=>'忘记密码',:description=>'忘记密码',:source_lang=>'en')
    irm_common_forgot_password.permissions_tls.build(:language=>'en',:name=>'Forgot Password',:description=>'Forgot Password',:source_lang=>'en')
    irm_common_forgot_password.save
    irm_common_login= Irm::Permission.new(:permission_code=>'IRM_COMMON_LOGIN',:page_controller=>'irm/common',:page_action=>'login',:not_auto_mult=>true)
    irm_common_login.permissions_tls.build(:language=>'zh',:name=>'登陆',:description=>'登陆',:source_lang=>'en')
    irm_common_login.permissions_tls.build(:language=>'en',:name=>'Login',:description=>'Login',:source_lang=>'en')
    irm_common_login.save
    irm_common_logout= Irm::Permission.new(:permission_code=>'IRM_COMMON_LOGOUT',:page_controller=>'irm/common',:page_action=>'logout',:not_auto_mult=>true)
    irm_common_logout.permissions_tls.build(:language=>'zh',:name=>'退出',:description=>'退出',:source_lang=>'en')
    irm_common_logout.permissions_tls.build(:language=>'en',:name=>'Logout',:description=>'Logout',:source_lang=>'en')
    irm_common_logout.save
    irm_companies_add_site_info= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_ADD_SITE_INFO',:page_controller=>'irm/companies',:page_action=>'add_site_info',:not_auto_mult=>true)
    irm_companies_add_site_info.permissions_tls.build(:language=>'zh',:name=>'添加地点',:description=>'添加地点',:source_lang=>'en')
    irm_companies_add_site_info.permissions_tls.build(:language=>'en',:name=>'Add Site Info',:description=>'Add Site Info',:source_lang=>'en')
    irm_companies_add_site_info.save
    irm_companies_create= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_CREATE',:page_controller=>'irm/companies',:page_action=>'create',:not_auto_mult=>true)
    irm_companies_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_companies_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_companies_create.save
    irm_companies_create_location= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_CREATE_LOCATION',:page_controller=>'irm/companies',:page_action=>'create_location',:not_auto_mult=>true)
    irm_companies_create_location.permissions_tls.build(:language=>'zh',:name=>'创建地点',:description=>'创建地点',:source_lang=>'en')
    irm_companies_create_location.permissions_tls.build(:language=>'en',:name=>'Create Location',:description=>'Create Location',:source_lang=>'en')
    irm_companies_create_location.save
    irm_companies_edit= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_EDIT',:page_controller=>'irm/companies',:page_action=>'edit',:not_auto_mult=>true)
    irm_companies_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_companies_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_companies_edit.save
    irm_companies_edit_location= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_EDIT_LOCATION',:page_controller=>'irm/companies',:page_action=>'edit_location',:not_auto_mult=>true)
    irm_companies_edit_location.permissions_tls.build(:language=>'zh',:name=>'编辑地点',:description=>'编辑地点',:source_lang=>'en')
    irm_companies_edit_location.permissions_tls.build(:language=>'en',:name=>'Edit Location',:description=>'Edit Location',:source_lang=>'en')
    irm_companies_edit_location.save
    irm_companies_get_che_comp= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_CHE_COMP',:page_controller=>'irm/companies',:page_action=>'get_choose_company',:not_auto_mult=>true)
    irm_companies_get_che_comp.permissions_tls.build(:language=>'zh',:name=>'所有人员',:description=>'所有人员',:source_lang=>'en')
    irm_companies_get_che_comp.permissions_tls.build(:language=>'en',:name=>'Check Company',:description=>'Check Company',:source_lang=>'en')
    irm_companies_get_che_comp.save
    irm_companies_get_company_info= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_COMPANY_INFO',:page_controller=>'irm/companies',:page_action=>'get_company_info',:not_auto_mult=>true)
    irm_companies_get_company_info.permissions_tls.build(:language=>'zh',:name=>'取得公司信息',:description=>'取得公司信息',:source_lang=>'en')
    irm_companies_get_company_info.permissions_tls.build(:language=>'en',:name=>'Get Company Info',:description=>'Get Company Info',:source_lang=>'en')
    irm_companies_get_company_info.save
    irm_companies_get_company_site= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_COMPANY_SITE',:page_controller=>'irm/companies',:page_action=>'get_company_site',:not_auto_mult=>true)
    irm_companies_get_company_site.permissions_tls.build(:language=>'zh',:name=>'取得公司地点',:description=>'取得公司地点',:source_lang=>'en')
    irm_companies_get_company_site.permissions_tls.build(:language=>'en',:name=>'Get Company Site',:description=>'Get Company Site',:source_lang=>'en')
    irm_companies_get_company_site.save
    irm_companies_get_data= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_DATA',:page_controller=>'irm/companies',:page_action=>'get_data',:not_auto_mult=>true)
    irm_companies_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_companies_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_companies_get_data.save
    irm_companies_get_supp_group= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_SUPP_GROUP',:page_controller=>'irm/companies',:page_action=>'get_support_group',:not_auto_mult=>true)
    irm_companies_get_supp_group.permissions_tls.build(:language=>'zh',:name=>'取得支持组',:description=>'取得支持组',:source_lang=>'en')
    irm_companies_get_supp_group.permissions_tls.build(:language=>'en',:name=>'Get Support Group',:description=>'Get Support Group',:source_lang=>'en')
    irm_companies_get_supp_group.save
    irm_companies_index= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_INDEX',:page_controller=>'irm/companies',:page_action=>'index',:not_auto_mult=>true)
    irm_companies_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_companies_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_companies_index.save
    irm_companies_mu_ed= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_MU_ED',:page_controller=>'irm/companies',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_companies_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_companies_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_companies_mu_ed.save
    irm_companies_mu_ud= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_MU_UD',:page_controller=>'irm/companies',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_companies_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_companies_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_companies_mu_ud.save
    irm_companies_new= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_NEW',:page_controller=>'irm/companies',:page_action=>'new',:not_auto_mult=>true)
    irm_companies_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_companies_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_companies_new.save
    irm_companies_show= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_SHOW',:page_controller=>'irm/companies',:page_action=>'show',:not_auto_mult=>true)
    irm_companies_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_companies_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_companies_show.save
    irm_companies_site_info= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_SITE_INFO',:page_controller=>'irm/companies',:page_action=>'site_info',:not_auto_mult=>true)
    irm_companies_site_info.permissions_tls.build(:language=>'zh',:name=>'地点信息',:description=>'地点信息',:source_lang=>'en')
    irm_companies_site_info.permissions_tls.build(:language=>'en',:name=>'Site Info',:description=>'Site Info',:source_lang=>'en')
    irm_companies_site_info.save
    irm_companies_support_group= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_SUPPORT_GROUP',:page_controller=>'irm/companies',:page_action=>'support_group',:not_auto_mult=>true)
    irm_companies_support_group.permissions_tls.build(:language=>'zh',:name=>'支持组',:description=>'支持组',:source_lang=>'en')
    irm_companies_support_group.permissions_tls.build(:language=>'en',:name=>'Support Group',:description=>'Support Group',:source_lang=>'en')
    irm_companies_support_group.save
    irm_companies_update= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_UPDATE',:page_controller=>'irm/companies',:page_action=>'update',:not_auto_mult=>true)
    irm_companies_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_companies_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_companies_update.save
    irm_companies_update_location= Irm::Permission.new(:permission_code=>'IRM_COMPANIES_UPDATE_LOCATION',:page_controller=>'irm/companies',:page_action=>'update_location',:not_auto_mult=>true)
    irm_companies_update_location.permissions_tls.build(:language=>'zh',:name=>'更新地点',:description=>'更新地点',:source_lang=>'en')
    irm_companies_update_location.permissions_tls.build(:language=>'en',:name=>'Update Location',:description=>'Update Location',:source_lang=>'en')
    irm_companies_update_location.save
    irm_company_accesses_create= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_CREATE',:page_controller=>'irm/company_accesses',:page_action=>'create',:not_auto_mult=>true)
    irm_company_accesses_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_company_accesses_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_company_accesses_create.save
    irm_company_accesses_edit= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_EDIT',:page_controller=>'irm/company_accesses',:page_action=>'edit',:not_auto_mult=>true)
    irm_company_accesses_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_company_accesses_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_company_accesses_edit.save
    irm_company_accesses_get_comp= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_GET_COMP',:page_controller=>'irm/company_accesses',:page_action=>'get_company',:not_auto_mult=>true)
    irm_company_accesses_get_comp.permissions_tls.build(:language=>'zh',:name=>'取得公司',:description=>'取得公司',:source_lang=>'en')
    irm_company_accesses_get_comp.permissions_tls.build(:language=>'en',:name=>'Get Company',:description=>'Get Company',:source_lang=>'en')
    irm_company_accesses_get_comp.save
    irm_company_accesses_get_data= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_GET_DATA',:page_controller=>'irm/company_accesses',:page_action=>'get_data',:not_auto_mult=>true)
    irm_company_accesses_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_company_accesses_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_company_accesses_get_data.save
    irm_company_accesses_index= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_INDEX',:page_controller=>'irm/company_accesses',:page_action=>'index',:not_auto_mult=>true)
    irm_company_accesses_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_company_accesses_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_company_accesses_index.save
    irm_company_accesses_mu_ed= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_MU_ED',:page_controller=>'irm/company_accesses',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_company_accesses_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_company_accesses_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_company_accesses_mu_ed.save
    irm_company_accesses_mu_ud= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_MU_UD',:page_controller=>'irm/company_accesses',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_company_accesses_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_company_accesses_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_company_accesses_mu_ud.save
    irm_company_accesses_new= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_NEW',:page_controller=>'irm/company_accesses',:page_action=>'new',:not_auto_mult=>true)
    irm_company_accesses_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_company_accesses_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_company_accesses_new.save
    irm_company_accesses_update= Irm::Permission.new(:permission_code=>'IRM_COMPANY_ACCESSES_UPDATE',:page_controller=>'irm/company_accesses',:page_action=>'update',:not_auto_mult=>true)
    irm_company_accesses_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_company_accesses_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_company_accesses_update.save
    irm_conditions_create= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_CREATE',:page_controller=>'irm/conditions',:page_action=>'create',:not_auto_mult=>true)
    irm_conditions_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_conditions_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_conditions_create.save
    irm_conditions_edit= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_EDIT',:page_controller=>'irm/conditions',:page_action=>'edit',:not_auto_mult=>true)
    irm_conditions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_conditions_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_conditions_edit.save
    irm_conditions_get_data= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_GET_DATA',:page_controller=>'irm/conditions',:page_action=>'get_data',:not_auto_mult=>true)
    irm_conditions_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_conditions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_conditions_get_data.save
    irm_conditions_index= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_INDEX',:page_controller=>'irm/conditions',:page_action=>'index',:not_auto_mult=>true)
    irm_conditions_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_conditions_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_conditions_index.save
    irm_conditions_mu_ed= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_MU_ED',:page_controller=>'irm/conditions',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_conditions_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_conditions_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_conditions_mu_ed.save
    irm_conditions_mu_ud= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_MU_UD',:page_controller=>'irm/conditions',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_conditions_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_conditions_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_conditions_mu_ud.save
    irm_conditions_new= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_NEW',:page_controller=>'irm/conditions',:page_action=>'new',:not_auto_mult=>true)
    irm_conditions_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_conditions_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_conditions_new.save
    irm_conditions_show= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_SHOW',:page_controller=>'irm/conditions',:page_action=>'show',:not_auto_mult=>true)
    irm_conditions_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_conditions_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_conditions_show.save
    irm_conditions_update= Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_UPDATE',:page_controller=>'irm/conditions',:page_action=>'update',:not_auto_mult=>true)
    irm_conditions_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_conditions_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_conditions_update.save
    irm_currencies_create= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_CREATE',:page_controller=>'irm/currencies',:page_action=>'create',:not_auto_mult=>true)
    irm_currencies_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_currencies_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_currencies_create.save
    irm_currencies_edit= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_EDIT',:page_controller=>'irm/currencies',:page_action=>'edit',:not_auto_mult=>true)
    irm_currencies_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_currencies_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_currencies_edit.save
    irm_currencies_get_data= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_GET_DATA',:page_controller=>'irm/currencies',:page_action=>'get_data',:not_auto_mult=>true)
    irm_currencies_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_currencies_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_currencies_get_data.save
    irm_currencies_index= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_INDEX',:page_controller=>'irm/currencies',:page_action=>'index',:not_auto_mult=>true)
    irm_currencies_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_currencies_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_currencies_index.save
    irm_currencies_mu_ed= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_MU_ED',:page_controller=>'irm/currencies',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_currencies_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_currencies_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_currencies_mu_ed.save
    irm_currencies_mu_ud= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_MU_UD',:page_controller=>'irm/currencies',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_currencies_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_currencies_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_currencies_mu_ud.save
    irm_currencies_new= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_NEW',:page_controller=>'irm/currencies',:page_action=>'new',:not_auto_mult=>true)
    irm_currencies_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_currencies_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_currencies_new.save
    irm_currencies_show= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_SHOW',:page_controller=>'irm/currencies',:page_action=>'show',:not_auto_mult=>true)
    irm_currencies_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_currencies_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_currencies_show.save
    irm_currencies_update= Irm::Permission.new(:permission_code=>'IRM_CURRENCIES_UPDATE',:page_controller=>'irm/currencies',:page_action=>'update',:not_auto_mult=>true)
    irm_currencies_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_currencies_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_currencies_update.save
    irm_departments_belongs_to= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_BELONGS_TO',:page_controller=>'irm/departments',:page_action=>'belongs_to',:not_auto_mult=>true)
    irm_departments_belongs_to.permissions_tls.build(:language=>'zh',:name=>'属于',:description=>'属于',:source_lang=>'en')
    irm_departments_belongs_to.permissions_tls.build(:language=>'en',:name=>'Belongs To',:description=>'Belongs To',:source_lang=>'en')
    irm_departments_belongs_to.save
    irm_departments_create= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_CREATE',:page_controller=>'irm/departments',:page_action=>'create',:not_auto_mult=>true)
    irm_departments_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_departments_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_departments_create.save
    irm_departments_edit= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_EDIT',:page_controller=>'irm/departments',:page_action=>'edit',:not_auto_mult=>true)
    irm_departments_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_departments_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_departments_edit.save
    irm_departments_get_data= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_GET_DATA',:page_controller=>'irm/departments',:page_action=>'get_data',:not_auto_mult=>true)
    irm_departments_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_departments_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_departments_get_data.save
    irm_departments_index= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_INDEX',:page_controller=>'irm/departments',:page_action=>'index',:not_auto_mult=>true)
    irm_departments_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_departments_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_departments_index.save
    irm_departments_mu_ed= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_MU_ED',:page_controller=>'irm/departments',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_departments_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_departments_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_departments_mu_ed.save
    irm_departments_mu_ud= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_MU_UD',:page_controller=>'irm/departments',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_departments_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_departments_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_departments_mu_ud.save
    irm_departments_new= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_NEW',:page_controller=>'irm/departments',:page_action=>'new',:not_auto_mult=>true)
    irm_departments_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_departments_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_departments_new.save
    irm_departments_show= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_SHOW',:page_controller=>'irm/departments',:page_action=>'show',:not_auto_mult=>true)
    irm_departments_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_departments_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_departments_show.save
    irm_departments_update= Irm::Permission.new(:permission_code=>'IRM_DEPARTMENTS_UPDATE',:page_controller=>'irm/departments',:page_action=>'update',:not_auto_mult=>true)
    irm_departments_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_departments_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_departments_update.save
    irm_dev_tools_index= Irm::Permission.new(:permission_code=>'IRM_DEV_TOOLS_INDEX',:page_controller=>'irm/dev_tools',:page_action=>'index',:not_auto_mult=>true)
    irm_dev_tools_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_dev_tools_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_dev_tools_index.save
    irm_dev_tools_show_permissions= Irm::Permission.new(:permission_code=>'IRM_DEV_TOOLS_SHOW_PERMISSIONS',:page_controller=>'irm/dev_tools',:page_action=>'show_permissions',:not_auto_mult=>true)
    irm_dev_tools_show_permissions.permissions_tls.build(:language=>'zh',:name=>'输出权限列表',:description=>'输出权限列表',:source_lang=>'en')
    irm_dev_tools_show_permissions.permissions_tls.build(:language=>'en',:name=>'Show Permissions',:description=>'Show Permissions',:source_lang=>'en')
    irm_dev_tools_show_permissions.save
    irm_dev_tools_show_per_data= Irm::Permission.new(:permission_code=>'IRM_DEV_TOOLS_SHOW_PER_DATA',:page_controller=>'irm/dev_tools',:page_action=>'show_permissions_data',:not_auto_mult=>true)
    irm_dev_tools_show_per_data.permissions_tls.build(:language=>'zh',:name=>'输出权限列表',:description=>'输出权限列表',:source_lang=>'en')
    irm_dev_tools_show_per_data.permissions_tls.build(:language=>'en',:name=>'Show Permissions Data',:description=>'Show Permissions Data',:source_lang=>'en')
    irm_dev_tools_show_per_data.save
    irm_filters_create= Irm::Permission.new(:permission_code=>'IRM_FILTERS_CREATE',:page_controller=>'irm/filters',:page_action=>'create',:not_auto_mult=>true)
    irm_filters_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_filters_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_filters_create.save
    irm_filters_edit= Irm::Permission.new(:permission_code=>'IRM_FILTERS_EDIT',:page_controller=>'irm/filters',:page_action=>'edit',:not_auto_mult=>true)
    irm_filters_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_filters_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_filters_edit.save
    irm_filters_new= Irm::Permission.new(:permission_code=>'IRM_FILTERS_NEW',:page_controller=>'irm/filters',:page_action=>'new',:not_auto_mult=>true)
    irm_filters_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_filters_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_filters_new.save
    irm_filters_update= Irm::Permission.new(:permission_code=>'IRM_FILTERS_UPDATE',:page_controller=>'irm/filters',:page_action=>'update',:not_auto_mult=>true)
    irm_filters_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_filters_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_filters_update.save
    irm_flex_values_create= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_CREATE',:page_controller=>'irm/flex_values',:page_action=>'create',:not_auto_mult=>true)
    irm_flex_values_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_flex_values_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_flex_values_create.save
    irm_flex_values_destroy= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_DESTROY',:page_controller=>'irm/flex_values',:page_action=>'destroy',:not_auto_mult=>true)
    irm_flex_values_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    irm_flex_values_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    irm_flex_values_destroy.save
    irm_flex_values_edit= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_EDIT',:page_controller=>'irm/flex_values',:page_action=>'edit',:not_auto_mult=>true)
    irm_flex_values_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_flex_values_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_flex_values_edit.save
    irm_flex_values_get_data= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_GET_DATA',:page_controller=>'irm/flex_values',:page_action=>'get_data',:not_auto_mult=>true)
    irm_flex_values_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_flex_values_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_flex_values_get_data.save
    irm_flex_values_index= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_INDEX',:page_controller=>'irm/flex_values',:page_action=>'index',:not_auto_mult=>true)
    irm_flex_values_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_flex_values_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_flex_values_index.save
    irm_flex_values_new= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_NEW',:page_controller=>'irm/flex_values',:page_action=>'new',:not_auto_mult=>true)
    irm_flex_values_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_flex_values_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_flex_values_new.save
    irm_flex_values_select_set= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_SELECT_SET',:page_controller=>'irm/flex_values',:page_action=>'select_set',:not_auto_mult=>true)
    irm_flex_values_select_set.permissions_tls.build(:language=>'zh',:name=>'选择值',:description=>'选择值',:source_lang=>'en')
    irm_flex_values_select_set.permissions_tls.build(:language=>'en',:name=>'Select Set',:description=>'Select Set',:source_lang=>'en')
    irm_flex_values_select_set.save
    irm_flex_values_show= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_SHOW',:page_controller=>'irm/flex_values',:page_action=>'show',:not_auto_mult=>true)
    irm_flex_values_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_flex_values_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_flex_values_show.save
    irm_flex_values_update= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_UPDATE',:page_controller=>'irm/flex_values',:page_action=>'update',:not_auto_mult=>true)
    irm_flex_values_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_flex_values_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_flex_values_update.save
    irm_flex_values_mu_ed= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_MU_ED',:page_controller=>'irm/flex_values',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_flex_values_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_flex_values_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_flex_values_mu_ed.save
    irm_flex_values_mu_ud= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUES_MU_UD',:page_controller=>'irm/flex_values',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_flex_values_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_flex_values_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_flex_values_mu_ud.save
    irm_flex_value_sets_create= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_CREATE',:page_controller=>'irm/flex_value_sets',:page_action=>'create',:not_auto_mult=>true)
    irm_flex_value_sets_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_flex_value_sets_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_flex_value_sets_create.save
    irm_flex_value_sets_edit= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_EDIT',:page_controller=>'irm/flex_value_sets',:page_action=>'edit',:not_auto_mult=>true)
    irm_flex_value_sets_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_flex_value_sets_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_flex_value_sets_edit.save
    irm_flex_value_sets_get_data= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_GET_DATA',:page_controller=>'irm/flex_value_sets',:page_action=>'get_data',:not_auto_mult=>true)
    irm_flex_value_sets_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_flex_value_sets_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_flex_value_sets_get_data.save
    irm_flex_value_sets_index= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_INDEX',:page_controller=>'irm/flex_value_sets',:page_action=>'index',:not_auto_mult=>true)
    irm_flex_value_sets_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_flex_value_sets_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_flex_value_sets_index.save
    irm_flex_value_sets_new= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_NEW',:page_controller=>'irm/flex_value_sets',:page_action=>'new',:not_auto_mult=>true)
    irm_flex_value_sets_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_flex_value_sets_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_flex_value_sets_new.save
    irm_flex_value_sets_show= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_SHOW',:page_controller=>'irm/flex_value_sets',:page_action=>'show',:not_auto_mult=>true)
    irm_flex_value_sets_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_flex_value_sets_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_flex_value_sets_show.save
    irm_flex_value_sets_update= Irm::Permission.new(:permission_code=>'IRM_FLEX_VALUE_SETS_UPDATE',:page_controller=>'irm/flex_value_sets',:page_action=>'update',:not_auto_mult=>true)
    irm_flex_value_sets_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_flex_value_sets_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_flex_value_sets_update.save
    irm_general_categories_create= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_CREATE',:page_controller=>'irm/general_categories',:page_action=>'create',:not_auto_mult=>true)
    irm_general_categories_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_general_categories_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_general_categories_create.save
    irm_general_categories_edit= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_EDIT',:page_controller=>'irm/general_categories',:page_action=>'edit',:not_auto_mult=>true)
    irm_general_categories_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_general_categories_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_general_categories_edit.save
    irm_general_categories_get_da= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_GET_DA',:page_controller=>'irm/general_categories',:page_action=>'get_data',:not_auto_mult=>true)
    irm_general_categories_get_da.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_general_categories_get_da.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_general_categories_get_da.save
    irm_general_categories_index= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_INDEX',:page_controller=>'irm/general_categories',:page_action=>'index',:not_auto_mult=>true)
    irm_general_categories_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_general_categories_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_general_categories_index.save
    irm_general_categories_new= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_NEW',:page_controller=>'irm/general_categories',:page_action=>'new',:not_auto_mult=>true)
    irm_general_categories_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_general_categories_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_general_categories_new.save
    irm_general_categories_show= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_SHOW',:page_controller=>'irm/general_categories',:page_action=>'show',:not_auto_mult=>true)
    irm_general_categories_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_general_categories_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_general_categories_show.save
    irm_general_categories_update= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATEGORIES_UPDATE',:page_controller=>'irm/general_categories',:page_action=>'update',:not_auto_mult=>true)
    irm_general_categories_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_general_categories_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_general_categories_update.save
    irm_general_cate_ud_se_ops= Irm::Permission.new(:permission_code=>'IRM_GENERAL_CATE_UD_SE_OPS',:page_controller=>'irm/general_categories',:page_action=>'update_segment_options',:not_auto_mult=>true)
    irm_general_cate_ud_se_ops.permissions_tls.build(:language=>'zh',:name=>'编辑段值',:description=>'编辑段值',:source_lang=>'en')
    irm_general_cate_ud_se_ops.permissions_tls.build(:language=>'en',:name=>'Update Segment Options',:description=>'Update Segment Options',:source_lang=>'en')
    irm_general_cate_ud_se_ops.save
    irm_global_settings_crop= Irm::Permission.new(:permission_code=>'IRM_GLOBAL_SETTINGS_CROP',:page_controller=>'irm/global_settings',:page_action=>'crop',:not_auto_mult=>true)
    irm_global_settings_crop.permissions_tls.build(:language=>'zh',:name=>'截图',:description=>'截图',:source_lang=>'en')
    irm_global_settings_crop.permissions_tls.build(:language=>'en',:name=>'Crop Images',:description=>'Crop Images',:source_lang=>'en')
    irm_global_settings_crop.save
    irm_global_settings_edit= Irm::Permission.new(:permission_code=>'IRM_GLOBAL_SETTINGS_EDIT',:page_controller=>'irm/global_settings',:page_action=>'edit',:not_auto_mult=>true)
    irm_global_settings_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_global_settings_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_global_settings_edit.save
    irm_global_settings_index= Irm::Permission.new(:permission_code=>'IRM_GLOBAL_SETTINGS_INDEX',:page_controller=>'irm/global_settings',:page_action=>'index',:not_auto_mult=>true)
    irm_global_settings_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_global_settings_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_global_settings_index.save
    irm_global_settings_update= Irm::Permission.new(:permission_code=>'IRM_GLOBAL_SETTINGS_UPDATE',:page_controller=>'irm/global_settings',:page_action=>'update',:not_auto_mult=>true)
    irm_global_settings_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_global_settings_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_global_settings_update.save
    irm_home_index= Irm::Permission.new(:permission_code=>'IRM_HOME_INDEX',:page_controller=>'irm/home',:page_action=>'index',:not_auto_mult=>true)
    irm_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_home_index.save
    irm_identities_create= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_CREATE',:page_controller=>'irm/identities',:page_action=>'create',:not_auto_mult=>true)
    irm_identities_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_identities_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_identities_create.save
    irm_identities_edit= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT',:page_controller=>'irm/identities',:page_action=>'edit',:not_auto_mult=>true)
    irm_identities_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_identities_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_identities_edit.save
    irm_identities_edit_info= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT_INFO',:page_controller=>'irm/identities',:page_action=>'edit_info',:not_auto_mult=>true)
    irm_identities_edit_info.permissions_tls.build(:language=>'zh',:name=>'编辑内容',:description=>'编辑内容',:source_lang=>'en')
    irm_identities_edit_info.permissions_tls.build(:language=>'en',:name=>'Edit Info',:description=>'Edit Info',:source_lang=>'en')
    irm_identities_edit_info.save
    irm_identities_edit_password= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_EDIT_PASSWORD',:page_controller=>'irm/identities',:page_action=>'edit_password',:not_auto_mult=>true)
    irm_identities_edit_password.permissions_tls.build(:language=>'zh',:name=>'修改密码',:description=>'修改密码',:source_lang=>'en')
    irm_identities_edit_password.permissions_tls.build(:language=>'en',:name=>'Change Password',:description=>'Change Password',:source_lang=>'en')
    irm_identities_edit_password.save
    irm_identities_get_data= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_GET_DATA',:page_controller=>'irm/identities',:page_action=>'get_data',:not_auto_mult=>true)
    irm_identities_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_identities_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_identities_get_data.save
    irm_identities_index= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_INDEX',:page_controller=>'irm/identities',:page_action=>'index',:not_auto_mult=>true)
    irm_identities_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_identities_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_identities_index.save
    irm_identities_mu_ed= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_MU_ED',:page_controller=>'irm/identities',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_identities_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_identities_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_identities_mu_ed.save
    irm_identities_mu_ud= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_MU_UD',:page_controller=>'irm/identities',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_identities_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_identities_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_identities_mu_ud.save
    irm_identities_my_info= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_MY_INFO',:page_controller=>'irm/identities',:page_action=>'my_info',:not_auto_mult=>true)
    irm_identities_my_info.permissions_tls.build(:language=>'zh',:name=>'我的信息',:description=>'我的信息',:source_lang=>'en')
    irm_identities_my_info.permissions_tls.build(:language=>'en',:name=>'My Infomations',:description=>'My Infomations',:source_lang=>'en')
    irm_identities_my_info.save
    irm_identities_new= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_NEW',:page_controller=>'irm/identities',:page_action=>'new',:not_auto_mult=>true)
    irm_identities_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_identities_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_identities_new.save
    irm_identities_show= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_SHOW',:page_controller=>'irm/identities',:page_action=>'show',:not_auto_mult=>true)
    irm_identities_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_identities_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_identities_show.save
    irm_identities_update= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE',:page_controller=>'irm/identities',:page_action=>'update',:not_auto_mult=>true)
    irm_identities_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_identities_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_identities_update.save
    irm_identities_update_info= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE_INFO',:page_controller=>'irm/identities',:page_action=>'update_info',:not_auto_mult=>true)
    irm_identities_update_info.permissions_tls.build(:language=>'zh',:name=>'编辑信息',:description=>'编辑信息',:source_lang=>'en')
    irm_identities_update_info.permissions_tls.build(:language=>'en',:name=>'Edit Info',:description=>'Edit Info',:source_lang=>'en')
    irm_identities_update_info.save
    irm_identities_update_password= Irm::Permission.new(:permission_code=>'IRM_IDENTITIES_UPDATE_PASSWORD',:page_controller=>'irm/identities',:page_action=>'update_password',:not_auto_mult=>true)
    irm_identities_update_password.permissions_tls.build(:language=>'zh',:name=>'忘记密码',:description=>'忘记密码',:source_lang=>'en')
    irm_identities_update_password.permissions_tls.build(:language=>'en',:name=>'Change Password',:description=>'Change Password',:source_lang=>'en')
    irm_identities_update_password.save
    irm_id_flexes_create= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_CREATE',:page_controller=>'irm/id_flexes',:page_action=>'create',:not_auto_mult=>true)
    irm_id_flexes_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flexes_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flexes_create.save
    irm_id_flexes_edit= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_EDIT',:page_controller=>'irm/id_flexes',:page_action=>'edit',:not_auto_mult=>true)
    irm_id_flexes_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flexes_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flexes_edit.save
    irm_id_flexes_get_data= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_GET_DATA',:page_controller=>'irm/id_flexes',:page_action=>'get_data',:not_auto_mult=>true)
    irm_id_flexes_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_id_flexes_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_id_flexes_get_data.save
    irm_id_flexes_index= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_INDEX',:page_controller=>'irm/id_flexes',:page_action=>'index',:not_auto_mult=>true)
    irm_id_flexes_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_id_flexes_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_id_flexes_index.save
    irm_id_flexes_new= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_NEW',:page_controller=>'irm/id_flexes',:page_action=>'new',:not_auto_mult=>true)
    irm_id_flexes_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flexes_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flexes_new.save
    irm_id_flexes_show= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_SHOW',:page_controller=>'irm/id_flexes',:page_action=>'show',:not_auto_mult=>true)
    irm_id_flexes_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_id_flexes_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_id_flexes_show.save
    irm_id_flexes_update= Irm::Permission.new(:permission_code=>'IRM_ID_FLEXES_UPDATE',:page_controller=>'irm/id_flexes',:page_action=>'update',:not_auto_mult=>true)
    irm_id_flexes_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flexes_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flexes_update.save
    irm_id_flex_segments_create= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_CREATE',:page_controller=>'irm/id_flex_segments',:page_action=>'create',:not_auto_mult=>true)
    irm_id_flex_segments_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flex_segments_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flex_segments_create.save
    irm_id_flex_segments_edit= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_EDIT',:page_controller=>'irm/id_flex_segments',:page_action=>'edit',:not_auto_mult=>true)
    irm_id_flex_segments_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flex_segments_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flex_segments_edit.save
    irm_id_flex_segments_get_data= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_GET_DATA',:page_controller=>'irm/id_flex_segments',:page_action=>'get_data',:not_auto_mult=>true)
    irm_id_flex_segments_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_id_flex_segments_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_id_flex_segments_get_data.save
    irm_id_flex_segments_index= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_INDEX',:page_controller=>'irm/id_flex_segments',:page_action=>'index',:not_auto_mult=>true)
    irm_id_flex_segments_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_id_flex_segments_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_id_flex_segments_index.save
    irm_id_flex_segments_new= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_NEW',:page_controller=>'irm/id_flex_segments',:page_action=>'new',:not_auto_mult=>true)
    irm_id_flex_segments_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flex_segments_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flex_segments_new.save
    irm_id_flex_segments_show= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_SHOW',:page_controller=>'irm/id_flex_segments',:page_action=>'show',:not_auto_mult=>true)
    irm_id_flex_segments_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_id_flex_segments_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_id_flex_segments_show.save
    irm_id_flex_segments_update= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_UPDATE',:page_controller=>'irm/id_flex_segments',:page_action=>'update',:not_auto_mult=>true)
    irm_id_flex_segments_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flex_segments_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flex_segments_update.save
    irm_id_flex_segments_mu_ed= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_MU_ED',:page_controller=>'irm/id_flex_segments',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_id_flex_segments_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_id_flex_segments_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_id_flex_segments_mu_ed.save
    irm_id_flex_segments_mu_ud= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_SEGMENTS_MU_UD',:page_controller=>'irm/id_flex_segments',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_id_flex_segments_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_id_flex_segments_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_id_flex_segments_mu_ud.save
    irm_id_flex_structures_create= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_CREATE',:page_controller=>'irm/id_flex_structures',:page_action=>'create',:not_auto_mult=>true)
    irm_id_flex_structures_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flex_structures_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flex_structures_create.save
    irm_id_flex_structures_edit= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_EDIT',:page_controller=>'irm/id_flex_structures',:page_action=>'edit',:not_auto_mult=>true)
    irm_id_flex_structures_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flex_structures_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flex_structures_edit.save
    irm_id_flex_structures_get_da= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_GET_DA',:page_controller=>'irm/id_flex_structures',:page_action=>'get_data',:not_auto_mult=>true)
    irm_id_flex_structures_get_da.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_id_flex_structures_get_da.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_id_flex_structures_get_da.save
    irm_id_flex_structures_index= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_INDEX',:page_controller=>'irm/id_flex_structures',:page_action=>'index',:not_auto_mult=>true)
    irm_id_flex_structures_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_id_flex_structures_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_id_flex_structures_index.save
    irm_id_flex_structures_new= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_NEW',:page_controller=>'irm/id_flex_structures',:page_action=>'new',:not_auto_mult=>true)
    irm_id_flex_structures_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_id_flex_structures_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_id_flex_structures_new.save
    irm_id_flex_structures_sel_par= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_SEL_PAR',:page_controller=>'irm/id_flex_structures',:page_action=>'select_parent',:not_auto_mult=>true)
    irm_id_flex_structures_sel_par.permissions_tls.build(:language=>'zh',:name=>'选择弹性域',:description=>'选择弹性域',:source_lang=>'en')
    irm_id_flex_structures_sel_par.permissions_tls.build(:language=>'en',:name=>'Select Id Flex',:description=>'Select Id Flex',:source_lang=>'en')
    irm_id_flex_structures_sel_par.save
    irm_id_flex_structures_show= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_SHOW',:page_controller=>'irm/id_flex_structures',:page_action=>'show',:not_auto_mult=>true)
    irm_id_flex_structures_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_id_flex_structures_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_id_flex_structures_show.save
    irm_id_flex_structures_update= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_UPDATE',:page_controller=>'irm/id_flex_structures',:page_action=>'update',:not_auto_mult=>true)
    irm_id_flex_structures_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_id_flex_structures_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_id_flex_structures_update.save
    irm_id_flex_structures_mu_ed= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_MU_ED',:page_controller=>'irm/id_flex_structures',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_id_flex_structures_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_id_flex_structures_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_id_flex_structures_mu_ed.save
    irm_id_flex_structures_mu_ud= Irm::Permission.new(:permission_code=>'IRM_ID_FLEX_STRUCTURES_MU_UD',:page_controller=>'irm/id_flex_structures',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_id_flex_structures_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_id_flex_structures_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_id_flex_structures_mu_ud.save
    irm_languages_create= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_CREATE',:page_controller=>'irm/languages',:page_action=>'create',:not_auto_mult=>true)
    irm_languages_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_languages_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_languages_create.save
    irm_languages_edit= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_EDIT',:page_controller=>'irm/languages',:page_action=>'edit',:not_auto_mult=>true)
    irm_languages_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_languages_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_languages_edit.save
    irm_languages_get_data= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_GET_DATA',:page_controller=>'irm/languages',:page_action=>'get_data',:not_auto_mult=>true)
    irm_languages_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_languages_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_languages_get_data.save
    irm_languages_index= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_INDEX',:page_controller=>'irm/languages',:page_action=>'index',:not_auto_mult=>true)
    irm_languages_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_languages_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_languages_index.save
    irm_languages_mu_ed= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_MU_ED',:page_controller=>'irm/languages',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_languages_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_languages_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_languages_mu_ed.save
    irm_languages_mu_ud= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_MU_UD',:page_controller=>'irm/languages',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_languages_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_languages_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_languages_mu_ud.save
    irm_languages_new= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_NEW',:page_controller=>'irm/languages',:page_action=>'new',:not_auto_mult=>true)
    irm_languages_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_languages_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_languages_new.save
    irm_languages_show= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_SHOW',:page_controller=>'irm/languages',:page_action=>'show',:not_auto_mult=>true)
    irm_languages_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_languages_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_languages_show.save
    irm_languages_update= Irm::Permission.new(:permission_code=>'IRM_LANGUAGES_UPDATE',:page_controller=>'irm/languages',:page_action=>'update',:not_auto_mult=>true)
    irm_languages_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_languages_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_languages_update.save
    irm_locations_create= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_CREATE',:page_controller=>'irm/locations',:page_action=>'create',:not_auto_mult=>true)
    irm_locations_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_locations_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_locations_create.save
    irm_locations_edit= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_EDIT',:page_controller=>'irm/locations',:page_action=>'edit',:not_auto_mult=>true)
    irm_locations_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_locations_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_locations_edit.save
    irm_locations_get_data= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_GET_DATA',:page_controller=>'irm/locations',:page_action=>'get_data',:not_auto_mult=>true)
    irm_locations_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_locations_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_locations_get_data.save
    irm_locations_index= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_INDEX',:page_controller=>'irm/locations',:page_action=>'index',:not_auto_mult=>true)
    irm_locations_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_locations_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_locations_index.save
    irm_locations_new= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_NEW',:page_controller=>'irm/locations',:page_action=>'new',:not_auto_mult=>true)
    irm_locations_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_locations_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_locations_new.save
    irm_locations_show= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_SHOW',:page_controller=>'irm/locations',:page_action=>'show',:not_auto_mult=>true)
    irm_locations_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_locations_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_locations_show.save
    irm_locations_update= Irm::Permission.new(:permission_code=>'IRM_LOCATIONS_UPDATE',:page_controller=>'irm/locations',:page_action=>'update',:not_auto_mult=>true)
    irm_locations_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_locations_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_locations_update.save
    irm_login_records_get_data= Irm::Permission.new(:permission_code=>'IRM_LOGIN_RECORDS_GET_DATA',:page_controller=>'irm/login_records',:page_action=>'get_data',:not_auto_mult=>true)
    irm_login_records_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_login_records_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_login_records_get_data.save
    irm_login_records_index= Irm::Permission.new(:permission_code=>'IRM_LOGIN_RECORDS_INDEX',:page_controller=>'irm/login_records',:page_action=>'index',:not_auto_mult=>true)
    irm_login_records_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_login_records_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_login_records_index.save
    irm_lookup_types_add_code= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_ADD_CODE',:page_controller=>'irm/lookup_types',:page_action=>'add_code',:not_auto_mult=>true)
    irm_lookup_types_add_code.permissions_tls.build(:language=>'zh',:name=>'添加编码',:description=>'添加编码',:source_lang=>'en')
    irm_lookup_types_add_code.permissions_tls.build(:language=>'en',:name=>'Add Code',:description=>'Add Code',:source_lang=>'en')
    irm_lookup_types_add_code.save
    irm_lookup_types_chk_lu_code= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CHK_LU_CODE',:page_controller=>'irm/lookup_types',:page_action=>'check_lookup_code',:not_auto_mult=>true)
    irm_lookup_types_chk_lu_code.permissions_tls.build(:language=>'zh',:name=>'检查编码',:description=>'检查编码',:source_lang=>'en')
    irm_lookup_types_chk_lu_code.permissions_tls.build(:language=>'en',:name=>'Check Lookup Code',:description=>'Check Lookup Code',:source_lang=>'en')
    irm_lookup_types_chk_lu_code.save
    irm_lookup_types_create= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CREATE',:page_controller=>'irm/lookup_types',:page_action=>'create',:not_auto_mult=>true)
    irm_lookup_types_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_lookup_types_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_lookup_types_create.save
    irm_lookup_types_cra_ed_value= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CRA_ED_VALUE',:page_controller=>'irm/lookup_types',:page_action=>'create_edit_value',:not_auto_mult=>true)
    irm_lookup_types_cra_ed_value.permissions_tls.build(:language=>'zh',:name=>'保存快速编辑值',:description=>'保存快速编辑值',:source_lang=>'en')
    irm_lookup_types_cra_ed_value.permissions_tls.build(:language=>'en',:name=>'Create Edit Value',:description=>'Create Edit Value',:source_lang=>'en')
    irm_lookup_types_cra_ed_value.save
    irm_lookup_types_create_value= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CREATE_VALUE',:page_controller=>'irm/lookup_types',:page_action=>'create_value',:not_auto_mult=>true)
    irm_lookup_types_create_value.permissions_tls.build(:language=>'zh',:name=>'保存编码值',:description=>'保存编码值',:source_lang=>'en')
    irm_lookup_types_create_value.permissions_tls.build(:language=>'en',:name=>'Create Value',:description=>'Create Value',:source_lang=>'en')
    irm_lookup_types_create_value.save
    irm_lookup_types_edit= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_EDIT',:page_controller=>'irm/lookup_types',:page_action=>'edit',:not_auto_mult=>true)
    irm_lookup_types_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_lookup_types_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_lookup_types_edit.save
    irm_lookup_types_get_lu_types= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_GET_LU_TYPES',:page_controller=>'irm/lookup_types',:page_action=>'get_lookup_types',:not_auto_mult=>true)
    irm_lookup_types_get_lu_types.permissions_tls.build(:language=>'zh',:name=>'取快速编码',:description=>'取快速编码',:source_lang=>'en')
    irm_lookup_types_get_lu_types.permissions_tls.build(:language=>'en',:name=>'Get Lookup Types',:description=>'Get Lookup Types',:source_lang=>'en')
    irm_lookup_types_get_lu_types.save
    irm_lookup_types_get_lu_values= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_GET_LU_VALUES',:page_controller=>'irm/lookup_types',:page_action=>'get_lookup_values',:not_auto_mult=>true)
    irm_lookup_types_get_lu_values.permissions_tls.build(:language=>'zh',:name=>'取快速编码值',:description=>'取快速编码值',:source_lang=>'en')
    irm_lookup_types_get_lu_values.permissions_tls.build(:language=>'en',:name=>'Get Lookup Values',:description=>'Get Lookup Values',:source_lang=>'en')
    irm_lookup_types_get_lu_values.save
    irm_lookup_types_index= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_INDEX',:page_controller=>'irm/lookup_types',:page_action=>'index',:not_auto_mult=>true)
    irm_lookup_types_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_lookup_types_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_lookup_types_index.save
    irm_lookup_types_new= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_NEW',:page_controller=>'irm/lookup_types',:page_action=>'new',:not_auto_mult=>true)
    irm_lookup_types_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_lookup_types_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_lookup_types_new.save
    irm_lookup_types_show= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_SHOW',:page_controller=>'irm/lookup_types',:page_action=>'show',:not_auto_mult=>true)
    irm_lookup_types_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_lookup_types_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_lookup_types_show.save
    irm_lookup_types_update= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_UPDATE',:page_controller=>'irm/lookup_types',:page_action=>'update',:not_auto_mult=>true)
    irm_lookup_types_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_lookup_types_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_lookup_types_update.save
    irm_lookup_values_create= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_CREATE',:page_controller=>'irm/lookup_values',:page_action=>'create',:not_auto_mult=>true)
    irm_lookup_values_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_lookup_values_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_lookup_values_create.save
    irm_lookup_values_edit= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_EDIT',:page_controller=>'irm/lookup_values',:page_action=>'edit',:not_auto_mult=>true)
    irm_lookup_values_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_lookup_values_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_lookup_values_edit.save
    irm_lookup_values_get_data= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_GET_DATA',:page_controller=>'irm/lookup_values',:page_action=>'get_data',:not_auto_mult=>true)
    irm_lookup_values_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_lookup_values_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_lookup_values_get_data.save
    irm_lookup_values_get_lu_val= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_GET_LU_VAL',:page_controller=>'irm/lookup_values',:page_action=>'get_lookup_values',:not_auto_mult=>true)
    irm_lookup_values_get_lu_val.permissions_tls.build(:language=>'zh',:name=>'取快速编码值',:description=>'取快速编码值',:source_lang=>'en')
    irm_lookup_values_get_lu_val.permissions_tls.build(:language=>'en',:name=>'Get Lookup Values',:description=>'Get Lookup Values',:source_lang=>'en')
    irm_lookup_values_get_lu_val.save
    irm_lookup_values_index= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_INDEX',:page_controller=>'irm/lookup_values',:page_action=>'index',:not_auto_mult=>true)
    irm_lookup_values_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_lookup_values_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_lookup_values_index.save
    irm_lookup_values_mu_ed= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_MU_ED',:page_controller=>'irm/lookup_values',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_lookup_values_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_lookup_values_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_lookup_values_mu_ed.save
    irm_lookup_values_mu_ud= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_MU_UD',:page_controller=>'irm/lookup_values',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_lookup_values_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_lookup_values_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_lookup_values_mu_ud.save
    irm_lookup_values_new= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_NEW',:page_controller=>'irm/lookup_values',:page_action=>'new',:not_auto_mult=>true)
    irm_lookup_values_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_lookup_values_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_lookup_values_new.save
    irm_lookup_values_sel_lu_type= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_SEL_LU_TYPE',:page_controller=>'irm/lookup_values',:page_action=>'select_lookup_type',:not_auto_mult=>true)
    irm_lookup_values_sel_lu_type.permissions_tls.build(:language=>'zh',:name=>'选择编码类型',:description=>'选择编码类型',:source_lang=>'en')
    irm_lookup_values_sel_lu_type.permissions_tls.build(:language=>'en',:name=>'Select Lookup Type',:description=>'Select Lookup Type',:source_lang=>'en')
    irm_lookup_values_sel_lu_type.save
    irm_lookup_values_show= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_SHOW',:page_controller=>'irm/lookup_values',:page_action=>'show',:not_auto_mult=>true)
    irm_lookup_values_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_lookup_values_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_lookup_values_show.save
    irm_lookup_values_update= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_UPDATE',:page_controller=>'irm/lookup_values',:page_action=>'update',:not_auto_mult=>true)
    irm_lookup_values_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_lookup_values_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_lookup_values_update.save
    irm_mail_templates_copy= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_COPY',:page_controller=>'irm/mail_templates',:page_action=>'copy',:not_auto_mult=>true)
    irm_mail_templates_copy.permissions_tls.build(:language=>'zh',:name=>'复制',:description=>'复制',:source_lang=>'en')
    irm_mail_templates_copy.permissions_tls.build(:language=>'en',:name=>'Copy',:description=>'Copy',:source_lang=>'en')
    irm_mail_templates_copy.save
    irm_mail_templates_cp_temp= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_CP_TEMP',:page_controller=>'irm/mail_templates',:page_action=>'copy_template',:not_auto_mult=>true)
    irm_mail_templates_cp_temp.permissions_tls.build(:language=>'zh',:name=>'复制模板',:description=>'复制模板',:source_lang=>'en')
    irm_mail_templates_cp_temp.permissions_tls.build(:language=>'en',:name=>'Copy Template',:description=>'Copy Template',:source_lang=>'en')
    irm_mail_templates_cp_temp.save
    irm_mail_templates_create= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_CREATE',:page_controller=>'irm/mail_templates',:page_action=>'create',:not_auto_mult=>true)
    irm_mail_templates_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_mail_templates_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_mail_templates_create.save
    irm_mail_templates_destroy= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_DESTROY',:page_controller=>'irm/mail_templates',:page_action=>'destroy',:not_auto_mult=>true)
    irm_mail_templates_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    irm_mail_templates_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    irm_mail_templates_destroy.save
    irm_mail_templates_edit= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_EDIT',:page_controller=>'irm/mail_templates',:page_action=>'edit',:not_auto_mult=>true)
    irm_mail_templates_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_mail_templates_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_mail_templates_edit.save
    irm_mail_templates_cur_lang= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_CUR_LANG',:page_controller=>'irm/mail_templates',:page_action=>'get_current_language',:not_auto_mult=>true)
    irm_mail_templates_cur_lang.permissions_tls.build(:language=>'zh',:name=>'当前语言',:description=>'当前语言',:source_lang=>'en')
    irm_mail_templates_cur_lang.permissions_tls.build(:language=>'en',:name=>'Get Current Language',:description=>'Get Current Language',:source_lang=>'en')
    irm_mail_templates_cur_lang.save
    irm_mail_templates_get_data= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_GET_DATA',:page_controller=>'irm/mail_templates',:page_action=>'get_data',:not_auto_mult=>true)
    irm_mail_templates_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_mail_templates_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_mail_templates_get_data.save
    irm_mail_templates_index= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_INDEX',:page_controller=>'irm/mail_templates',:page_action=>'index',:not_auto_mult=>true)
    irm_mail_templates_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_mail_templates_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_mail_templates_index.save
    irm_mail_templates_mu_ed= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_MU_ED',:page_controller=>'irm/mail_templates',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_mail_templates_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_mail_templates_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_mail_templates_mu_ed.save
    irm_mail_templates_mu_ud= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_MU_UD',:page_controller=>'irm/mail_templates',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_mail_templates_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_mail_templates_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_mail_templates_mu_ud.save
    irm_mail_templates_new= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_NEW',:page_controller=>'irm/mail_templates',:page_action=>'new',:not_auto_mult=>true)
    irm_mail_templates_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_mail_templates_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_mail_templates_new.save
    irm_mail_templates_show= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_SHOW',:page_controller=>'irm/mail_templates',:page_action=>'show',:not_auto_mult=>true)
    irm_mail_templates_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_mail_templates_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_mail_templates_show.save
    irm_mail_templates_test= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_TEST',:page_controller=>'irm/mail_templates',:page_action=>'test_mail_template',:not_auto_mult=>true)
    irm_mail_templates_test.permissions_tls.build(:language=>'zh',:name=>'测试',:description=>'测试',:source_lang=>'en')
    irm_mail_templates_test.permissions_tls.build(:language=>'en',:name=>'Test Mail Template',:description=>'Test Mail Template',:source_lang=>'en')
    irm_mail_templates_test.save
    irm_mail_templates_update= Irm::Permission.new(:permission_code=>'IRM_MAIL_TEMPLATES_UPDATE',:page_controller=>'irm/mail_templates',:page_action=>'update',:not_auto_mult=>true)
    irm_mail_templates_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_mail_templates_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_mail_templates_update.save
    irm_menus_create= Irm::Permission.new(:permission_code=>'IRM_MENUS_CREATE',:page_controller=>'irm/menus',:page_action=>'create',:not_auto_mult=>true)
    irm_menus_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_menus_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_menus_create.save
    irm_menus_edit= Irm::Permission.new(:permission_code=>'IRM_MENUS_EDIT',:page_controller=>'irm/menus',:page_action=>'edit',:not_auto_mult=>true)
    irm_menus_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_menus_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_menus_edit.save
    irm_menus_get_data= Irm::Permission.new(:permission_code=>'IRM_MENUS_GET_DATA',:page_controller=>'irm/menus',:page_action=>'get_data',:not_auto_mult=>true)
    irm_menus_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_menus_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_menus_get_data.save
    irm_menus_index= Irm::Permission.new(:permission_code=>'IRM_MENUS_INDEX',:page_controller=>'irm/menus',:page_action=>'index',:not_auto_mult=>true)
    irm_menus_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_menus_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_menus_index.save
    irm_menus_new= Irm::Permission.new(:permission_code=>'IRM_MENUS_NEW',:page_controller=>'irm/menus',:page_action=>'new',:not_auto_mult=>true)
    irm_menus_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_menus_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_menus_new.save
    irm_menus_remove_entry= Irm::Permission.new(:permission_code=>'IRM_MENUS_REMOVE_ENTRY',:page_controller=>'irm/menus',:page_action=>'remove_entry',:not_auto_mult=>true)
    irm_menus_remove_entry.permissions_tls.build(:language=>'zh',:name=>'移除菜单项',:description=>'移除菜单项',:source_lang=>'en')
    irm_menus_remove_entry.permissions_tls.build(:language=>'en',:name=>'Remove Entry',:description=>'Remove Entry',:source_lang=>'en')
    irm_menus_remove_entry.save
    irm_menus_show= Irm::Permission.new(:permission_code=>'IRM_MENUS_SHOW',:page_controller=>'irm/menus',:page_action=>'show',:not_auto_mult=>true)
    irm_menus_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_menus_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_menus_show.save
    irm_menus_update= Irm::Permission.new(:permission_code=>'IRM_MENUS_UPDATE',:page_controller=>'irm/menus',:page_action=>'update',:not_auto_mult=>true)
    irm_menus_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_menus_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_menus_update.save
    irm_menus_mu_ed= Irm::Permission.new(:permission_code=>'IRM_MENUS_MU_ED',:page_controller=>'irm/menus',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_menus_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_menus_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_menus_mu_ed.save
    irm_menus_mu_ud= Irm::Permission.new(:permission_code=>'IRM_MENUS_MU_UD',:page_controller=>'irm/menus',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_menus_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_menus_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_menus_mu_ud.save
    irm_menu_entries_create= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_CREATE',:page_controller=>'irm/menu_entries',:page_action=>'create',:not_auto_mult=>true)
    irm_menu_entries_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_menu_entries_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_menu_entries_create.save
    irm_menu_entries_destroy= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_DESTROY',:page_controller=>'irm/menu_entries',:page_action=>'destroy',:not_auto_mult=>true)
    irm_menu_entries_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    irm_menu_entries_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    irm_menu_entries_destroy.save
    irm_menu_entries_edit= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_EDIT',:page_controller=>'irm/menu_entries',:page_action=>'edit',:not_auto_mult=>true)
    irm_menu_entries_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_menu_entries_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_menu_entries_edit.save
    irm_menu_entries_get_data= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_GET_DATA',:page_controller=>'irm/menu_entries',:page_action=>'get_data',:not_auto_mult=>true)
    irm_menu_entries_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_menu_entries_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_menu_entries_get_data.save
    irm_menu_entries_index= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_INDEX',:page_controller=>'irm/menu_entries',:page_action=>'index',:not_auto_mult=>true)
    irm_menu_entries_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_menu_entries_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_menu_entries_index.save
    irm_menu_entries_new= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_NEW',:page_controller=>'irm/menu_entries',:page_action=>'new',:not_auto_mult=>true)
    irm_menu_entries_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_menu_entries_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_menu_entries_new.save
    irm_menu_entries_select_parent= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_SELECT_PARENT',:page_controller=>'irm/menu_entries',:page_action=>'select_parent',:not_auto_mult=>true)
    irm_menu_entries_select_parent.permissions_tls.build(:language=>'zh',:name=>'选择菜单',:description=>'选择菜单',:source_lang=>'en')
    irm_menu_entries_select_parent.permissions_tls.build(:language=>'en',:name=>'Select Menu',:description=>'Select Menu',:source_lang=>'en')
    irm_menu_entries_select_parent.save
    irm_menu_entries_show= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_SHOW',:page_controller=>'irm/menu_entries',:page_action=>'show',:not_auto_mult=>true)
    irm_menu_entries_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_menu_entries_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_menu_entries_show.save
    irm_menu_entries_update= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_UPDATE',:page_controller=>'irm/menu_entries',:page_action=>'update',:not_auto_mult=>true)
    irm_menu_entries_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_menu_entries_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_menu_entries_update.save
    irm_menu_entries_mu_ed= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_MU_ED',:page_controller=>'irm/menu_entries',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_menu_entries_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_menu_entries_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_menu_entries_mu_ed.save
    irm_menu_entries_mu_ud= Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_MU_UD',:page_controller=>'irm/menu_entries',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_menu_entries_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_menu_entries_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_menu_entries_mu_ud.save
    irm_navigations_entrance= Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_ENTRANCE',:page_controller=>'irm/navigations',:page_action=>'entrance',:not_auto_mult=>true)
    irm_navigations_entrance.permissions_tls.build(:language=>'zh',:name=>'系统入口',:description=>'系统入口',:source_lang=>'en')
    irm_navigations_entrance.permissions_tls.build(:language=>'en',:name=>'Entrace',:description=>'Entrace',:source_lang=>'en')
    irm_navigations_entrance.save
    irm_organizations_belongs_to= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_BELONGS_TO',:page_controller=>'irm/organizations',:page_action=>'belongs_to',:not_auto_mult=>true)
    irm_organizations_belongs_to.permissions_tls.build(:language=>'zh',:name=>'属于',:description=>'属于',:source_lang=>'en')
    irm_organizations_belongs_to.permissions_tls.build(:language=>'en',:name=>'Belongs To',:description=>'Belongs To',:source_lang=>'en')
    irm_organizations_belongs_to.save
    irm_organizations_create= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_CREATE',:page_controller=>'irm/organizations',:page_action=>'create',:not_auto_mult=>true)
    irm_organizations_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_organizations_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_organizations_create.save
    irm_organizations_edit= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_EDIT',:page_controller=>'irm/organizations',:page_action=>'edit',:not_auto_mult=>true)
    irm_organizations_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_organizations_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_organizations_edit.save
    irm_organizations_get_data= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_GET_DATA',:page_controller=>'irm/organizations',:page_action=>'get_data',:not_auto_mult=>true)
    irm_organizations_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_organizations_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_organizations_get_data.save
    irm_organizations_index= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_INDEX',:page_controller=>'irm/organizations',:page_action=>'index',:not_auto_mult=>true)
    irm_organizations_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_organizations_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_organizations_index.save
    irm_organizations_mu_ed= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_MU_ED',:page_controller=>'irm/organizations',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_organizations_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_organizations_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_organizations_mu_ed.save
    irm_organizations_mu_ud= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_MU_UD',:page_controller=>'irm/organizations',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_organizations_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_organizations_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_organizations_mu_ud.save
    irm_organizations_new= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_NEW',:page_controller=>'irm/organizations',:page_action=>'new',:not_auto_mult=>true)
    irm_organizations_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_organizations_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_organizations_new.save
    irm_organizations_show= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_SHOW',:page_controller=>'irm/organizations',:page_action=>'show',:not_auto_mult=>true)
    irm_organizations_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_organizations_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_organizations_show.save
    irm_organizations_update= Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_UPDATE',:page_controller=>'irm/organizations',:page_action=>'update',:not_auto_mult=>true)
    irm_organizations_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_organizations_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_organizations_update.save
    irm_people_add_roles= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_ADD_ROLES',:page_controller=>'irm/people',:page_action=>'add_roles',:not_auto_mult=>true)
    irm_people_add_roles.permissions_tls.build(:language=>'zh',:name=>'添加角色',:description=>'添加角色',:source_lang=>'en')
    irm_people_add_roles.permissions_tls.build(:language=>'en',:name=>'Add Roles',:description=>'Add Roles',:source_lang=>'en')
    irm_people_add_roles.save
    irm_people_choose_company= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_CHOOSE_COMPANY',:page_controller=>'irm/people',:page_action=>'choose_company',:not_auto_mult=>true)
    irm_people_choose_company.permissions_tls.build(:language=>'zh',:name=>'选择公司',:description=>'选择公司',:source_lang=>'en')
    irm_people_choose_company.permissions_tls.build(:language=>'en',:name=>'Choose Company',:description=>'Choose Company',:source_lang=>'en')
    irm_people_choose_company.save
    irm_people_create= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_CREATE',:page_controller=>'irm/people',:page_action=>'create',:not_auto_mult=>true)
    irm_people_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_people_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_people_create.save
    irm_people_edit= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_EDIT',:page_controller=>'irm/people',:page_action=>'edit',:not_auto_mult=>true)
    irm_people_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_people_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_people_edit.save
    irm_people_get_available_roles= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_AVAILABLE_ROLES',:page_controller=>'irm/people',:page_action=>'get_available_roles',:not_auto_mult=>true)
    irm_people_get_available_roles.permissions_tls.build(:language=>'zh',:name=>'取得可用角色',:description=>'取得可用角色',:source_lang=>'en')
    irm_people_get_available_roles.permissions_tls.build(:language=>'en',:name=>'Get Available Roles',:description=>'Get Available Roles',:source_lang=>'en')
    irm_people_get_available_roles.save
    irm_people_get_choose_people= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_CHOOSE_PEOPLE',:page_controller=>'irm/people',:page_action=>'get_choose_people',:not_auto_mult=>true)
    irm_people_get_choose_people.permissions_tls.build(:language=>'zh',:name=>'选择人员',:description=>'选择人员',:source_lang=>'en')
    irm_people_get_choose_people.permissions_tls.build(:language=>'en',:name=>'Choose People',:description=>'Choose People',:source_lang=>'en')
    irm_people_get_choose_people.save
    irm_people_get_data= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_DATA',:page_controller=>'irm/people',:page_action=>'get_data',:not_auto_mult=>true)
    irm_people_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_people_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_people_get_data.save
    irm_people_get_owned_roles= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_OWNED_ROLES',:page_controller=>'irm/people',:page_action=>'get_owned_roles',:not_auto_mult=>true)
    irm_people_get_owned_roles.permissions_tls.build(:language=>'zh',:name=>'取得已有角色',:description=>'取得已有角色',:source_lang=>'en')
    irm_people_get_owned_roles.permissions_tls.build(:language=>'en',:name=>'Get Owned Roles',:description=>'Get Owned Roles',:source_lang=>'en')
    irm_people_get_owned_roles.save
    irm_people_get_support_group= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_GET_SUPPORT_GROUP',:page_controller=>'irm/people',:page_action=>'get_support_group',:not_auto_mult=>true)
    irm_people_get_support_group.permissions_tls.build(:language=>'zh',:name=>'所有支持组',:description=>'所有支持组',:source_lang=>'en')
    irm_people_get_support_group.permissions_tls.build(:language=>'en',:name=>'All Support Group',:description=>'All Support Group',:source_lang=>'en')
    irm_people_get_support_group.save
    irm_people_index= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_INDEX',:page_controller=>'irm/people',:page_action=>'index',:not_auto_mult=>true)
    irm_people_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_people_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_people_index.save
    irm_people_multilingual_edit= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_MULTILINGUAL_EDIT',:page_controller=>'irm/people',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_people_multilingual_edit.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_people_multilingual_edit.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_people_multilingual_edit.save
    irm_people_multilingual_update= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_MULTILINGUAL_UPDATE',:page_controller=>'irm/people',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_people_multilingual_update.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_people_multilingual_update.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_people_multilingual_update.save
    irm_people_new= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_NEW',:page_controller=>'irm/people',:page_action=>'new',:not_auto_mult=>true)
    irm_people_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_people_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_people_new.save
    irm_people_remove_role= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_REMOVE_ROLE',:page_controller=>'irm/people',:page_action=>'remove_role',:not_auto_mult=>true)
    irm_people_remove_role.permissions_tls.build(:language=>'zh',:name=>'移除角色',:description=>'移除角色',:source_lang=>'en')
    irm_people_remove_role.permissions_tls.build(:language=>'en',:name=>'Remove Role',:description=>'Remove Role',:source_lang=>'en')
    irm_people_remove_role.save
    irm_people_select_roles= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_SELECT_ROLES',:page_controller=>'irm/people',:page_action=>'select_roles',:not_auto_mult=>true)
    irm_people_select_roles.permissions_tls.build(:language=>'zh',:name=>'选择角色',:description=>'选择角色',:source_lang=>'en')
    irm_people_select_roles.permissions_tls.build(:language=>'en',:name=>'Select Roles',:description=>'Select Roles',:source_lang=>'en')
    irm_people_select_roles.save
    irm_people_show= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_SHOW',:page_controller=>'irm/people',:page_action=>'show',:not_auto_mult=>true)
    irm_people_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_people_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_people_show.save
    irm_people_update= Irm::Permission.new(:permission_code=>'IRM_PEOPLE_UPDATE',:page_controller=>'irm/people',:page_action=>'update',:not_auto_mult=>true)
    irm_people_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_people_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_people_update.save
    irm_permissions_create= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_CREATE',:page_controller=>'irm/permissions',:page_action=>'create',:not_auto_mult=>true)
    irm_permissions_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_permissions_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_permissions_create.save
    irm_permissions_data_grid= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_DATA_GRID',:page_controller=>'irm/permissions',:page_action=>'data_grid',:not_auto_mult=>true)
    irm_permissions_data_grid.permissions_tls.build(:language=>'zh',:name=>'数据',:description=>'数据',:source_lang=>'en')
    irm_permissions_data_grid.permissions_tls.build(:language=>'en',:name=>'Data Grid',:description=>'Data Grid',:source_lang=>'en')
    irm_permissions_data_grid.save
    irm_permissions_edit= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_EDIT',:page_controller=>'irm/permissions',:page_action=>'edit',:not_auto_mult=>true)
    irm_permissions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_permissions_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_permissions_edit.save
    irm_permissions_func_get_da= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_FUNC_GET_DA',:page_controller=>'irm/permissions',:page_action=>'function_get_data',:not_auto_mult=>true)
    irm_permissions_func_get_da.permissions_tls.build(:language=>'zh',:name=>'取得功能',:description=>'取得功能',:source_lang=>'en')
    irm_permissions_func_get_da.permissions_tls.build(:language=>'en',:name=>'Function Get Data',:description=>'Function Get Data',:source_lang=>'en')
    irm_permissions_func_get_da.save
    irm_permissions_get_data= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_GET_DATA',:page_controller=>'irm/permissions',:page_action=>'get_data',:not_auto_mult=>true)
    irm_permissions_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_permissions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_permissions_get_data.save
    irm_permissions_index= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_INDEX',:page_controller=>'irm/permissions',:page_action=>'index',:not_auto_mult=>true)
    irm_permissions_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_permissions_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_permissions_index.save
    irm_permissions_mu_ed= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_MU_ED',:page_controller=>'irm/permissions',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_permissions_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_permissions_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_permissions_mu_ed.save
    irm_permissions_mu_ud= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_MU_UD',:page_controller=>'irm/permissions',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_permissions_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_permissions_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_permissions_mu_ud.save
    irm_permissions_new= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_NEW',:page_controller=>'irm/permissions',:page_action=>'new',:not_auto_mult=>true)
    irm_permissions_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_permissions_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_permissions_new.save
    irm_permissions_show= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_SHOW',:page_controller=>'irm/permissions',:page_action=>'show',:not_auto_mult=>true)
    irm_permissions_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_permissions_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_permissions_show.save
    irm_permissions_update= Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_UPDATE',:page_controller=>'irm/permissions',:page_action=>'update',:not_auto_mult=>true)
    irm_permissions_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_permissions_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_permissions_update.save
    irm_product_modules_create= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_CREATE',:page_controller=>'irm/product_modules',:page_action=>'create',:not_auto_mult=>true)
    irm_product_modules_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_product_modules_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_product_modules_create.save
    irm_product_modules_data_grid= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_DATA_GRID',:page_controller=>'irm/product_modules',:page_action=>'data_grid',:not_auto_mult=>true)
    irm_product_modules_data_grid.permissions_tls.build(:language=>'zh',:name=>'数据',:description=>'数据',:source_lang=>'en')
    irm_product_modules_data_grid.permissions_tls.build(:language=>'en',:name=>'Data Grid',:description=>'Data Grid',:source_lang=>'en')
    irm_product_modules_data_grid.save
    irm_product_modules_edit= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_EDIT',:page_controller=>'irm/product_modules',:page_action=>'edit',:not_auto_mult=>true)
    irm_product_modules_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_product_modules_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_product_modules_edit.save
    irm_product_modules_get_data= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_GET_DATA',:page_controller=>'irm/product_modules',:page_action=>'get_data',:not_auto_mult=>true)
    irm_product_modules_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_product_modules_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_product_modules_get_data.save
    irm_product_modules_index= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_INDEX',:page_controller=>'irm/product_modules',:page_action=>'index',:not_auto_mult=>true)
    irm_product_modules_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_product_modules_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_product_modules_index.save
    irm_product_modules_new= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_NEW',:page_controller=>'irm/product_modules',:page_action=>'new',:not_auto_mult=>true)
    irm_product_modules_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_product_modules_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_product_modules_new.save
    irm_product_modules_update= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_UPDATE',:page_controller=>'irm/product_modules',:page_action=>'update',:not_auto_mult=>true)
    irm_product_modules_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_product_modules_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_product_modules_update.save
    irm_product_modules_mu_ed= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_MU_ED',:page_controller=>'irm/product_modules',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_product_modules_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_product_modules_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_product_modules_mu_ed.save
    irm_product_modules_mu_ud= Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_MU_UD',:page_controller=>'irm/product_modules',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_product_modules_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_product_modules_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_product_modules_mu_ud.save
    irm_regions_create= Irm::Permission.new(:permission_code=>'IRM_REGIONS_CREATE',:page_controller=>'irm/regions',:page_action=>'create',:not_auto_mult=>true)
    irm_regions_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_regions_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_regions_create.save
    irm_regions_edit= Irm::Permission.new(:permission_code=>'IRM_REGIONS_EDIT',:page_controller=>'irm/regions',:page_action=>'edit',:not_auto_mult=>true)
    irm_regions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_regions_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_regions_edit.save
    irm_regions_get_data= Irm::Permission.new(:permission_code=>'IRM_REGIONS_GET_DATA',:page_controller=>'irm/regions',:page_action=>'get_data',:not_auto_mult=>true)
    irm_regions_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_regions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_regions_get_data.save
    irm_regions_index= Irm::Permission.new(:permission_code=>'IRM_REGIONS_INDEX',:page_controller=>'irm/regions',:page_action=>'index',:not_auto_mult=>true)
    irm_regions_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_regions_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_regions_index.save
    irm_regions_mu_ed= Irm::Permission.new(:permission_code=>'IRM_REGIONS_MU_ED',:page_controller=>'irm/regions',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_regions_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_regions_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_regions_mu_ed.save
    irm_regions_mu_ud= Irm::Permission.new(:permission_code=>'IRM_REGIONS_MU_UD',:page_controller=>'irm/regions',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_regions_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_regions_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_regions_mu_ud.save
    irm_regions_new= Irm::Permission.new(:permission_code=>'IRM_REGIONS_NEW',:page_controller=>'irm/regions',:page_action=>'new',:not_auto_mult=>true)
    irm_regions_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_regions_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_regions_new.save
    irm_regions_show= Irm::Permission.new(:permission_code=>'IRM_REGIONS_SHOW',:page_controller=>'irm/regions',:page_action=>'show',:not_auto_mult=>true)
    irm_regions_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_regions_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_regions_show.save
    irm_regions_update= Irm::Permission.new(:permission_code=>'IRM_REGIONS_UPDATE',:page_controller=>'irm/regions',:page_action=>'update',:not_auto_mult=>true)
    irm_regions_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_regions_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_regions_update.save
    irm_roles_create= Irm::Permission.new(:permission_code=>'IRM_ROLES_CREATE',:page_controller=>'irm/roles',:page_action=>'create',:not_auto_mult=>true)
    irm_roles_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_roles_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_roles_create.save
    irm_roles_edit= Irm::Permission.new(:permission_code=>'IRM_ROLES_EDIT',:page_controller=>'irm/roles',:page_action=>'edit',:not_auto_mult=>true)
    irm_roles_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_roles_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_roles_edit.save
    irm_roles_get_data= Irm::Permission.new(:permission_code=>'IRM_ROLES_GET_DATA',:page_controller=>'irm/roles',:page_action=>'get_data',:not_auto_mult=>true)
    irm_roles_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_roles_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_roles_get_data.save
    irm_roles_index= Irm::Permission.new(:permission_code=>'IRM_ROLES_INDEX',:page_controller=>'irm/roles',:page_action=>'index',:not_auto_mult=>true)
    irm_roles_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_roles_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_roles_index.save
    irm_roles_new= Irm::Permission.new(:permission_code=>'IRM_ROLES_NEW',:page_controller=>'irm/roles',:page_action=>'new',:not_auto_mult=>true)
    irm_roles_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_roles_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_roles_new.save
    irm_roles_show= Irm::Permission.new(:permission_code=>'IRM_ROLES_SHOW',:page_controller=>'irm/roles',:page_action=>'show',:not_auto_mult=>true)
    irm_roles_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_roles_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_roles_show.save
    irm_roles_update= Irm::Permission.new(:permission_code=>'IRM_ROLES_UPDATE',:page_controller=>'irm/roles',:page_action=>'update',:not_auto_mult=>true)
    irm_roles_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_roles_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_roles_update.save
    irm_roles_mu_ed= Irm::Permission.new(:permission_code=>'IRM_ROLES_MU_ED',:page_controller=>'irm/roles',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_roles_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_roles_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_roles_mu_ed.save
    irm_roles_mu_ud= Irm::Permission.new(:permission_code=>'IRM_ROLES_MU_UD',:page_controller=>'irm/roles',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_roles_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_roles_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_roles_mu_ud.save
    irm_scripts_create= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_CREATE',:page_controller=>'irm/scripts',:page_action=>'create',:not_auto_mult=>true)
    irm_scripts_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_scripts_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_scripts_create.save
    irm_scripts_edit= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_EDIT',:page_controller=>'irm/scripts',:page_action=>'edit',:not_auto_mult=>true)
    irm_scripts_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_scripts_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_scripts_edit.save
    irm_scripts_get_data= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_GET_DATA',:page_controller=>'irm/scripts',:page_action=>'get_data',:not_auto_mult=>true)
    irm_scripts_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_scripts_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_scripts_get_data.save
    irm_scripts_index= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_INDEX',:page_controller=>'irm/scripts',:page_action=>'index',:not_auto_mult=>true)
    irm_scripts_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_scripts_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_scripts_index.save
    irm_scripts_mu_ed= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_MU_ED',:page_controller=>'irm/scripts',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_scripts_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_scripts_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_scripts_mu_ed.save
    irm_scripts_mu_ud= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_MU_UD',:page_controller=>'irm/scripts',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_scripts_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_scripts_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_scripts_mu_ud.save
    irm_scripts_new= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_NEW',:page_controller=>'irm/scripts',:page_action=>'new',:not_auto_mult=>true)
    irm_scripts_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_scripts_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_scripts_new.save
    irm_scripts_show= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_SHOW',:page_controller=>'irm/scripts',:page_action=>'show',:not_auto_mult=>true)
    irm_scripts_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_scripts_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_scripts_show.save
    irm_scripts_update= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_UPDATE',:page_controller=>'irm/scripts',:page_action=>'update',:not_auto_mult=>true)
    irm_scripts_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_scripts_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_scripts_update.save
    irm_scripts_update= Irm::Permission.new(:permission_code=>'IRM_SCRIPTS_UPDATE',:page_controller=>'irm/scripts',:page_action=>'update',:not_auto_mult=>true)
    irm_scripts_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_scripts_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_scripts_update.save
    irm_setting_common= Irm::Permission.new(:permission_code=>'IRM_SETTING_COMMON',:page_controller=>'irm/setting',:page_action=>'common',:not_auto_mult=>true)
    irm_setting_common.permissions_tls.build(:language=>'zh',:name=>'通用设置',:description=>'通用设置',:source_lang=>'en')
    irm_setting_common.permissions_tls.build(:language=>'en',:name=>'Common Settings',:description=>'Common Settings',:source_lang=>'en')
    irm_setting_common.save
    irm_setting_index= Irm::Permission.new(:permission_code=>'IRM_SETTING_INDEX',:page_controller=>'irm/setting',:page_action=>'index',:not_auto_mult=>true)
    irm_setting_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_setting_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_setting_index.save
    irm_sites_create= Irm::Permission.new(:permission_code=>'IRM_SITES_CREATE',:page_controller=>'irm/sites',:page_action=>'create',:not_auto_mult=>true)
    irm_sites_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_sites_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_sites_create.save
    irm_sites_edit= Irm::Permission.new(:permission_code=>'IRM_SITES_EDIT',:page_controller=>'irm/sites',:page_action=>'edit',:not_auto_mult=>true)
    irm_sites_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_sites_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_sites_edit.save
    irm_sites_get_data= Irm::Permission.new(:permission_code=>'IRM_SITES_GET_DATA',:page_controller=>'irm/sites',:page_action=>'get_data',:not_auto_mult=>true)
    irm_sites_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_sites_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_sites_get_data.save
    irm_sites_index= Irm::Permission.new(:permission_code=>'IRM_SITES_INDEX',:page_controller=>'irm/sites',:page_action=>'index',:not_auto_mult=>true)
    irm_sites_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_sites_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_sites_index.save
    irm_sites_multilingual_edit= Irm::Permission.new(:permission_code=>'IRM_SITES_MULTILINGUAL_EDIT',:page_controller=>'irm/sites',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_sites_multilingual_edit.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_sites_multilingual_edit.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_sites_multilingual_edit.save
    irm_sites_multilingual_update= Irm::Permission.new(:permission_code=>'IRM_SITES_MULTILINGUAL_UPDATE',:page_controller=>'irm/sites',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_sites_multilingual_update.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_sites_multilingual_update.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_sites_multilingual_update.save
    irm_sites_new= Irm::Permission.new(:permission_code=>'IRM_SITES_NEW',:page_controller=>'irm/sites',:page_action=>'new',:not_auto_mult=>true)
    irm_sites_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_sites_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_sites_new.save
    irm_sites_select_site= Irm::Permission.new(:permission_code=>'IRM_SITES_SELECT_SITE',:page_controller=>'irm/sites',:page_action=>'select_site',:not_auto_mult=>true)
    irm_sites_select_site.permissions_tls.build(:language=>'zh',:name=>'选择地点',:description=>'选择地点',:source_lang=>'en')
    irm_sites_select_site.permissions_tls.build(:language=>'en',:name=>'Select Site',:description=>'Select Site',:source_lang=>'en')
    irm_sites_select_site.save
    irm_sites_show= Irm::Permission.new(:permission_code=>'IRM_SITES_SHOW',:page_controller=>'irm/sites',:page_action=>'show',:not_auto_mult=>true)
    irm_sites_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_sites_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_sites_show.save
    irm_sites_update= Irm::Permission.new(:permission_code=>'IRM_SITES_UPDATE',:page_controller=>'irm/sites',:page_action=>'update',:not_auto_mult=>true)
    irm_sites_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_sites_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_sites_update.save
    irm_site_groups_add_site= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_ADD_SITE',:page_controller=>'irm/site_groups',:page_action=>'add_site',:not_auto_mult=>true)
    irm_site_groups_add_site.permissions_tls.build(:language=>'zh',:name=>'添加地点',:description=>'添加地点',:source_lang=>'en')
    irm_site_groups_add_site.permissions_tls.build(:language=>'en',:name=>'Add Site',:description=>'Add Site',:source_lang=>'en')
    irm_site_groups_add_site.save
    irm_site_groups_belongs_to= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_BELONGS_TO',:page_controller=>'irm/site_groups',:page_action=>'belongs_to',:not_auto_mult=>true)
    irm_site_groups_belongs_to.permissions_tls.build(:language=>'zh',:name=>'属于',:description=>'属于',:source_lang=>'en')
    irm_site_groups_belongs_to.permissions_tls.build(:language=>'en',:name=>'Belongs To',:description=>'Belongs To',:source_lang=>'en')
    irm_site_groups_belongs_to.save
    irm_site_groups_create= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_CREATE',:page_controller=>'irm/site_groups',:page_action=>'create',:not_auto_mult=>true)
    irm_site_groups_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_site_groups_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_site_groups_create.save
    irm_site_groups_create_site= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_CREATE_SITE',:page_controller=>'irm/site_groups',:page_action=>'create_site',:not_auto_mult=>true)
    irm_site_groups_create_site.permissions_tls.build(:language=>'zh',:name=>'创建地点',:description=>'创建地点',:source_lang=>'en')
    irm_site_groups_create_site.permissions_tls.build(:language=>'en',:name=>'Create Site',:description=>'Create Site',:source_lang=>'en')
    irm_site_groups_create_site.save
    irm_site_groups_current= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_CURRENT',:page_controller=>'irm/site_groups',:page_action=>'current_site_group',:not_auto_mult=>true)
    irm_site_groups_current.permissions_tls.build(:language=>'zh',:name=>'当前地点组地点',:description=>'当前地点组地点',:source_lang=>'en')
    irm_site_groups_current.permissions_tls.build(:language=>'en',:name=>'Current Site Group',:description=>'Current Site Group',:source_lang=>'en')
    irm_site_groups_current.save
    irm_site_groups_edit= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_EDIT',:page_controller=>'irm/site_groups',:page_action=>'edit',:not_auto_mult=>true)
    irm_site_groups_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_site_groups_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_site_groups_edit.save
    irm_site_groups_edit_site= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_EDIT_SITE',:page_controller=>'irm/site_groups',:page_action=>'edit_site',:not_auto_mult=>true)
    irm_site_groups_edit_site.permissions_tls.build(:language=>'zh',:name=>'编辑地点',:description=>'编辑地点',:source_lang=>'en')
    irm_site_groups_edit_site.permissions_tls.build(:language=>'en',:name=>'Edit Site',:description=>'Edit Site',:source_lang=>'en')
    irm_site_groups_edit_site.save
    irm_site_groups_get_current= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_GET_CURRENT',:page_controller=>'irm/site_groups',:page_action=>'get_current_group_site',:not_auto_mult=>true)
    irm_site_groups_get_current.permissions_tls.build(:language=>'zh',:name=>'得到当前地点组地点',:description=>'得到当前地点组地点',:source_lang=>'en')
    irm_site_groups_get_current.permissions_tls.build(:language=>'en',:name=>'Get Current Site Group',:description=>'Get Current Site Group',:source_lang=>'en')
    irm_site_groups_get_current.save
    irm_site_groups_get_data= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_GET_DATA',:page_controller=>'irm/site_groups',:page_action=>'get_data',:not_auto_mult=>true)
    irm_site_groups_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_site_groups_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_site_groups_get_data.save
    irm_site_groups_index= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_INDEX',:page_controller=>'irm/site_groups',:page_action=>'index',:not_auto_mult=>true)
    irm_site_groups_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_site_groups_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_site_groups_index.save
    irm_site_groups_mu_ed= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_MU_ED',:page_controller=>'irm/site_groups',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_site_groups_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_site_groups_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_site_groups_mu_ed.save
    irm_site_groups_mu_ud= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_MU_UD',:page_controller=>'irm/site_groups',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_site_groups_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_site_groups_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_site_groups_mu_ud.save
    irm_site_groups_new= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_NEW',:page_controller=>'irm/site_groups',:page_action=>'new',:not_auto_mult=>true)
    irm_site_groups_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_site_groups_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_site_groups_new.save
    irm_site_groups_show= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_SHOW',:page_controller=>'irm/site_groups',:page_action=>'show',:not_auto_mult=>true)
    irm_site_groups_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_site_groups_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_site_groups_show.save
    irm_site_groups_update= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_UPDATE',:page_controller=>'irm/site_groups',:page_action=>'update',:not_auto_mult=>true)
    irm_site_groups_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_site_groups_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_site_groups_update.save
    irm_site_groups_update_site= Irm::Permission.new(:permission_code=>'IRM_SITE_GROUPS_UPDATE_SITE',:page_controller=>'irm/site_groups',:page_action=>'update_site',:not_auto_mult=>true)
    irm_site_groups_update_site.permissions_tls.build(:language=>'zh',:name=>'更新地点',:description=>'更新地点',:source_lang=>'en')
    irm_site_groups_update_site.permissions_tls.build(:language=>'en',:name=>'Update Site',:description=>'Update Site',:source_lang=>'en')
    irm_site_groups_update_site.save
    irm_support_groups_add_persons= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_ADD_PERSONS',:page_controller=>'irm/support_groups',:page_action=>'add_persons',:not_auto_mult=>true)
    irm_support_groups_add_persons.permissions_tls.build(:language=>'zh',:name=>'添加成员',:description=>'添加成员',:source_lang=>'en')
    irm_support_groups_add_persons.permissions_tls.build(:language=>'en',:name=>'Add Person',:description=>'Add Person',:source_lang=>'en')
    irm_support_groups_add_persons.save
    irm_support_groups_belongs_to= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_BELONGS_TO',:page_controller=>'irm/support_groups',:page_action=>'belongs_to',:not_auto_mult=>true)
    irm_support_groups_belongs_to.permissions_tls.build(:language=>'zh',:name=>'属于',:description=>'属于',:source_lang=>'en')
    irm_support_groups_belongs_to.permissions_tls.build(:language=>'en',:name=>'Belongs To',:description=>'Belongs To',:source_lang=>'en')
    irm_support_groups_belongs_to.save
    irm_support_groups_cho_per= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_CHO_PER',:page_controller=>'irm/support_groups',:page_action=>'choose_person',:not_auto_mult=>true)
    irm_support_groups_cho_per.permissions_tls.build(:language=>'zh',:name=>'选择成员',:description=>'选择成员',:source_lang=>'en')
    irm_support_groups_cho_per.permissions_tls.build(:language=>'en',:name=>'Choose Person',:description=>'Choose Person',:source_lang=>'en')
    irm_support_groups_cho_per.save
    irm_support_groups_create= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_CREATE',:page_controller=>'irm/support_groups',:page_action=>'create',:not_auto_mult=>true)
    irm_support_groups_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_support_groups_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_support_groups_create.save
    irm_support_groups_cra_mem= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_CRA_MEM',:page_controller=>'irm/support_groups',:page_action=>'create_member',:not_auto_mult=>true)
    irm_support_groups_cra_mem.permissions_tls.build(:language=>'zh',:name=>'创建成员',:description=>'创建成员',:source_lang=>'en')
    irm_support_groups_cra_mem.permissions_tls.build(:language=>'en',:name=>'Create Member',:description=>'Create Member',:source_lang=>'en')
    irm_support_groups_cra_mem.save
    irm_support_groups_del_men= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_DEL_MEN',:page_controller=>'irm/support_groups',:page_action=>'delete_member',:not_auto_mult=>true)
    irm_support_groups_del_men.permissions_tls.build(:language=>'zh',:name=>'删除成员',:description=>'删除成员',:source_lang=>'en')
    irm_support_groups_del_men.permissions_tls.build(:language=>'en',:name=>'Delete Member',:description=>'Delete Member',:source_lang=>'en')
    irm_support_groups_del_men.save
    irm_support_groups_edit= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_EDIT',:page_controller=>'irm/support_groups',:page_action=>'edit',:not_auto_mult=>true)
    irm_support_groups_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_support_groups_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_support_groups_edit.save
    irm_support_groups_get_data= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_GET_DATA',:page_controller=>'irm/support_groups',:page_action=>'get_data',:not_auto_mult=>true)
    irm_support_groups_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_support_groups_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_support_groups_get_data.save
    irm_support_groups_get_mem= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_GET_MEM',:page_controller=>'irm/support_groups',:page_action=>'get_support_group_member',:not_auto_mult=>true)
    irm_support_groups_get_mem.permissions_tls.build(:language=>'zh',:name=>'取得成员',:description=>'取得成员',:source_lang=>'en')
    irm_support_groups_get_mem.permissions_tls.build(:language=>'en',:name=>'Get Member',:description=>'Get Member',:source_lang=>'en')
    irm_support_groups_get_mem.save
    irm_support_groups_index= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_INDEX',:page_controller=>'irm/support_groups',:page_action=>'index',:not_auto_mult=>true)
    irm_support_groups_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_support_groups_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_support_groups_index.save
    irm_support_groups_mu_ed= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_MU_ED',:page_controller=>'irm/support_groups',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    irm_support_groups_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_support_groups_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_support_groups_mu_ed.save
    irm_support_groups_mu_ud= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_MU_UD',:page_controller=>'irm/support_groups',:page_action=>'multilingual_update',:not_auto_mult=>true)
    irm_support_groups_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    irm_support_groups_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    irm_support_groups_mu_ud.save
    irm_support_groups_new= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_NEW',:page_controller=>'irm/support_groups',:page_action=>'new',:not_auto_mult=>true)
    irm_support_groups_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_support_groups_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_support_groups_new.save
    irm_support_groups_show= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_SHOW',:page_controller=>'irm/support_groups',:page_action=>'show',:not_auto_mult=>true)
    irm_support_groups_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    irm_support_groups_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    irm_support_groups_show.save
    irm_support_groups_update= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUPS_UPDATE',:page_controller=>'irm/support_groups',:page_action=>'update',:not_auto_mult=>true)
    irm_support_groups_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_support_groups_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_support_groups_update.save
    irm_support_group_mem_create= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_CREATE',:page_controller=>'irm/support_group_members',:page_action=>'create',:not_auto_mult=>true)
    irm_support_group_mem_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_support_group_mem_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_support_group_mem_create.save
    irm_support_group_mem_delete= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_DELETE',:page_controller=>'irm/support_group_members',:page_action=>'delete',:not_auto_mult=>true)
    irm_support_group_mem_delete.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    irm_support_group_mem_delete.permissions_tls.build(:language=>'en',:name=>'Delete',:description=>'Delete',:source_lang=>'en')
    irm_support_group_mem_delete.save
    irm_support_group_members_edit= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEMBERS_EDIT',:page_controller=>'irm/support_group_members',:page_action=>'edit',:not_auto_mult=>true)
    irm_support_group_members_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_support_group_members_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_support_group_members_edit.save
    irm_support_group_mem_get_da= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_GET_DA',:page_controller=>'irm/support_group_members',:page_action=>'get_data',:not_auto_mult=>true)
    irm_support_group_mem_get_da.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_support_group_mem_get_da.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_support_group_mem_get_da.save
    irm_support_group_mem_get_per= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_GET_PER',:page_controller=>'irm/support_group_members',:page_action=>'get_person',:not_auto_mult=>true)
    irm_support_group_mem_get_per.permissions_tls.build(:language=>'zh',:name=>'取得人员',:description=>'取得人员',:source_lang=>'en')
    irm_support_group_mem_get_per.permissions_tls.build(:language=>'en',:name=>'Get Person',:description=>'Get Person',:source_lang=>'en')
    irm_support_group_mem_get_per.save
    irm_support_group_mem_index= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_INDEX',:page_controller=>'irm/support_group_members',:page_action=>'index',:not_auto_mult=>true)
    irm_support_group_mem_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_support_group_mem_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_support_group_mem_index.save
    irm_support_group_members_new= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEMBERS_NEW',:page_controller=>'irm/support_group_members',:page_action=>'new',:not_auto_mult=>true)
    irm_support_group_members_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_support_group_members_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_support_group_members_new.save
    irm_support_group_mem_sel_per= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_SEL_PER',:page_controller=>'irm/support_group_members',:page_action=>'select_person',:not_auto_mult=>true)
    irm_support_group_mem_sel_per.permissions_tls.build(:language=>'zh',:name=>'选择人员',:description=>'选择人员',:source_lang=>'en')
    irm_support_group_mem_sel_per.permissions_tls.build(:language=>'en',:name=>'Select Person',:description=>'Select Person',:source_lang=>'en')
    irm_support_group_mem_sel_per.save
    irm_support_group_mem_ud= Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_MEM_UD',:page_controller=>'irm/support_group_members',:page_action=>'update',:not_auto_mult=>true)
    irm_support_group_mem_ud.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_support_group_mem_ud.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_support_group_mem_ud.save
    irm_value_sets_create= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_CREATE',:page_controller=>'irm/value_sets',:page_action=>'create',:not_auto_mult=>true)
    irm_value_sets_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_value_sets_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_value_sets_create.save
    irm_value_sets_edit= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_EDIT',:page_controller=>'irm/value_sets',:page_action=>'edit',:not_auto_mult=>true)
    irm_value_sets_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_value_sets_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_value_sets_edit.save
    irm_value_sets_get_data= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_GET_DATA',:page_controller=>'irm/value_sets',:page_action=>'get_data',:not_auto_mult=>true)
    irm_value_sets_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    irm_value_sets_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    irm_value_sets_get_data.save
    irm_value_sets_index= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_INDEX',:page_controller=>'irm/value_sets',:page_action=>'index',:not_auto_mult=>true)
    irm_value_sets_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_value_sets_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_value_sets_index.save
    irm_value_sets_new= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_NEW',:page_controller=>'irm/value_sets',:page_action=>'new',:not_auto_mult=>true)
    irm_value_sets_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    irm_value_sets_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    irm_value_sets_new.save
    irm_value_sets_update= Irm::Permission.new(:permission_code=>'IRM_VALUE_SETS_UPDATE',:page_controller=>'irm/value_sets',:page_action=>'update',:not_auto_mult=>true)
    irm_value_sets_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    irm_value_sets_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    irm_value_sets_update.save
    skm_entry_headers_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_CREATE',:page_controller=>'skm/entry_headers',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_headers_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_headers_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_headers_create.save
    skm_entry_headers_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_EDIT',:page_controller=>'skm/entry_headers',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_headers_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_headers_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_headers_edit.save
    skm_entry_headers_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_GET_DATA',:page_controller=>'skm/entry_headers',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_headers_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_headers_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_headers_get_data.save
    skm_entry_headers_get_his_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_GET_HIS_DA',:page_controller=>'skm/entry_headers',:page_action=>'get_history_entries_data',:not_auto_mult=>true)
    skm_entry_headers_get_his_da.permissions_tls.build(:language=>'zh',:name=>'得到历史文章数据',:description=>'得到历史文章数据',:source_lang=>'en')
    skm_entry_headers_get_his_da.permissions_tls.build(:language=>'en',:name=>'Get History Entries',:description=>'Get History Entries',:source_lang=>'en')
    skm_entry_headers_get_his_da.save
    skm_entry_headers_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDEX',:page_controller=>'skm/entry_headers',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_headers_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_headers_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_headers_index.save
    skm_entry_headers_index_search= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDEX_SEARCH',:page_controller=>'skm/entry_headers',:page_action=>'index_search',:not_auto_mult=>true)
    skm_entry_headers_index_search.permissions_tls.build(:language=>'zh',:name=>'搜索',:description=>'搜索',:source_lang=>'en')
    skm_entry_headers_index_search.permissions_tls.build(:language=>'en',:name=>'Search',:description=>'Search',:source_lang=>'en')
    skm_entry_headers_index_search.save
    skm_entry_headers_indse_get_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_INDSE_GET_DA',:page_controller=>'skm/entry_headers',:page_action=>'index_search_get_data',:not_auto_mult=>true)
    skm_entry_headers_indse_get_da.permissions_tls.build(:language=>'zh',:name=>'得到搜索结果',:description=>'得到搜索结果',:source_lang=>'en')
    skm_entry_headers_indse_get_da.permissions_tls.build(:language=>'en',:name=>'Get Search Result',:description=>'Get Search Result',:source_lang=>'en')
    skm_entry_headers_indse_get_da.save
    skm_entry_headers_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW',:page_controller=>'skm/entry_headers',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_headers_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_headers_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_headers_new.save
    skm_entry_headers_new_step_1= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_1',:page_controller=>'skm/entry_headers',:page_action=>'new_step_1',:not_auto_mult=>true)
    skm_entry_headers_new_step_1.permissions_tls.build(:language=>'zh',:name=>'创建 第一步',:description=>'创建 第一步',:source_lang=>'en')
    skm_entry_headers_new_step_1.permissions_tls.build(:language=>'en',:name=>'Create, Step 1',:description=>'Create, Step 1',:source_lang=>'en')
    skm_entry_headers_new_step_1.save
    skm_entry_headers_new_step_2= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_2',:page_controller=>'skm/entry_headers',:page_action=>'new_step_2',:not_auto_mult=>true)
    skm_entry_headers_new_step_2.permissions_tls.build(:language=>'zh',:name=>'创建 第二步',:description=>'创建 第二步',:source_lang=>'en')
    skm_entry_headers_new_step_2.permissions_tls.build(:language=>'en',:name=>'Create, Step 2',:description=>'Create, Step 2',:source_lang=>'en')
    skm_entry_headers_new_step_2.save
    skm_entry_headers_new_step_3= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_3',:page_controller=>'skm/entry_headers',:page_action=>'new_step_3',:not_auto_mult=>true)
    skm_entry_headers_new_step_3.permissions_tls.build(:language=>'zh',:name=>'创建 第三步',:description=>'创建 第三步',:source_lang=>'en')
    skm_entry_headers_new_step_3.permissions_tls.build(:language=>'en',:name=>'Create, Step 3',:description=>'Create, Step 3',:source_lang=>'en')
    skm_entry_headers_new_step_3.save
    skm_entry_headers_new_step_4= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW_STEP_4',:page_controller=>'skm/entry_headers',:page_action=>'new_step_4',:not_auto_mult=>true)
    skm_entry_headers_new_step_4.permissions_tls.build(:language=>'zh',:name=>'创建 第四步',:description=>'创建 第四步',:source_lang=>'en')
    skm_entry_headers_new_step_4.permissions_tls.build(:language=>'en',:name=>'Create, Step 4',:description=>'Create, Step 4',:source_lang=>'en')
    skm_entry_headers_new_step_4.save
    skm_entry_headers_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_SHOW',:page_controller=>'skm/entry_headers',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_headers_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_headers_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_headers_show.save
    skm_entry_headers_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_UPDATE',:page_controller=>'skm/entry_headers',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_headers_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_headers_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_headers_update.save
    skm_entry_statuses_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_CREATE',:page_controller=>'skm/entry_statuses',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_statuses_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_statuses_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_statuses_create.save
    skm_entry_statuses_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_EDIT',:page_controller=>'skm/entry_statuses',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_statuses_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_statuses_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_statuses_edit.save
    skm_entry_statuses_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_GET_DATA',:page_controller=>'skm/entry_statuses',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_statuses_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_statuses_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_statuses_get_data.save
    skm_entry_statuses_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_INDEX',:page_controller=>'skm/entry_statuses',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_statuses_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_statuses_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_statuses_index.save
    skm_entry_statuses_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_NEW',:page_controller=>'skm/entry_statuses',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_statuses_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_statuses_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_statuses_new.save
    skm_entry_statuses_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_SHOW',:page_controller=>'skm/entry_statuses',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_statuses_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_statuses_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_statuses_show.save
    skm_entry_statuses_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_UPDATE',:page_controller=>'skm/entry_statuses',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_statuses_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_statuses_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_statuses_update.save
    skm_entry_statuses_mu_ed= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_MU_ED',:page_controller=>'skm/entry_statuses',:page_action=>'multilingual_edit',:not_auto_mult=>true)
    skm_entry_statuses_mu_ed.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    skm_entry_statuses_mu_ed.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    skm_entry_statuses_mu_ed.save
    skm_entry_statuses_mu_ud= Irm::Permission.new(:permission_code=>'SKM_ENTRY_STATUSES_MU_UD',:page_controller=>'skm/entry_statuses',:page_action=>'multilingual_update',:not_auto_mult=>true)
    skm_entry_statuses_mu_ud.permissions_tls.build(:language=>'zh',:name=>'多语言编辑',:description=>'多语言编辑',:source_lang=>'en')
    skm_entry_statuses_mu_ud.permissions_tls.build(:language=>'en',:name=>'Multilingual Edit',:description=>'Multilingual Edit',:source_lang=>'en')
    skm_entry_statuses_mu_ud.save
    skm_entry_templates_add_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_ADD_ELE',:page_controller=>'skm/entry_templates',:page_action=>'add_elements',:not_auto_mult=>true)
    skm_entry_templates_add_ele.permissions_tls.build(:language=>'zh',:name=>'添加元素',:description=>'添加元素',:source_lang=>'en')
    skm_entry_templates_add_ele.permissions_tls.build(:language=>'en',:name=>'Add Elements',:description=>'Add Elements',:source_lang=>'en')
    skm_entry_templates_add_ele.save
    skm_entry_templates_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_CREATE',:page_controller=>'skm/entry_templates',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_templates_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_templates_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_templates_create.save
    skm_entry_templates_down_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_DOWN_ELE',:page_controller=>'skm/entry_templates',:page_action=>'down_element',:not_auto_mult=>true)
    skm_entry_templates_down_ele.permissions_tls.build(:language=>'zh',:name=>'下移元素',:description=>'下移元素',:source_lang=>'en')
    skm_entry_templates_down_ele.permissions_tls.build(:language=>'en',:name=>'Move Down',:description=>'Move Down',:source_lang=>'en')
    skm_entry_templates_down_ele.save
    skm_entry_templates_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_EDIT',:page_controller=>'skm/entry_templates',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_templates_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_templates_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_templates_edit.save
    skm_entry_templates_get_av_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_GET_AV_ELE',:page_controller=>'skm/entry_templates',:page_action=>'get_available_elements',:not_auto_mult=>true)
    skm_entry_templates_get_av_ele.permissions_tls.build(:language=>'zh',:name=>'得到可用元素',:description=>'得到可用元素',:source_lang=>'en')
    skm_entry_templates_get_av_ele.permissions_tls.build(:language=>'en',:name=>'Get Available Elements',:description=>'Get Available Elements',:source_lang=>'en')
    skm_entry_templates_get_av_ele.save
    skm_entry_templates_get_data= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_GET_DATA',:page_controller=>'skm/entry_templates',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_templates_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_templates_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_templates_get_data.save
    skm_entry_templates_own_el_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_OWN_EL_DA',:page_controller=>'skm/entry_templates',:page_action=>'get_owned_elements_data',:not_auto_mult=>true)
    skm_entry_templates_own_el_da.permissions_tls.build(:language=>'zh',:name=>'得到已有元素',:description=>'得到已有元素',:source_lang=>'en')
    skm_entry_templates_own_el_da.permissions_tls.build(:language=>'en',:name=>'Get Owned Elements',:description=>'Get Owned Elements',:source_lang=>'en')
    skm_entry_templates_own_el_da.save
    skm_entry_templates_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_INDEX',:page_controller=>'skm/entry_templates',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_templates_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_templates_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_templates_index.save
    skm_entry_templates_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_NEW',:page_controller=>'skm/entry_templates',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_templates_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_templates_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_templates_new.save
    skm_entry_templates_remove_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_REMOVE_ELE',:page_controller=>'skm/entry_templates',:page_action=>'remove_element',:not_auto_mult=>true)
    skm_entry_templates_remove_ele.permissions_tls.build(:language=>'zh',:name=>'移除元素',:description=>'移除元素',:source_lang=>'en')
    skm_entry_templates_remove_ele.permissions_tls.build(:language=>'en',:name=>'Remove Elements',:description=>'Remove Elements',:source_lang=>'en')
    skm_entry_templates_remove_ele.save
    skm_entry_templates_select_ele= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_SELECT_ELE',:page_controller=>'skm/entry_templates',:page_action=>'select_elements',:not_auto_mult=>true)
    skm_entry_templates_select_ele.permissions_tls.build(:language=>'zh',:name=>'选择元素',:description=>'选择元素',:source_lang=>'en')
    skm_entry_templates_select_ele.permissions_tls.build(:language=>'en',:name=>'Select Elements',:description=>'Select Elements',:source_lang=>'en')
    skm_entry_templates_select_ele.save
    skm_entry_templates_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_SHOW',:page_controller=>'skm/entry_templates',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_templates_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_templates_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_templates_show.save
    skm_entry_templates_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_UPDATE',:page_controller=>'skm/entry_templates',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_templates_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_templates_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_templates_update.save
    skm_entry_templates_up_element= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATES_UP_ELEMENT',:page_controller=>'skm/entry_templates',:page_action=>'up_element',:not_auto_mult=>true)
    skm_entry_templates_up_element.permissions_tls.build(:language=>'zh',:name=>'上移元素',:description=>'上移元素',:source_lang=>'en')
    skm_entry_templates_up_element.permissions_tls.build(:language=>'en',:name=>'Move Up',:description=>'Move Up',:source_lang=>'en')
    skm_entry_templates_up_element.save
    skm_entry_template_ele_create= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_CREATE',:page_controller=>'skm/entry_template_elements',:page_action=>'create',:not_auto_mult=>true)
    skm_entry_template_ele_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_template_ele_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_template_ele_create.save
    skm_entry_template_ele_edit= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_EDIT',:page_controller=>'skm/entry_template_elements',:page_action=>'edit',:not_auto_mult=>true)
    skm_entry_template_ele_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_template_ele_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_template_ele_edit.save
    skm_entry_template_ele_get_da= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_GET_DA',:page_controller=>'skm/entry_template_elements',:page_action=>'get_data',:not_auto_mult=>true)
    skm_entry_template_ele_get_da.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    skm_entry_template_ele_get_da.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    skm_entry_template_ele_get_da.save
    skm_entry_template_ele_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_INDEX',:page_controller=>'skm/entry_template_elements',:page_action=>'index',:not_auto_mult=>true)
    skm_entry_template_ele_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    skm_entry_template_ele_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    skm_entry_template_ele_index.save
    skm_entry_template_ele_new= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_NEW',:page_controller=>'skm/entry_template_elements',:page_action=>'new',:not_auto_mult=>true)
    skm_entry_template_ele_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    skm_entry_template_ele_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    skm_entry_template_ele_new.save
    skm_entry_template_ele_show= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_SHOW',:page_controller=>'skm/entry_template_elements',:page_action=>'show',:not_auto_mult=>true)
    skm_entry_template_ele_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    skm_entry_template_ele_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    skm_entry_template_ele_show.save
    skm_entry_template_ele_update= Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_UPDATE',:page_controller=>'skm/entry_template_elements',:page_action=>'update',:not_auto_mult=>true)
    skm_entry_template_ele_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    skm_entry_template_ele_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    skm_entry_template_ele_update.save

  end

  def self.down
  end
end
