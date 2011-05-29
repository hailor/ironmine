class Irm::WfActionController < ApplicationController
  private
  def get_bo_code_from_source_str(source_str)
    return nil unless source_str.present?
    source_info = source_str.split(",")
    if source_info.size>1&&"WF_RULE".eql?(source_info[0])
      return Irm::WfRule.find(source_info[1]).bo_code
    elsif source_info.size>2&&"WF_RULE_TIME_TRIGGER".eql?(source_info[0])
      return Irm::WfRule.find(source_info[1]).bo_code
    elsif source_info.size>1&&["AP_SUBMIT","AP_RECALL","AP_FINAL_REJECT","AP_FINAL_APPROVAL"].include?(source_info[0])
      return Irm::WfApprovalProcess.find(source_info[1]).bo_code
    end
  end

  def create_for_source(source_str,action)
    return unless source_str.present?
    source_info = source_str.split(",")
    if source_info.size>1&&"WF_RULE".eql?(source_info[0])
      Irm::WfRuleAction.create(:rule_id=>source_info[1],:action_type=>action.class,:action_reference_id=>action.id)
    elsif source_info.size>2&&"WF_RULE_TIME_TRIGGER".eql?(source_info[0])
      Irm::WfRuleAction.create(:rule_id=>source_info[1],:time_trigger_id=>source_info[2],:action_type=>action.class,:action_reference_id=>action.id)
    elsif source_info.size>1&&["AP_SUBMIT","AP_RECALL","AP_FINAL_REJECT","AP_FINAL_APPROVAL"].include?(source_info[0])
      Irm::WfApprovalAction.create(:action_mode=>source_info[0],:action_type=>action.class.name,:action_id=>action.id,:process_id=>source_info[1])
    end
  end
end
