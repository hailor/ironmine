# -*- coding: utf-8 -*-
class AddUrgenceCodePermission < ActiveRecord::Migration
  def self.up
    icm_urgence_codes_index = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_INDEX',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_urgence_codes_index.permissions_tls.build(:language=>'zh',:name=>'紧急度首页',:description=>'紧急度首页',:source_lang=>'en')
    icm_urgence_codes_index.permissions_tls.build(:language=>'en',:name=>'Urgence code index',:description=>'Urgence code index',:source_lang=>'en')
    icm_urgence_codes_index.save

    icm_urgence_codes_show = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_SHOW',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_urgence_codes_show.permissions_tls.build(:language=>'zh',:name=>'查看紧急度',:description=>'查看紧急度',:source_lang=>'en')
    icm_urgence_codes_show.permissions_tls.build(:language=>'en',:name=>'View Urgence code',:description=>'View Urgence code',:source_lang=>'en')
    icm_urgence_codes_show.save

    icm_urgence_codes_new = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_NEW',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_urgence_codes_new.permissions_tls.build(:language=>'zh',:name=>'新建紧急度',:description=>'新建紧急度',:source_lang=>'en')
    icm_urgence_codes_new.permissions_tls.build(:language=>'en',:name=>'New Urgence code',:description=>'New Urgence code',:source_lang=>'en')
    icm_urgence_codes_new.save

    icm_urgence_codes_edit = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_EDIT',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_urgence_codes_edit.permissions_tls.build(:language=>'zh',:name=>'编辑紧急度',:description=>'编辑紧急度',:source_lang=>'en')
    icm_urgence_codes_edit.permissions_tls.build(:language=>'en',:name=>'Edit Urgence code',:description=>'Edit Urgence code',:source_lang=>'en')
    icm_urgence_codes_edit.save

    icm_urgence_codes_create = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_CREATE',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_urgence_codes_create.permissions_tls.build(:language=>'zh',:name=>'创建紧急度',:description=>'创建紧急度',:source_lang=>'en')
    icm_urgence_codes_create.permissions_tls.build(:language=>'en',:name=>'Create urgence code',:description=>'Create urgence code',:source_lang=>'en')
    icm_urgence_codes_create.save

    icm_urgence_codes_update = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_UPDATE',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_urgence_codes_update.permissions_tls.build(:language=>'zh',:name=>'更新紧急度',:description=>'更新紧急度',:source_lang=>'en')
    icm_urgence_codes_update.permissions_tls.build(:language=>'en',:name=>'Update urgence code',:description=>'Update urgence code',:source_lang=>'en')
    icm_urgence_codes_update.save

    icm_urgence_codes_destroy = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_DESTROY',
                                             :page_controller=>'icm/urgence_codes',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_urgence_codes_destroy.permissions_tls.build(:language=>'zh',:name=>'删除紧急度',:description=>'删除紧急度',:source_lang=>'en')
    icm_urgence_codes_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy urgence code',:description=>'Destroy urgence code',:source_lang=>'en')
    icm_urgence_codes_destroy.save

    icm_urgence_codes_get_data = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_GET_DATA',
                                             :page_controller=>'icm/urgence_codess',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_urgence_codes_get_data.permissions_tls.build(:language=>'zh',:name=>'取得紧急度数据',:description=>'取得紧急度数据',:source_lang=>'en')
    icm_urgence_codes_get_data.permissions_tls.build(:language=>'en',:name=>'Get urgence code data',:description=>'Get urgence code data',:source_lang=>'en')
    icm_urgence_codes_get_data.save


    icm_urgence_codes_lang_edit = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_LANG_EDIT',
                                                   :page_controller=>'icm/urgence_codess',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_urgence_codes_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑紧急度多语言',:description=>'编辑紧急度多语言',:source_lang=>'en')
    icm_urgence_codes_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit urgence code Multilingual',:description=>'Edit urgence code Multilingual',:source_lang=>'en')
    icm_urgence_codes_lang_edit.save


    icm_urgence_codes_lang_update = Irm::Permission.new(:permission_code=>'ICM_URGENCE_CODES_LANG_UPDATE',
                                                   :page_controller=>'icm/urgence_codess',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_urgence_codes_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新紧急度多语言',:description=>'更新紧急度多语言',:source_lang=>'en')
    icm_urgence_codes_lang_update.permissions_tls.build(:language=>'en',:name=>'Update urgence code Multilingual',:description=>'Update urgence code Multilingual',:source_lang=>'en')
    icm_urgence_codes_lang_update.save


    icm_setting_impact_range = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_URGENCE_CODES_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    icm_setting_impact_range.menu_entries_tls.build(:language=>'zh',:name=>'紧急度',:description=>'紧急度',:source_lang=>'en')
    icm_setting_impact_range.menu_entries_tls.build(:language=>'en',:name=>'Urgence code',:description=>'Urgence code',:source_lang=>'en')
    icm_setting_impact_range.save
  end

  def self.down
  end
end
