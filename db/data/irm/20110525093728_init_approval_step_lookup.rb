# -*- coding: utf-8 -*-
class InitApprovalStepLookup < ActiveRecord::Migration
  def self.up
    wf_step_evaluate_resutl=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_STEP_EVALUATE_RESUTL',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_evaluate_resutl.lookup_types_tls.build(:lookup_type_id=>wf_step_evaluate_resutl.id,:meaning=>'审批步骤条件审批模式',:description=>'审批步骤条件审批模式',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutl.lookup_types_tls.build(:lookup_type_id=>wf_step_evaluate_resutl.id,:meaning=>'Process step evaluate result',:description=>'Process step evaluate result',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutl.save
    wf_step_approver_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_STEP_APPROVER_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_approver_type.lookup_types_tls.build(:lookup_type_id=>wf_step_approver_type.id,:meaning=>'审批步骤审批人类型',:description=>'审批步骤审批人类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_type.lookup_types_tls.build(:lookup_type_id=>wf_step_approver_type.id,:meaning=>'Process step approver type',:description=>'Process step approver type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_type.save
    wf_step_mulit_approver_mode=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_STEP_MULIT_APPROVER_MODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_mulit_approver_mode.lookup_types_tls.build(:lookup_type_id=>wf_step_mulit_approver_mode.id,:meaning=>'审批步骤多审批人审批模式',:description=>'审批步骤多审批人审批模式',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_mode.lookup_types_tls.build(:lookup_type_id=>wf_step_mulit_approver_mode.id,:meaning=>'Process step multiple approver mode',:description=>'Process step multiple approver mode',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_mode.save
    wf_step_reject_mode=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_STEP_REJECT_MODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_reject_mode.lookup_types_tls.build(:lookup_type_id=>wf_step_reject_mode.id,:meaning=>'审批步骤拒绝操作',:description=>'审批步骤拒绝操作',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_mode.lookup_types_tls.build(:lookup_type_id=>wf_step_reject_mode.id,:meaning=>'Process step reject operation',:description=>'Process step reject operation',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_mode.save

    wf_step_evaluate_resutlapproval= Irm::LookupValue.new(:lookup_type=>'WF_STEP_EVALUATE_RESUTL',:lookup_code=>'APPROVAL',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_evaluate_resutlapproval.lookup_values_tls.build(:lookup_value_id=>wf_step_evaluate_resutlapproval.id,:meaning=>'审批通过',:description=>'审批通过',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutlapproval.lookup_values_tls.build(:lookup_value_id=>wf_step_evaluate_resutlapproval.id,:meaning=>'Approval',:description=>'Approval',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutlapproval.save
    wf_step_evaluate_resutlreject= Irm::LookupValue.new(:lookup_type=>'WF_STEP_EVALUATE_RESUTL',:lookup_code=>'REJECT',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_evaluate_resutlreject.lookup_values_tls.build(:lookup_value_id=>wf_step_evaluate_resutlreject.id,:meaning=>'审批拒绝',:description=>'审批拒绝',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutlreject.lookup_values_tls.build(:lookup_value_id=>wf_step_evaluate_resutlreject.id,:meaning=>'Reject',:description=>'Reject',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_evaluate_resutlreject.save
    wf_step_approver_typeselect_by_sumbitter= Irm::LookupValue.new(:lookup_type=>'WF_STEP_APPROVER_TYPE',:lookup_code=>'SELECT_BY_SUMBITTER',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_approver_typeselect_by_sumbitter.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeselect_by_sumbitter.id,:meaning=>'允许提交人手动选择批准人',:description=>'允许提交人手动选择批准人',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeselect_by_sumbitter.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeselect_by_sumbitter.id,:meaning=>'Mannual select approver',:description=>'Mannual select approver',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeselect_by_sumbitter.save
    wf_step_approver_typeprocess_default= Irm::LookupValue.new(:lookup_type=>'WF_STEP_APPROVER_TYPE',:lookup_code=>'PROCESS_DEFAULT',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_approver_typeprocess_default.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeprocess_default.id,:meaning=>'使用前一个审批人的用户字段自动分配',:description=>'使用前一个审批人的用户字段自动分配',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeprocess_default.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeprocess_default.id,:meaning=>'Last approver person field',:description=>'Last approver person field',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeprocess_default.save
    wf_step_approver_typeauto_approver= Irm::LookupValue.new(:lookup_type=>'WF_STEP_APPROVER_TYPE',:lookup_code=>'AUTO_APPROVER',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_approver_typeauto_approver.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeauto_approver.id,:meaning=>'自动分配至审批人',:description=>'自动分配至审批人',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeauto_approver.lookup_values_tls.build(:lookup_value_id=>wf_step_approver_typeauto_approver.id,:meaning=>'Auto assign to approver',:description=>'Auto assign to approver',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_approver_typeauto_approver.save
    wf_step_mulit_approver_modefirst_approved= Irm::LookupValue.new(:lookup_type=>'WF_STEP_MULIT_APPROVER_MODE',:lookup_code=>'FIRST_APPROVED',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_mulit_approver_modefirst_approved.lookup_values_tls.build(:lookup_value_id=>wf_step_mulit_approver_modefirst_approved.id,:meaning=>'基于首次审批结果',:description=>'基于首次审批结果',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_modefirst_approved.lookup_values_tls.build(:lookup_value_id=>wf_step_mulit_approver_modefirst_approved.id,:meaning=>'First approv  result',:description=>'First approv  result',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_modefirst_approved.save
    wf_step_mulit_approver_modeall_approved= Irm::LookupValue.new(:lookup_type=>'WF_STEP_MULIT_APPROVER_MODE',:lookup_code=>'ALL_APPROVED',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_mulit_approver_modeall_approved.lookup_values_tls.build(:lookup_value_id=>wf_step_mulit_approver_modeall_approved.id,:meaning=>'需要一致批准',:description=>'需要一致批准',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_modeall_approved.lookup_values_tls.build(:lookup_value_id=>wf_step_mulit_approver_modeall_approved.id,:meaning=>'All approver approved',:description=>'All approver approved',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_mulit_approver_modeall_approved.save
    wf_step_reject_modereject_step= Irm::LookupValue.new(:lookup_type=>'WF_STEP_REJECT_MODE',:lookup_code=>'REJECT_STEP',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_reject_modereject_step.lookup_values_tls.build(:lookup_value_id=>wf_step_reject_modereject_step.id,:meaning=>'返回',:description=>'返回',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_modereject_step.lookup_values_tls.build(:lookup_value_id=>wf_step_reject_modereject_step.id,:meaning=>'Back to step',:description=>'Back to step',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_modereject_step.save
    wf_step_reject_modereject_process= Irm::LookupValue.new(:lookup_type=>'WF_STEP_REJECT_MODE',:lookup_code=>'REJECT_PROCESS',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_step_reject_modereject_process.lookup_values_tls.build(:lookup_value_id=>wf_step_reject_modereject_process.id,:meaning=>'最终拒绝',:description=>'最终拒绝',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_modereject_process.lookup_values_tls.build(:lookup_value_id=>wf_step_reject_modereject_process.id,:meaning=>'Final reject',:description=>'Final reject',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_step_reject_modereject_process.save
  end

  def self.down
  end
end
