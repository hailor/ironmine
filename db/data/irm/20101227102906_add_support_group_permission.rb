# -*- coding: utf-8 -*-
class AddSupportGroupPermission < ActiveRecord::Migration
  def self.up

    irm_support_groups_index = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_INDEX',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_support_groups_index.permissions_tls.build(:language=>'zh',:name=>'设置支持组',:description=>'设置支持组',:source_lang=>'en')
    irm_support_groups_index.permissions_tls.build(:language=>'en',:name=>'Support Group',:description=>'Support Group',:source_lang=>'en')
    irm_support_groups_index.save

    irm_support_groups_new = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_NEW',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_support_groups_new.permissions_tls.build(:language=>'zh',:name=>'新建支持组',:description=>'新建支持组',:source_lang=>'en')
    irm_support_groups_new.permissions_tls.build(:language=>'en',:name=>'New Support Group',:description=>'New Support Group',:source_lang=>'en')
    irm_support_groups_new.save

    irm_support_groups_edit = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_EDIT',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_support_groups_edit.permissions_tls.build(:language=>'zh',:name=>'编辑支持组',:description=>'编辑支持组',:source_lang=>'en')
    irm_support_groups_edit.permissions_tls.build(:language=>'en',:name=>'Edit Support Group',:description=>'Edit Support Group',:source_lang=>'en')
    irm_support_groups_edit.save

    irm_support_groups_create = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_CREATE',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_support_groups_create.permissions_tls.build(:language=>'zh',:name=>'保存支持组',:description=>'保存支持组',:source_lang=>'en')
    irm_support_groups_create.permissions_tls.build(:language=>'en',:name=>'Create Support Group',:description=>'Create Support Group',:source_lang=>'en')
    irm_support_groups_create.save

    irm_support_groups_update = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_UPDATE',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_support_groups_update.permissions_tls.build(:language=>'zh',:name=>'更新支持组',:description=>'更新支持组',:source_lang=>'en')
    irm_support_groups_update.permissions_tls.build(:language=>'en',:name=>'Update Support Group',:description=>'Update Support Group',:source_lang=>'en')
    irm_support_groups_update.save

    irm_support_groups_get_data = Irm::Permission.new(:permission_code=>'IRM_SUPPORT_GROUP_GET_DATA',
                                                   :page_controller=>'irm/support_groups',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_support_groups_get_data.permissions_tls.build(:language=>'zh',:name=>'获取支持组',:description=>'获取支持组',:source_lang=>'en')
    irm_support_groups_get_data.permissions_tls.build(:language=>'en',:name=>'Get Support Group',:description=>'Get Support Group',:source_lang=>'en')
    irm_support_groups_get_data.save
  end

  def self.down
  end
end
