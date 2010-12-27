# -*- coding: utf-8 -*-
class AddCloseReasonPermission < ActiveRecord::Migration
  def self.up
    icm_close_reasons_index = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_INDEX',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_close_reasons_index.permissions_tls.build(:language=>'zh',:name=>'关闭原因首页',:description=>'关闭原因首页',:source_lang=>'en')
    icm_close_reasons_index.permissions_tls.build(:language=>'en',:name=>'Close Reason index',:description=>'Urgence code index',:source_lang=>'en')
    icm_close_reasons_index.save

    icm_close_reasons_show = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_SHOW',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_close_reasons_show.permissions_tls.build(:language=>'zh',:name=>'查看关闭原因',:description=>'查看关闭原因',:source_lang=>'en')
    icm_close_reasons_show.permissions_tls.build(:language=>'en',:name=>'View Close Reason',:description=>'View Close Reason',:source_lang=>'en')
    icm_close_reasons_show.save

    icm_close_reasons_new = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_NEW',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_close_reasons_new.permissions_tls.build(:language=>'zh',:name=>'新建关闭原因',:description=>'新建关闭原因',:source_lang=>'en')
    icm_close_reasons_new.permissions_tls.build(:language=>'en',:name=>'New Close Reason',:description=>'New Close Reason',:source_lang=>'en')
    icm_close_reasons_new.save

    icm_close_reasons_edit = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_EDIT',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_close_reasons_edit.permissions_tls.build(:language=>'zh',:name=>'编辑关闭原因',:description=>'编辑关闭原因',:source_lang=>'en')
    icm_close_reasons_edit.permissions_tls.build(:language=>'en',:name=>'Edit Close Reason',:description=>'Edit Close Reason',:source_lang=>'en')
    icm_close_reasons_edit.save

    icm_close_reasons_create = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_CREATE',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_close_reasons_create.permissions_tls.build(:language=>'zh',:name=>'创建关闭原因',:description=>'创建关闭原因',:source_lang=>'en')
    icm_close_reasons_create.permissions_tls.build(:language=>'en',:name=>'Create close reason',:description=>'Create close reason',:source_lang=>'en')
    icm_close_reasons_create.save

    icm_close_reasons_update = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_UPDATE',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_close_reasons_update.permissions_tls.build(:language=>'zh',:name=>'更新关闭原因',:description=>'更新关闭原因',:source_lang=>'en')
    icm_close_reasons_update.permissions_tls.build(:language=>'en',:name=>'Update close reason',:description=>'Update close reason',:source_lang=>'en')
    icm_close_reasons_update.save

    icm_close_reasons_destroy = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_DESTROY',
                                             :page_controller=>'icm/close_reasons',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_close_reasons_destroy.permissions_tls.build(:language=>'zh',:name=>'删除关闭原因',:description=>'删除关闭原因',:source_lang=>'en')
    icm_close_reasons_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy close reason',:description=>'Destroy close reason',:source_lang=>'en')
    icm_close_reasons_destroy.save

    icm_close_reasons_get_data = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_GET_DATA',
                                             :page_controller=>'icm/close_reasonss',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_close_reasons_get_data.permissions_tls.build(:language=>'zh',:name=>'取得关闭原因数据',:description=>'取得关闭原因数据',:source_lang=>'en')
    icm_close_reasons_get_data.permissions_tls.build(:language=>'en',:name=>'Get close reason data',:description=>'Get close reason data',:source_lang=>'en')
    icm_close_reasons_get_data.save


    icm_close_reasons_lang_edit = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_LANG_EDIT',
                                                   :page_controller=>'icm/close_reasonss',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_close_reasons_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑关闭原因多语言',:description=>'编辑关闭原因多语言',:source_lang=>'en')
    icm_close_reasons_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit close reason Multilingual',:description=>'Edit close reason Multilingual',:source_lang=>'en')
    icm_close_reasons_lang_edit.save


    icm_close_reasons_lang_update = Irm::Permission.new(:permission_code=>'ICM_CLOSE_REASONS_LANG_UPDATE',
                                                   :page_controller=>'icm/close_reasonss',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_close_reasons_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新关闭原因多语言',:description=>'更新关闭原因多语言',:source_lang=>'en')
    icm_close_reasons_lang_update.permissions_tls.build(:language=>'en',:name=>'Update close reason Multilingual',:description=>'Update close reason Multilingual',:source_lang=>'en')
    icm_close_reasons_lang_update.save


    icm_setting_close_reason = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_CLOSE_REASONS_INDEX',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    icm_setting_close_reason.menu_entries_tls.build(:language=>'zh',:name=>'关闭原因',:description=>'关闭原因',:source_lang=>'en')
    icm_setting_close_reason.menu_entries_tls.build(:language=>'en',:name=>'Close Reason',:description=>'Close Reason',:source_lang=>'en')
    icm_setting_close_reason.save
  end

  def self.down
  end
end
