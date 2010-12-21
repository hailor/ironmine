# -*- coding: utf-8 -*-
class AddIcmRuleSettingPermission < ActiveRecord::Migration
  def self.up
    icm_rule_settings_index = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_INDEX',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    icm_rule_settings_index.permissions_tls.build(:language=>'zh',:name=>'规则设置首页',:description=>'规则设置首页',:source_lang=>'en')
    icm_rule_settings_index.permissions_tls.build(:language=>'en',:name=>'Rule setting index',:description=>'Rule setting index',:source_lang=>'en')
    icm_rule_settings_index.save

    icm_rule_settings_show = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_SHOW',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    icm_rule_settings_show.permissions_tls.build(:language=>'zh',:name=>'查看规则设置',:description=>'查看规则设置',:source_lang=>'en')
    icm_rule_settings_show.permissions_tls.build(:language=>'en',:name=>'View Rule setting',:description=>'View Rule setting',:source_lang=>'en')
    icm_rule_settings_show.save

    icm_rule_settings_new = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_NEW',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    icm_rule_settings_new.permissions_tls.build(:language=>'zh',:name=>'新建规则设置',:description=>'新建规则设置',:source_lang=>'en')
    icm_rule_settings_new.permissions_tls.build(:language=>'en',:name=>'New rule setting',:description=>'New rule setting',:source_lang=>'en')
    icm_rule_settings_new.save

    icm_rule_settings_edit = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_EDIT',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    icm_rule_settings_edit.permissions_tls.build(:language=>'zh',:name=>'编辑规则设置',:description=>'编辑规则设置',:source_lang=>'en')
    icm_rule_settings_edit.permissions_tls.build(:language=>'en',:name=>'Edit rule setting',:description=>'Edit rule setting',:source_lang=>'en')
    icm_rule_settings_edit.save

    icm_rule_settings_create = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_CREATE',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'create',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_rule_settings_create.permissions_tls.build(:language=>'zh',:name=>'创建规则设置',:description=>'创建规则设置',:source_lang=>'en')
    icm_rule_settings_create.permissions_tls.build(:language=>'en',:name=>'Create rule setting',:description=>'Create rule setting',:source_lang=>'en')
    icm_rule_settings_create.save

    icm_rule_settings_update = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_UPDATE',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'update',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_rule_settings_update.permissions_tls.build(:language=>'zh',:name=>'更新规则设置',:description=>'更新规则设置',:source_lang=>'en')
    icm_rule_settings_update.permissions_tls.build(:language=>'en',:name=>'Update rule setting',:description=>'Update rule setting',:source_lang=>'en')
    icm_rule_settings_update.save

    icm_rule_settings_destroy = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_DESTROY',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'destroy',
                                             :not_auto_mult=>true)
    icm_rule_settings_destroy.permissions_tls.build(:language=>'zh',:name=>'删除规则设置',:description=>'删除规则设置',:source_lang=>'en')
    icm_rule_settings_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy rule setting',:description=>'Destroy rule setting',:source_lang=>'en')
    icm_rule_settings_destroy.save

    icm_rule_settings_get_data = Irm::Permission.new(:permission_code=>'ICM_RULE_SETTINGS_GET_DATA',
                                             :page_controller=>'icm/rule_settings',
                                             :page_action=>'get_data',
                                             :status_code=>'OFFLINE',
                                             :not_auto_mult=>true)
    icm_rule_settings_get_data.permissions_tls.build(:language=>'zh',:name=>'取得Identity数据',:description=>'取得Identity数据',:source_lang=>'en')
    icm_rule_settings_get_data.permissions_tls.build(:language=>'en',:name=>'Get rule setting data',:description=>'Get rule setting data',:source_lang=>'en')
    icm_rule_settings_get_data.save
    
  end

  def self.down
  end
end
