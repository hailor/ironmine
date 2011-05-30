# -*- coding: utf-8 -*-
class InitApprovalProcessMenuFunction < ActiveRecord::Migration
  def self.up
    irm_view_wf_approval_processes= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'VIEW_WF_APPROVAL_PROCESSES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_approval_processes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'审批流程',:description=>'审批流程')
    irm_view_wf_approval_processes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Approval process',:description=>'Approval process')
    irm_view_wf_approval_processes.save
    irm_create_wf_approval_processes= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'CREATE_WF_APPROVAL_PROCESSES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_approval_processes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建审批流程',:description=>'新建审批流程')
    irm_create_wf_approval_processes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create approval process',:description=>'Create approval process')
    irm_create_wf_approval_processes.save
    irm_edit_wf_approval_processes= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'EDIT_WF_APPROVAL_PROCESSES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_approval_processes.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑审批流程',:description=>'编辑审批流程')
    irm_edit_wf_approval_processes.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit approval process',:description=>'Edit approval process')
    irm_edit_wf_approval_processes.save

    irm_approval_process= Irm::Menu.new(:menu_code=>'APPROVAL_PROCESS',:leaf_flag=>'Y',:not_auto_mult=>true)
    irm_approval_process.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'审批流程',:description=>'审批流程')
    irm_approval_process.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Approval Process',:description=>'Approval Process')
    irm_approval_process.save

    irm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'WORKFLOW',:sub_menu_code=>'APPROVAL_PROCESS',:page_controller=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'审批流程',:description=>'审批流程')
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Approval Process',:description=>'Approval Process')
    irm_menu_entiry_44.save
    irm_menu_entiry_45= Irm::MenuEntry.new(:menu_code=>'APPROVAL_PROCESS',:sub_menu_code=>nil,:page_controller=>'irm/wf_approval_processes',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_45.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'审批流程',:description=>'审批流程')
    irm_menu_entiry_45.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Approval Process',:description=>'Approval Process')
    irm_menu_entiry_45.save
    irm_menu_entiry_46= Irm::MenuEntry.new(:menu_code=>'APPROVAL_PROCESS',:sub_menu_code=>nil,:page_controller=>'irm/wf_approval_steps',:display_sequence=>20,:display_flag=>'N',:not_auto_mult=>true)
    irm_menu_entiry_46.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'审批步骤',:description=>'审批步骤')
    irm_menu_entiry_46.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Approval step',:description=>'Approval step')
    irm_menu_entiry_46.save
  end

  def self.down
  end
end
