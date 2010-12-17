# -*- coding: utf-8 -*-
class AddFunctionPermissions < ActiveRecord::Migration
  def self.up
    irm_functions_index = Irm::Permission.new(:permission_code=>'IRM_FUNCTIONS_INDEX',
                                             :page_controller=>'irm/functions',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_functions_index.permissions_tls.build(:language=>'zh',:name=>'功能',:description=>'功能',:source_lang=>'en')
    irm_functions_index.permissions_tls.build(:language=>'en',:name=>'Functions',:description=>'Functions',:source_lang=>'en')
    irm_functions_index.save

    irm_functions_edit = Irm::Permission.new(:permission_code=>'IRM_FUNCTIONS_EDIT',
                                             :page_controller=>'irm/functions',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_functions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑功能',:description=>'编辑功能',:source_lang=>'en')
    irm_functions_edit.permissions_tls.build(:language=>'en',:name=>'Edit Function',:description=>'Edit Function',:source_lang=>'en')
    irm_functions_edit.save

    irm_functions_new = Irm::Permission.new(:permission_code=>'IRM_FUNCTIONS_NEW',
                                             :page_controller=>'irm/functions',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_functions_new.permissions_tls.build(:language=>'zh',:name=>'创建功能',:description=>'创建功能',:source_lang=>'en')
    irm_functions_new.permissions_tls.build(:language=>'en',:name=>'Create Function',:description=>'Create Function',:source_lang=>'en')
    irm_functions_new.save

    irm_functions_permission_index = Irm::Permission.new(:permission_code=>'IRM_FUNCTIONS_PER_INDEX',
                                             :page_controller=>'irm/functions',
                                             :page_action=>'permission_index',
                                             :not_auto_mult=>true)
    irm_functions_permission_index.permissions_tls.build(:language=>'zh',:name=>'管理权限',:description=>'管理权限',:source_lang=>'en')
    irm_functions_permission_index.permissions_tls.build(:language=>'en',:name=>'Manager Permissions',:description=>'Manager Permissions',:source_lang=>'en')
    irm_functions_permission_index.save

    irm_functions_edit_own_permissions = Irm::Permission.new(:permission_code=>'IRM_FUNCTIONS_EDIT_OWN_PER',
                                             :page_controller=>'irm/functions',
                                             :page_action=>'edit_own_permissions',
                                             :not_auto_mult=>true)
    irm_functions_edit_own_permissions.permissions_tls.build(:language=>'zh',:name=>'添加移除权限',:description=>'添加移除权限',:source_lang=>'en')
    irm_functions_edit_own_permissions.permissions_tls.build(:language=>'en',:name=>'Add or Remove Permissions',:description=>'Add or Remove Permissions',:source_lang=>'en')
    irm_functions_edit_own_permissions.save
  end

  def self.down
  end
end
