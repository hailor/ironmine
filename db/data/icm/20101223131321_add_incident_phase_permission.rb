# -*- coding: utf-8 -*-
class AddIncidentPhasePermission < ActiveRecord::Migration
  def self.up
    icm_incident_phases_index = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_INDEX',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_incident_phases_index.permissions_tls.build(:language=>'zh',:name=>'事故单阶段首页',:description=>'事故单阶段首页',:source_lang=>'en')
    icm_incident_phases_index.permissions_tls.build(:language=>'en',:name=>'Incident phase index',:description=>'Urgence code index',:source_lang=>'en')
    icm_incident_phases_index.save

    icm_incident_phases_show = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_SHOW',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_incident_phases_show.permissions_tls.build(:language=>'zh',:name=>'查看事故单阶段',:description=>'查看事故单阶段',:source_lang=>'en')
    icm_incident_phases_show.permissions_tls.build(:language=>'en',:name=>'View Incident phase',:description=>'View Incident phase',:source_lang=>'en')
    icm_incident_phases_show.save

    icm_incident_phases_new = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_NEW',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_incident_phases_new.permissions_tls.build(:language=>'zh',:name=>'新建事故单阶段',:description=>'新建事故单阶段',:source_lang=>'en')
    icm_incident_phases_new.permissions_tls.build(:language=>'en',:name=>'New Incident phase',:description=>'New Incident phase',:source_lang=>'en')
    icm_incident_phases_new.save

    icm_incident_phases_edit = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_EDIT',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_incident_phases_edit.permissions_tls.build(:language=>'zh',:name=>'编辑事故单阶段',:description=>'编辑事故单阶段',:source_lang=>'en')
    icm_incident_phases_edit.permissions_tls.build(:language=>'en',:name=>'Edit Incident phase',:description=>'Edit Incident phase',:source_lang=>'en')
    icm_incident_phases_edit.save

    icm_incident_phases_create = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_CREATE',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_phases_create.permissions_tls.build(:language=>'zh',:name=>'创建事故单阶段',:description=>'创建事故单阶段',:source_lang=>'en')
    icm_incident_phases_create.permissions_tls.build(:language=>'en',:name=>'Create incident phase',:description=>'Create incident phase',:source_lang=>'en')
    icm_incident_phases_create.save

    icm_incident_phases_update = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_UPDATE',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_phases_update.permissions_tls.build(:language=>'zh',:name=>'更新事故单阶段',:description=>'更新事故单阶段',:source_lang=>'en')
    icm_incident_phases_update.permissions_tls.build(:language=>'en',:name=>'Update incident phase',:description=>'Update incident phase',:source_lang=>'en')
    icm_incident_phases_update.save

    icm_incident_phases_destroy = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_DESTROY',
                                             :page_controller=>'icm/incident_phases',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_incident_phases_destroy.permissions_tls.build(:language=>'zh',:name=>'删除事故单阶段',:description=>'删除事故单阶段',:source_lang=>'en')
    icm_incident_phases_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy incident phase',:description=>'Destroy incident phase',:source_lang=>'en')
    icm_incident_phases_destroy.save

    icm_incident_phases_get_data = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_GET_DATA',
                                             :page_controller=>'icm/incident_phasess',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_phases_get_data.permissions_tls.build(:language=>'zh',:name=>'取得事故单阶段数据',:description=>'取得事故单阶段数据',:source_lang=>'en')
    icm_incident_phases_get_data.permissions_tls.build(:language=>'en',:name=>'Get incident phase data',:description=>'Get incident phase data',:source_lang=>'en')
    icm_incident_phases_get_data.save


    icm_incident_phases_lang_edit = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_PHASES_LANG_EDIT',
                                                   :page_controller=>'icm/incident_phasess',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_incident_phases_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑事故单阶段多语言',:description=>'编辑事故单阶段多语言',:source_lang=>'en')
    icm_incident_phases_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit incident phase Multilingual',:description=>'Edit incident phase Multilingual',:source_lang=>'en')
    icm_incident_phases_lang_edit.save


    icm_incident_phases_lang_update = Irm::Permission.new(:permission_code=>'ICM_INCDNT_PHASES_LANG_UPDATE',
                                                   :page_controller=>'icm/incident_phasess',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_incident_phases_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新事故单阶段多语言',:description=>'更新事故单阶段多语言',:source_lang=>'en')
    icm_incident_phases_lang_update.permissions_tls.build(:language=>'en',:name=>'Update incident phase Multilingual',:description=>'Update incident phase Multilingual',:source_lang=>'en')
    icm_incident_phases_lang_update.save


    icm_setting_close_reason = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_INCIDENT_PHASES_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    icm_setting_close_reason.menu_entries_tls.build(:language=>'zh',:name=>'事故单阶段',:description=>'事故单阶段',:source_lang=>'en')
    icm_setting_close_reason.menu_entries_tls.build(:language=>'en',:name=>'Incident phase',:description=>'Incident phase',:source_lang=>'en')
    icm_setting_close_reason.save
  end

  def self.down
  end
end
