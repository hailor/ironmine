class Irm::WfApprovalAction < ActiveRecord::Base
  set_table_name :irm_wf_approval_actions

#action_mode
#初始操作 AP_SUBMIT
#最终审批AP_FINAL_APPROVAL
#最终拒绝AP_FINAL_REJECT
#审批步骤通过AP_STEP_APPROVAL
#审批步骤拒绝AP_STEP_REJECT
end
