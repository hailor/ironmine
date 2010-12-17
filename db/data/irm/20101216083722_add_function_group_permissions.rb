# -*- coding: utf-8 -*-
class AddFunctionGroupPermissions < ActiveRecord::Migration
  def self.up
    irm_function_groups_index = Irm::Permission.new(:permission_code=>'IRM_FUNCTION_GROUPS_INDEX',
                                             :page_controller=>'irm/function_groups',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_function_groups_index.permissions_tls.build(:language=>'zh',:name=>'功能组',:description=>'功能组',:source_lang=>'en')
    irm_function_groups_index.permissions_tls.build(:language=>'en',:name=>'Function Groups',:description=>'Function Groups',:source_lang=>'en')
    irm_function_groups_index.save

    irm_function_groups_edit = Irm::Permission.new(:permission_code=>'IRM_FUNCTION_GROUPS_EDIT',
                                             :page_controller=>'irm/function_groups',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_function_groups_edit.permissions_tls.build(:language=>'zh',:name=>'编辑功能组',:description=>'编辑功能组',:source_lang=>'en')
    irm_function_groups_edit.permissions_tls.build(:language=>'en',:name=>'Edit Function Group',:description=>'Edit Function Group',:source_lang=>'en')
    irm_function_groups_edit.save

    irm_function_groups_new = Irm::Permission.new(:permission_code=>'IRM_FUNCTION_GROUPS_NEW',
                                             :page_controller=>'irm/function_groups',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_function_groups_new.permissions_tls.build(:language=>'zh',:name=>'创建功能组',:description=>'创建功能组',:source_lang=>'en')
    irm_function_groups_new.permissions_tls.build(:language=>'en',:name=>'Create Function Group',:description=>'Create Function Group',:source_lang=>'en')
    irm_function_groups_new.save

    irm_function_groups_function_index = Irm::Permission.new(:permission_code=>'IRM_FUNCTION_GROUPS_FUN_IDX',
                                             :page_controller=>'irm/function_groups',
                                             :page_action=>'function_index',
                                             :not_auto_mult=>true)
    irm_function_groups_function_index.permissions_tls.build(:language=>'zh',:name=>'管理功能',:description=>'管理功能',:source_lang=>'en')
    irm_function_groups_function_index.permissions_tls.build(:language=>'en',:name=>'Manager Functions',:description=>'Manager Functions',:source_lang=>'en')
    irm_function_groups_function_index.save

    irm_function_groups_edit_own_functions = Irm::Permission.new(:permission_code=>'IRM_FUNCTION_GROUPS_ED_FUN',
                                             :page_controller=>'irm/function_groups',
                                             :page_action=>'edit_own_functions',
                                             :not_auto_mult=>true)
    irm_function_groups_edit_own_functions.permissions_tls.build(:language=>'zh',:name=>'添加移除功能',:description=>'添加移除功能',:source_lang=>'en')
    irm_function_groups_edit_own_functions.permissions_tls.build(:language=>'en',:name=>'Add or Remove Functions',:description=>'Add or Remove Functions',:source_lang=>'en')
    irm_function_groups_edit_own_functions.save
  end

  def self.down
  end
end
