# -*- coding: utf-8 -*-
class AddGroupAssignmentInitData < ActiveRecord::Migration
  def self.up
    #permissions
    icm_group_assignments_index= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_INDEX',:page_controller=>'icm/group_assignments',:page_action=>'index',:not_auto_mult=>true)
    icm_group_assignments_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_group_assignments_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_group_assignments_index.save
    icm_group_assignments_edit= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_EDIT',:page_controller=>'icm/group_assignments',:page_action=>'edit',:not_auto_mult=>true)
    icm_group_assignments_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_group_assignments_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_group_assignments_edit.save
    icm_group_assignments_update= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_UPDATE',:page_controller=>'icm/group_assignments',:page_action=>'update',:not_auto_mult=>true)
    icm_group_assignments_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    icm_group_assignments_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    icm_group_assignments_update.save
    icm_group_assignments_new= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_NEW',:page_controller=>'icm/group_assignments',:page_action=>'new',:not_auto_mult=>true)
    icm_group_assignments_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_group_assignments_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_group_assignments_new.save
    icm_group_assignments_create= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_CREATE',:page_controller=>'icm/group_assignments',:page_action=>'create',:not_auto_mult=>true)
    icm_group_assignments_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_group_assignments_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_group_assignments_create.save
    icm_group_assignments_desgroy= Irm::Permission.new(:permission_code=>'ICM_GROUP_ASSIGNMENTS_DESGROY',:page_controller=>'icm/group_assignments',:page_action=>'destroy',:not_auto_mult=>true)
    icm_group_assignments_desgroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    icm_group_assignments_desgroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    icm_group_assignments_desgroy.save

    #menu entry
    icm_menu_entry_91= Irm::MenuEntry.new(:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_GROUP_ASSIGNMENTS_INDEX',:display_sequence=>35,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'组指派规则',:description=>'组指派规则')
    icm_menu_entry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Support Group Assignment',:description=>'Support Group Assignment')
    icm_menu_entry_91.save

  end

  def self.down
  end
end
