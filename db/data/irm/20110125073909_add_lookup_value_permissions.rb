# -*- coding: utf-8 -*-
class AddLookupValuePermissions < ActiveRecord::Migration
  def self.up
    irm_lookup_values_index = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_INDEX',
                                                   :page_controller=>'irm/lookup_values',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_lookup_values_index.permissions_tls.build(:language=>'zh',:name=>'设置快速编码值',:description=>'设置快速编码值',:source_lang=>'en')
    irm_lookup_values_index.permissions_tls.build(:language=>'en',:name=>'Lookup Value',:description=>'Lookup Value',:source_lang=>'en')
    irm_lookup_values_index.save

    irm_lookup_values_new = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_NEW',
                                                   :page_controller=>'irm/lookup_values',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_lookup_values_new.permissions_tls.build(:language=>'zh',:name=>'新建快速编码值',:description=>'新建快速编码值',:source_lang=>'en')
    irm_lookup_values_new.permissions_tls.build(:language=>'en',:name=>'New Lookup Value',:description=>'New Lookup Value',:source_lang=>'en')
    irm_lookup_values_new.save

    irm_lookup_values_edit = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_EDIT',
                                                   :page_controller=>'irm/lookup_values',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_lookup_values_edit.permissions_tls.build(:language=>'zh',:name=>'编辑快速编码值',:description=>'编辑快速编码值',:source_lang=>'en')
    irm_lookup_values_edit.permissions_tls.build(:language=>'en',:name=>'Edit Lookup Value',:description=>'Edit Lookup Value',:source_lang=>'en')
    irm_lookup_values_edit.save

    irm_lookup_values_create = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_CREATE',
                                                   :page_controller=>'irm/lookup_values',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_lookup_values_create.permissions_tls.build(:language=>'zh',:name=>'保存快速编码值',:description=>'保存快速编码值',:source_lang=>'en')
    irm_lookup_values_create.permissions_tls.build(:language=>'en',:name=>'Create Lookup Value',:description=>'Create Lookup Value',:source_lang=>'en')
    irm_lookup_values_create.save

    irm_lookup_values_update = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_VALUES_UPDATE',
                                                   :page_controller=>'irm/lookup_values',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_lookup_values_update.permissions_tls.build(:language=>'zh',:name=>'更新快速编码值',:description=>'更新快速编码值',:source_lang=>'en')
    irm_lookup_values_update.permissions_tls.build(:language=>'en',:name=>'Update Lookup Value',:description=>'Update Lookup Value',:source_lang=>'en')
    irm_lookup_values_update.save   
  end

  def self.down
    #
    lookup_values_permissions=Irm::Permission.query_by_page_controller("irm/lookup_values")
    lookup_values_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end    
  end
end
