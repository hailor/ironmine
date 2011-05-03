# -*- coding: utf-8 -*-
class InitWfRuleFunction < ActiveRecord::Migration
  def self.up
    irm_irm_workflow= Irm::FunctionGroup.new(:group_code=>'IRM_WORKFLOW',:not_auto_mult=>true)
    irm_irm_workflow.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员-工作流',:description=>'开发人员-工作流')
    irm_irm_workflow.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer-Workflow',:description=>'Developer-Workflow')
    irm_irm_workflow.save

    irm_workflow_setting= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'WORKFLOW_SETTING',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_workflow_setting.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流设置',:description=>'工作流设置')
    irm_workflow_setting.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Setting',:description=>'Workflow Setting')
    irm_workflow_setting.save
    irm_view_wf_rules= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'VIEW_WF_RULES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_rules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'工作流规则',:description=>'工作流规则')
    irm_view_wf_rules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Rule',:description=>'Workflow Rule')
    irm_view_wf_rules.save
    irm_create_wf_rules= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'CREATE_WF_RULES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_rules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建工作流规则',:description=>'新建工作流规则')
    irm_create_wf_rules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Workflow Rule',:description=>'New Workflow Rule')
    irm_create_wf_rules.save
    irm_edit_wf_rules= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'EDIT_WF_RULES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_rules.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑工作流规则',:description=>'编辑工作流规则')
    irm_edit_wf_rules.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Workflow Rule',:description=>'Edit Workflow Rule')
    irm_edit_wf_rules.save
  end

  def self.down
  end
end
