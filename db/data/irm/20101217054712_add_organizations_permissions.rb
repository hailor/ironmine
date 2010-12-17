class AddOrganizationsPermissions < ActiveRecord::Migration
  def self.up
    irm_organizations_index = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_INDEX',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_organizations_index.permissions_tls.build(:language=>'zh',:name=>'设置组织',:description=>'设置组织',:source_lang=>'en')
    irm_organizations_index.permissions_tls.build(:language=>'en',:name=>'Organization',:description=>'Organization',:source_lang=>'en')
    irm_organizations_index.save

    irm_organizations_new = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_NEW',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_organizations_new.permissions_tls.build(:language=>'zh',:name=>'新建组织',:description=>'新建组织',:source_lang=>'en')
    irm_organizations_new.permissions_tls.build(:language=>'en',:name=>'New Organization',:description=>'New Organization',:source_lang=>'en')
    irm_organizations_new.save

    irm_organizations_edit = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_EDIT',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_organizations_edit.permissions_tls.build(:language=>'zh',:name=>'编辑组织',:description=>'编辑组织',:source_lang=>'en')
    irm_organizations_edit.permissions_tls.build(:language=>'en',:name=>'Edit Organization',:description=>'Edit Organization',:source_lang=>'en')
    irm_organizations_edit.save

    irm_organizations_create = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_CREATE',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_organizations_create.permissions_tls.build(:language=>'zh',:name=>'保存组织',:description=>'保存组织',:source_lang=>'en')
    irm_organizations_create.permissions_tls.build(:language=>'en',:name=>'Create Organization',:description=>'Create Organization',:source_lang=>'en')
    irm_organizations_create.save

    irm_organizations_update = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_UPDATE',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_organizations_update.permissions_tls.build(:language=>'zh',:name=>'更新组织',:description=>'更新组织',:source_lang=>'en')
    irm_organizations_update.permissions_tls.build(:language=>'en',:name=>'Update Organization',:description=>'Update Organization',:source_lang=>'en')
    irm_organizations_update.save

    irm_organizations_lang_edit = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_LANG_EDIT',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_organizations_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑组织多语言',:description=>'编辑组织多语言',:source_lang=>'en')
    irm_organizations_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Organization Multilingual',:description=>'Edit Organization Multilingual',:source_lang=>'en')
    irm_organizations_lang_edit.save


    irm_organizations_lang_update = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_LANG_UPDATE',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_organizations_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新组织多语言',:description=>'更新组织多语言',:source_lang=>'en')
    irm_organizations_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Organization Multilingual',:description=>'Update Organization Multilingual',:source_lang=>'en')
    irm_organizations_lang_update.save

    irm_organizations_get_data = Irm::Permission.new(:permission_code=>'IRM_ORGANIZATIONS_GET_DATA',
                                                   :page_controller=>'irm/organizations',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_organizations_get_data.permissions_tls.build(:language=>'zh',:name=>'获取组织',:description=>'获取组织',:source_lang=>'en')
    irm_organizations_get_data.permissions_tls.build(:language=>'en',:name=>'Get Organization',:description=>'Get Organization',:source_lang=>'en')
    irm_organizations_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/organizations")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
