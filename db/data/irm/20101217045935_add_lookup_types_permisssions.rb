class AddLookupTypesPermisssions < ActiveRecord::Migration
  def self.up
    irm_lookup_types_index = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_INDEX',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_lookup_types_index.permissions_tls.build(:language=>'zh',:name=>'设置快速编码',:description=>'设置快速编码',:source_lang=>'en')
    irm_lookup_types_index.permissions_tls.build(:language=>'en',:name=>'Lookup Type',:description=>'Lookup Type',:source_lang=>'en')
    irm_lookup_types_index.save

    irm_lookup_types_new = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_NEW',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_lookup_types_new.permissions_tls.build(:language=>'zh',:name=>'新建快速编码',:description=>'新建快速编码',:source_lang=>'en')
    irm_lookup_types_new.permissions_tls.build(:language=>'en',:name=>'New Lookup Type',:description=>'New Lookup Type',:source_lang=>'en')
    irm_lookup_types_new.save

    irm_lookup_types_edit = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_EDIT',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_lookup_types_edit.permissions_tls.build(:language=>'zh',:name=>'编辑快速编码',:description=>'编辑快速编码',:source_lang=>'en')
    irm_lookup_types_edit.permissions_tls.build(:language=>'en',:name=>'Edit Lookup Type',:description=>'Edit Lookup Type',:source_lang=>'en')
    irm_lookup_types_edit.save

    irm_lookup_types_create = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CREATE',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_lookup_types_create.permissions_tls.build(:language=>'zh',:name=>'保存快速编码',:description=>'保存快速编码',:source_lang=>'en')
    irm_lookup_types_create.permissions_tls.build(:language=>'en',:name=>'Create Lookup Type',:description=>'Create Lookup Type',:source_lang=>'en')
    irm_lookup_types_create.save

    irm_lookup_types_update = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_UPDATE',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_lookup_types_update.permissions_tls.build(:language=>'zh',:name=>'更新快速编码',:description=>'更新快速编码',:source_lang=>'en')
    irm_lookup_types_update.permissions_tls.build(:language=>'en',:name=>'Update Lookup Type',:description=>'Update Lookup Type',:source_lang=>'en')
    irm_lookup_types_update.save

    irm_lookup_types_get_lookup_types = Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_GET_TYPES',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'get_lookup_types',
                                                   :not_auto_mult=>true)
    irm_lookup_types_get_lookup_types.permissions_tls.build(:language=>'zh',:name=>'获取快速编码',:description=>'获取快速编码',:source_lang=>'en')
    irm_lookup_types_get_lookup_types.permissions_tls.build(:language=>'en',:name=>'Get Lookup Type',:description=>'Get Lookup Type',:source_lang=>'en')
    irm_lookup_types_get_lookup_types.save

    irm_lookup_types_get_lookup_values= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_GET_VALUES',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'get_lookup_values',
                                                   :not_auto_mult=>true)
    irm_lookup_types_get_lookup_values.permissions_tls.build(:language=>'zh',:name=>'获快速编码值',:description=>'获取快速编码值',:source_lang=>'en')
    irm_lookup_types_get_lookup_values.permissions_tls.build(:language=>'en',:name=>'Get Lookup Value',:description=>'Get Lookup Value',:source_lang=>'en')
    irm_lookup_types_get_lookup_values.save


    irm_lookup_types_create_edit_value= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_CREATE_VALUE',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'create_edit_value',
                                                   :not_auto_mult=>true)
    irm_lookup_types_create_edit_value.permissions_tls.build(:language=>'zh',:name=>'创建快速编码值',:description=>'创建快速编码值',:source_lang=>'en')
    irm_lookup_types_create_edit_value.permissions_tls.build(:language=>'en',:name=>'Create Lookup Value',:description=>'Create Lookup Value',:source_lang=>'en')
    irm_lookup_types_create_edit_value.save

    irm_lookup_types_add_code= Irm::Permission.new(:permission_code=>'IRM_LOOKUP_TYPES_ADD_CODE',
                                                   :page_controller=>'irm/lookup_types',
                                                   :page_action=>'add_code',
                                                   :not_auto_mult=>true)
    irm_lookup_types_add_code.permissions_tls.build(:language=>'zh',:name=>'添加快速编码值',:description=>'添加快速编码值',:source_lang=>'en')
    irm_lookup_types_add_code.permissions_tls.build(:language=>'en',:name=>'Add Lookup Value',:description=>'Add Lookup Value',:source_lang=>'en')
    irm_lookup_types_add_code.save

  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/lookup_types")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
