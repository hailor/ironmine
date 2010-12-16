class AddPermissionPermissions < ActiveRecord::Migration
  def self.up
    irm_permissions_index = Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_INDEX',
                                             :page_controller=>'irm/permissions',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_permissions_index.permissions_tls.build(:language=>'zh',:name=>'权限',:description=>'权限',:source_lang=>'en')
    irm_permissions_index.permissions_tls.build(:language=>'en',:name=>'Permissions',:description=>'Permissions',:source_lang=>'en')
    irm_permissions_index.save

    irm_permissions_edit = Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_EDIT',
                                             :page_controller=>'irm/permissions',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_permissions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑权限',:description=>'编辑权限',:source_lang=>'en')
    irm_permissions_edit.permissions_tls.build(:language=>'en',:name=>'Edit Permission',:description=>'Edit Permission',:source_lang=>'en')
    irm_permissions_edit.save

    irm_permissions_new = Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_NEW',
                                             :page_controller=>'irm/permissions',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_permissions_new.permissions_tls.build(:language=>'zh',:name=>'创建权限',:description=>'创建权限',:source_lang=>'en')
    irm_permissions_new.permissions_tls.build(:language=>'en',:name=>'Create Permission',:description=>'Create Permission',:source_lang=>'en')
    irm_permissions_new.save 
  end

  def self.down
  end
end
