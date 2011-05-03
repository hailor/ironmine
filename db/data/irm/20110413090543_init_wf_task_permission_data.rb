# -*- coding: utf-8 -*-
class InitWfTaskPermissionData < ActiveRecord::Migration
  def self.up
    irm_edit_wf_tasks= Irm::Function.new(:group_code=>'IRM_WF_EVENT',:function_code=>'EDIT_WF_EVENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事件',:description=>'编辑事件')
    irm_edit_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Event',:description=>'Edit Event')
    irm_edit_wf_tasks.save
    irm_create_wf_tasks= Irm::Function.new(:group_code=>'IRM_WF_EVENT',:function_code=>'CREATE_WF_EVENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建事件',:description=>'新建事件')
    irm_create_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Event',:description=>'New Event')
    irm_create_wf_tasks.save
    irm_view_wf_tasks= Irm::Function.new(:group_code=>'IRM_WF_EVENT',:function_code=>'VIEW_WF_EVENTS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_tasks.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事件',:description=>'事件')
    irm_view_wf_tasks.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Event',:description=>'View Event')
    irm_view_wf_tasks.save

    irm_menu_entiry_113= Irm::MenuEntry.new(:menu_code=>'IRM_HOME_MENU',:sub_menu_code=>nil,:page_controller=>'irm/todo_events',:display_sequence=>80,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_113.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事件',:description=>'事件')
    irm_menu_entiry_113.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Events',:description=>'Events')
    irm_menu_entiry_113.save
  end

  def self.down
  end
end
