# -*- coding: utf-8 -*-
class AddConditonsPermissions < ActiveRecord::Migration
  def self.up
    irm_conditions_index = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_INDEX',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_conditions_index.permissions_tls.build(:language=>'zh',:name=>'设置触发条件',:description=>'设置触发条件',:source_lang=>'en')
    irm_conditions_index.permissions_tls.build(:language=>'en',:name=>'Condition',:description=>'Condition',:source_lang=>'en')
    irm_conditions_index.save

    irm_conditions_new = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_NEW',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_conditions_new.permissions_tls.build(:language=>'zh',:name=>'新建触发条件',:description=>'新建触发条件',:source_lang=>'en')
    irm_conditions_new.permissions_tls.build(:language=>'en',:name=>'New Condition',:description=>'New Condition',:source_lang=>'en')
    irm_conditions_new.save

    irm_conditions_edit = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_EDIT',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_conditions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑触发条件',:description=>'编辑触发条件',:source_lang=>'en')
    irm_conditions_edit.permissions_tls.build(:language=>'en',:name=>'Edit Condition',:description=>'Edit Condition',:source_lang=>'en')
    irm_conditions_edit.save

    irm_conditions_create = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_CREATE',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_conditions_create.permissions_tls.build(:language=>'zh',:name=>'保存触发条件',:description=>'保存触发条件',:source_lang=>'en')
    irm_conditions_create.permissions_tls.build(:language=>'en',:name=>'Create Condition',:description=>'Create Condition',:source_lang=>'en')
    irm_conditions_create.save

    irm_conditions_update = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_UPDATE',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_conditions_update.permissions_tls.build(:language=>'zh',:name=>'更新触发条件',:description=>'更新触发条件',:source_lang=>'en')
    irm_conditions_update.permissions_tls.build(:language=>'en',:name=>'Update Condition',:description=>'Update Condition',:source_lang=>'en')
    irm_conditions_update.save

    irm_conditions_lang_edit = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_LANG_EDIT',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_conditions_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑触发条件多语言',:description=>'编辑触发条件多语言',:source_lang=>'en')
    irm_conditions_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Condition Multilingual',:description=>'Edit Condition Multilingual',:source_lang=>'en')
    irm_conditions_lang_edit.save


    irm_conditions_lang_update = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_LANG_UPDATE',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_conditions_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新触发条件多语言',:description=>'更新触发条件多语言',:source_lang=>'en')
    irm_conditions_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Condition Multilingual',:description=>'Update Condition Multilingual',:source_lang=>'en')
    irm_conditions_lang_update.save

    irm_conditions_get_data = Irm::Permission.new(:permission_code=>'IRM_CONDITIONS_GET_DATA',
                                                   :page_controller=>'irm/conditions',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_conditions_get_data.permissions_tls.build(:language=>'zh',:name=>'获取触发条件',:description=>'获取触发条件',:source_lang=>'en')
    irm_conditions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Condition',:description=>'Get Condition',:source_lang=>'en')
    irm_conditions_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/conditions")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
