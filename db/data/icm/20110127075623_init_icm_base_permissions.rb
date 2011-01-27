class InitIcmBasePermissions < ActiveRecord::Migration
  def self.up
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
  end

  def self.down
  end
end
