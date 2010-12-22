# -*- coding: utf-8 -*-
class AddPriorityCodesPermissions < ActiveRecord::Migration
  def self.up
    icm_priority_codes_index = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_INDEX',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_priority_codes_index.permissions_tls.build(:language=>'zh',:name=>'优先级首页',:description=>'优先级首页',:source_lang=>'en')
    icm_priority_codes_index.permissions_tls.build(:language=>'en',:name=>'Priority code index',:description=>'Urgence code index',:source_lang=>'en')
    icm_priority_codes_index.save

    icm_priority_codes_show = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_SHOW',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_priority_codes_show.permissions_tls.build(:language=>'zh',:name=>'查看优先级',:description=>'查看优先级',:source_lang=>'en')
    icm_priority_codes_show.permissions_tls.build(:language=>'en',:name=>'View Priority code',:description=>'View Priority code',:source_lang=>'en')
    icm_priority_codes_show.save

    icm_priority_codes_new = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_NEW',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_priority_codes_new.permissions_tls.build(:language=>'zh',:name=>'新建优先级',:description=>'新建优先级',:source_lang=>'en')
    icm_priority_codes_new.permissions_tls.build(:language=>'en',:name=>'New Priority code',:description=>'New Priority code',:source_lang=>'en')
    icm_priority_codes_new.save

    icm_priority_codes_edit = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_EDIT',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_priority_codes_edit.permissions_tls.build(:language=>'zh',:name=>'编辑优先级',:description=>'编辑优先级',:source_lang=>'en')
    icm_priority_codes_edit.permissions_tls.build(:language=>'en',:name=>'Edit Priority code',:description=>'Edit Priority code',:source_lang=>'en')
    icm_priority_codes_edit.save

    icm_priority_codes_create = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_CREATE',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_priority_codes_create.permissions_tls.build(:language=>'zh',:name=>'创建优先级',:description=>'创建优先级',:source_lang=>'en')
    icm_priority_codes_create.permissions_tls.build(:language=>'en',:name=>'Create priority code',:description=>'Create priority code',:source_lang=>'en')
    icm_priority_codes_create.save

    icm_priority_codes_update = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_UPDATE',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_priority_codes_update.permissions_tls.build(:language=>'zh',:name=>'更新优先级',:description=>'更新优先级',:source_lang=>'en')
    icm_priority_codes_update.permissions_tls.build(:language=>'en',:name=>'Update priority code',:description=>'Update priority code',:source_lang=>'en')
    icm_priority_codes_update.save

    icm_priority_codes_destroy = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_DESTROY',
                                             :page_controller=>'icm/priority_codes',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_priority_codes_destroy.permissions_tls.build(:language=>'zh',:name=>'删除优先级',:description=>'删除优先级',:source_lang=>'en')
    icm_priority_codes_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy priority code',:description=>'Destroy priority code',:source_lang=>'en')
    icm_priority_codes_destroy.save

    icm_priority_codes_get_data = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_GET_DATA',
                                             :page_controller=>'icm/priority_codess',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_priority_codes_get_data.permissions_tls.build(:language=>'zh',:name=>'取得优先级数据',:description=>'取得优先级数据',:source_lang=>'en')
    icm_priority_codes_get_data.permissions_tls.build(:language=>'en',:name=>'Get priority code data',:description=>'Get priority code data',:source_lang=>'en')
    icm_priority_codes_get_data.save


    icm_priority_codes_lang_edit = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_LANG_EDIT',
                                                   :page_controller=>'icm/priority_codess',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_priority_codes_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑优先级多语言',:description=>'编辑优先级多语言',:source_lang=>'en')
    icm_priority_codes_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit priority code Multilingual',:description=>'Edit priority code Multilingual',:source_lang=>'en')
    icm_priority_codes_lang_edit.save


    icm_priority_codes_lang_update = Irm::Permission.new(:permission_code=>'ICM_PRIORITY_CODES_LANG_UPDATE',
                                                   :page_controller=>'icm/priority_codess',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_priority_codes_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新优先级多语言',:description=>'更新优先级多语言',:source_lang=>'en')
    icm_priority_codes_lang_update.permissions_tls.build(:language=>'en',:name=>'Update priority code Multilingual',:description=>'Update priority code Multilingual',:source_lang=>'en')
    icm_priority_codes_lang_update.save


    icm_setting_priority_code = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_PRIORITY_CODES_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    icm_setting_priority_code.menu_entries_tls.build(:language=>'zh',:name=>'优先级',:description=>'优先级',:source_lang=>'en')
    icm_setting_priority_code.menu_entries_tls.build(:language=>'en',:name=>'Priority code',:description=>'Priority code',:source_lang=>'en')
    icm_setting_priority_code.save
  end

  def self.down
  end
end
