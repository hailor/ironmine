# -*- coding: utf-8 -*-
class InitWfTaskPermissionData < ActiveRecord::Migration
  def self.up
    irm_edit_wf_tasks= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'EDIT_WF_TASKS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑任务',:description=>'编辑任务')
    irm_edit_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Task',:description=>'Edit Task')
    irm_edit_wf_tasks.save
    irm_create_wf_tasks= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'CREATE_WF_TASKS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建任务',:description=>'新建任务')
    irm_create_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Task',:description=>'New Task')
    irm_create_wf_tasks.save
    irm_view_wf_tasks= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'VIEW_WF_TASKS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_view_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Task',:description=>'View Task')
    irm_view_wf_tasks.save

    irm_menu_entiry_113= Irm::MenuEntry.new(:menu_code=>'IRM_HOME_MENU',:sub_menu_code=>nil,:page_controller=>'irm/wf_tasks',:display_sequence=>80,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_113.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_menu_entiry_113.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Tasks',:description=>'Workflow Tasks')
    irm_menu_entiry_113.save
  end

  def self.down
  end
end
