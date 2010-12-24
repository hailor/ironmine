# -*- coding: utf-8 -*-
class AddIncidentStatusPermission < ActiveRecord::Migration
  def self.up
    icm_incident_statuses_index = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_INDEX',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_incident_statuses_index.permissions_tls.build(:language=>'zh',:name=>'事故单状态首页',:description=>'事故单状态首页',:source_lang=>'en')
    icm_incident_statuses_index.permissions_tls.build(:language=>'en',:name=>'Incident status index',:description=>'Urgence code index',:source_lang=>'en')
    icm_incident_statuses_index.save

    icm_incident_statuses_show = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_SHOW',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_incident_statuses_show.permissions_tls.build(:language=>'zh',:name=>'查看事故单状态',:description=>'查看事故单状态',:source_lang=>'en')
    icm_incident_statuses_show.permissions_tls.build(:language=>'en',:name=>'View Incident status',:description=>'View Incident status',:source_lang=>'en')
    icm_incident_statuses_show.save

    icm_incident_statuses_new = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_NEW',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_incident_statuses_new.permissions_tls.build(:language=>'zh',:name=>'新建事故单状态',:description=>'新建事故单状态',:source_lang=>'en')
    icm_incident_statuses_new.permissions_tls.build(:language=>'en',:name=>'New Incident status',:description=>'New Incident status',:source_lang=>'en')
    icm_incident_statuses_new.save

    icm_incident_statuses_edit = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_EDIT',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_incident_statuses_edit.permissions_tls.build(:language=>'zh',:name=>'编辑事故单状态',:description=>'编辑事故单状态',:source_lang=>'en')
    icm_incident_statuses_edit.permissions_tls.build(:language=>'en',:name=>'Edit Incident status',:description=>'Edit Incident status',:source_lang=>'en')
    icm_incident_statuses_edit.save

    icm_incident_statuses_create = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_CREATE',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_statuses_create.permissions_tls.build(:language=>'zh',:name=>'创建事故单状态',:description=>'创建事故单状态',:source_lang=>'en')
    icm_incident_statuses_create.permissions_tls.build(:language=>'en',:name=>'Create incident status',:description=>'Create incident status',:source_lang=>'en')
    icm_incident_statuses_create.save

    icm_incident_statuses_update = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_UPDATE',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_statuses_update.permissions_tls.build(:language=>'zh',:name=>'更新事故单状态',:description=>'更新事故单状态',:source_lang=>'en')
    icm_incident_statuses_update.permissions_tls.build(:language=>'en',:name=>'Update incident status',:description=>'Update incident status',:source_lang=>'en')
    icm_incident_statuses_update.save

    icm_incident_statuses_destroy = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_DESTROY',
                                             :page_controller=>'icm/incident_statuses',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_incident_statuses_destroy.permissions_tls.build(:language=>'zh',:name=>'删除事故单状态',:description=>'删除事故单状态',:source_lang=>'en')
    icm_incident_statuses_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy incident status',:description=>'Destroy incident status',:source_lang=>'en')
    icm_incident_statuses_destroy.save

    icm_incident_statuses_get_data = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STATUSES_GET_DATA',
                                             :page_controller=>'icm/incident_statusess',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_incident_statuses_get_data.permissions_tls.build(:language=>'zh',:name=>'取得事故单状态数据',:description=>'取得事故单状态数据',:source_lang=>'en')
    icm_incident_statuses_get_data.permissions_tls.build(:language=>'en',:name=>'Get incident status data',:description=>'Get incident status data',:source_lang=>'en')
    icm_incident_statuses_get_data.save


    icm_incident_statuses_lang_edit = Irm::Permission.new(:permission_code=>'ICM_INCDT_STATUSES_LANG_EDIT',
                                                   :page_controller=>'icm/incident_statusess',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_incident_statuses_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑事故单状态多语言',:description=>'编辑事故单状态多语言',:source_lang=>'en')
    icm_incident_statuses_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit incident status Multilingual',:description=>'Edit incident status Multilingual',:source_lang=>'en')
    icm_incident_statuses_lang_edit.save


    icm_incident_statuses_lang_update = Irm::Permission.new(:permission_code=>'ICM_INCDT_STATUSES_LANG_UPDATE',
                                                   :page_controller=>'icm/incident_statusess',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_incident_statuses_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新事故单状态多语言',:description=>'更新事故单状态多语言',:source_lang=>'en')
    icm_incident_statuses_lang_update.permissions_tls.build(:language=>'en',:name=>'Update incident status Multilingual',:description=>'Update incident status Multilingual',:source_lang=>'en')
    icm_incident_statuses_lang_update.save


    icm_setting_close_reason = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_INCIDENT_STATUSES_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    icm_setting_close_reason.menu_entries_tls.build(:language=>'zh',:name=>'事故单状态',:description=>'事故单状态',:source_lang=>'en')
    icm_setting_close_reason.menu_entries_tls.build(:language=>'en',:name=>'Incident status',:description=>'Incident status',:source_lang=>'en')
    icm_setting_close_reason.save
  end

  def self.down
  end
end
