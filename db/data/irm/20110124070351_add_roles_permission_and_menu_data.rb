# -*- coding: utf-8 -*-
class AddRolesPermissionAndMenuData < ActiveRecord::Migration
  def self.up
    irm_roles_index = Irm::Permission.new(:permission_code=>'IRM_ROLES_INDEX',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_roles_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'',:source_lang=>'en')
    irm_roles_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'',:source_lang=>'en')
    irm_roles_index.save

    irm_roles_edit = Irm::Permission.new(:permission_code=>'IRM_ROLES_EDIT',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_roles_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'',:source_lang=>'en')
    irm_roles_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'',:source_lang=>'en')
    irm_roles_edit.save

    irm_roles_new = Irm::Permission.new(:permission_code=>'IRM_ROLES_NEW',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_roles_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'',:source_lang=>'en')
    irm_roles_new.permissions_tls.build(:language=>'en',:name=>'Create',:description=>'',:source_lang=>'en')
    irm_roles_new.save

    irm_roles_update = Irm::Permission.new(:permission_code=>'IRM_ROLES_UPDATE',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'update',
                                             :not_auto_mult=>true)
    irm_roles_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'',:source_lang=>'en')
    irm_roles_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'',:source_lang=>'en')
    irm_roles_update.save

    irm_roles_create = Irm::Permission.new(:permission_code=>'IRM_ROLES_CREATE',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'create',
                                             :not_auto_mult=>true)
    irm_roles_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'',:source_lang=>'en')
    irm_roles_create.permissions_tls.build(:language=>'en',:name=>'Create',:description=>'',:source_lang=>'en')
    irm_roles_create.save
    

    irm_roles_show = Irm::Permission.new(:permission_code=>'IRM_ROLES_SHOW',
                                             :page_controller=>'irm/roles',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_roles_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'',:source_lang=>'en')
    irm_roles_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'',:source_lang=>'en')
    irm_roles_show.save

    role_permission = Irm::MenuEntry.new(:menu_code=>'IRM_PERMISSION_MENU',
                                         :permission_code=>'IRM_ROLES_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    role_permission.menu_entries_tls.build(:language=>'zh',:name=>'角色',:description=>'角色',:source_lang=>'en')
    role_permission.menu_entries_tls.build(:language=>'en',:name=>'Roles',:description=>'Roles',:source_lang=>'en')
    role_permission.save 
  end

  def self.down
  end
end
