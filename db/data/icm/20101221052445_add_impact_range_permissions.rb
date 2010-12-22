# -*- coding: utf-8 -*-
class AddImpactRangePermissions < ActiveRecord::Migration
  def self.up
    icm_impact_ranges_index = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_INDEX',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_impact_ranges_index.permissions_tls.build(:language=>'zh',:name=>'影响度首页',:description=>'影响度首页',:source_lang=>'en')
    icm_impact_ranges_index.permissions_tls.build(:language=>'en',:name=>'Impact range index',:description=>'Impact range index',:source_lang=>'en')
    icm_impact_ranges_index.save

    icm_impact_ranges_show = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_SHOW',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_impact_ranges_show.permissions_tls.build(:language=>'zh',:name=>'查看影响度',:description=>'查看影响度',:source_lang=>'en')
    icm_impact_ranges_show.permissions_tls.build(:language=>'en',:name=>'View Impact range',:description=>'View Impact range',:source_lang=>'en')
    icm_impact_ranges_show.save

    icm_impact_ranges_new = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_NEW',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_impact_ranges_new.permissions_tls.build(:language=>'zh',:name=>'新建影响度',:description=>'新建影响度',:source_lang=>'en')
    icm_impact_ranges_new.permissions_tls.build(:language=>'en',:name=>'New Impact range',:description=>'New Impact range',:source_lang=>'en')
    icm_impact_ranges_new.save

    icm_impact_ranges_edit = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_EDIT',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_impact_ranges_edit.permissions_tls.build(:language=>'zh',:name=>'编辑影响度',:description=>'编辑影响度',:source_lang=>'en')
    icm_impact_ranges_edit.permissions_tls.build(:language=>'en',:name=>'Edit Impact range',:description=>'Edit Impact range',:source_lang=>'en')
    icm_impact_ranges_edit.save

    icm_impact_ranges_create = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_CREATE',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_impact_ranges_create.permissions_tls.build(:language=>'zh',:name=>'创建影响度',:description=>'创建影响度',:source_lang=>'en')
    icm_impact_ranges_create.permissions_tls.build(:language=>'en',:name=>'Create impact range',:description=>'Create impact range',:source_lang=>'en')
    icm_impact_ranges_create.save

    icm_impact_ranges_update = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_UPDATE',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_impact_ranges_update.permissions_tls.build(:language=>'zh',:name=>'更新影响度',:description=>'更新影响度',:source_lang=>'en')
    icm_impact_ranges_update.permissions_tls.build(:language=>'en',:name=>'Update impact range',:description=>'Update impact range',:source_lang=>'en')
    icm_impact_ranges_update.save

    icm_impact_ranges_destroy = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_DESTROY',
                                             :page_controller=>'icm/impact_ranges',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_impact_ranges_destroy.permissions_tls.build(:language=>'zh',:name=>'删除影响度',:description=>'删除影响度',:source_lang=>'en')
    icm_impact_ranges_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy impact range',:description=>'Destroy impact range',:source_lang=>'en')
    icm_impact_ranges_destroy.save

    icm_impact_ranges_get_data = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_GET_DATA',
                                             :page_controller=>'icm/impact_rangess',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_impact_ranges_get_data.permissions_tls.build(:language=>'zh',:name=>'取得影响度数据',:description=>'取得影响度数据',:source_lang=>'en')
    icm_impact_ranges_get_data.permissions_tls.build(:language=>'en',:name=>'Get impact range data',:description=>'Get impact range data',:source_lang=>'en')
    icm_impact_ranges_get_data.save
    
    
    icm_impact_ranges_lang_edit = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_LANG_EDIT',
                                                   :page_controller=>'icm/impact_rangess',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    icm_impact_ranges_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑影响度多语言',:description=>'编辑影响度多语言',:source_lang=>'en')
    icm_impact_ranges_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit impact range Multilingual',:description=>'Edit impact range Multilingual',:source_lang=>'en')
    icm_impact_ranges_lang_edit.save


    icm_impact_ranges_lang_update = Irm::Permission.new(:permission_code=>'ICM_IMPACT_RANGES_LANG_UPDATE',
                                                   :page_controller=>'icm/impact_rangess',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    icm_impact_ranges_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新影响度多语言',:description=>'更新影响度多语言',:source_lang=>'en')
    icm_impact_ranges_lang_update.permissions_tls.build(:language=>'en',:name=>'Update impact range Multilingual',:description=>'Update impact range Multilingual',:source_lang=>'en')
    icm_impact_ranges_lang_update.save
    
    
    icm_setting_impact_range = Irm::MenuEntry.new(:menu_code=>'IRM_ICM_SETTING_MENU',
                                         :permission_code=>'ICM_IMPACT_RANGES_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    icm_setting_impact_range.menu_entries_tls.build(:language=>'zh',:name=>'影响度',:description=>'影响度',:source_lang=>'en')
    icm_setting_impact_range.menu_entries_tls.build(:language=>'en',:name=>'Impact range',:description=>'Impact range',:source_lang=>'en')
    icm_setting_impact_range.save
  end

  def self.down
  end
end
