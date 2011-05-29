module Irm::WfApprovalProcessesHelper
  def available_next_approver_mode
    object_attributes = Irm::ObjectAttribute.person_column.enabled.multilingual.where(:business_object_code=>"IRM_PEOPLE")
    object_attributes.collect{|i|[i[:name],i.attribute_name]}
  end

  def available_wf_process_editability
    Irm::LookupValue.query_by_lookup_type("WF_PROCESS_RECORD_EDITABILITY").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end


  def active_approval_process(bo_code)
     Irm::WfApprovalProcess.where(:bo_code=>bo_code).enabled.order("process_order")
  end

  def disable_approval_process(bo_code)
    Irm::WfApprovalProcess.where(:bo_code=>bo_code).disabled.order("id")
  end


  def process_submitter_value(process_id)
    if process_id
      Irm::WfApprovalSubmitter.where(:process_id=>process_id).collect{|as| as.submitter_type+"#"+as.submitter_id}.join(",")
    end
  end

  def available_approval_submitter(bo_code)
    values = []
    values +=Irm::Person.query_by_company_ids(Irm::Person.current.accessable_company_ids).collect{|p| ["#{Irm::BusinessObject.class_name_to_meaning(Irm::Person.name)}:#{p.full_name}","PERSON##{p.id}",{:type=>"PERSON",:query=>p.full_name}]}
    values +=Irm::Role.multilingual.enabled.collect{|r| ["#{Irm::BusinessObject.class_name_to_meaning(Irm::Role.name)}:#{r[:name]}","ROLE##{r.id}",{:type=>"ROLE",:query=>r[:name]}]}
    if bo_code
      values += Irm::ObjectAttribute.person_column.enabled.multilingual.where(:business_object_code=>bo_code).collect{|o| ["#{t(:label_related_person)}:#{o[:name]}","RELATED_PERSON##{o.attribute_name}",{:type=>"RELATED_PERSON",:query=>o[:name]}]}
    end
    values
  end


  def showable_steps(process_id)
    Irm::WfApprovalStep.list_all.where(:process_id=>process_id).order("step_number")
  end


  def wf_process_actions(action_mode,wf_process_id,wf_step_id = nil)
    wf_process_actions = Irm::WfApprovalAction.where(:action_mode=>action_mode,:process_id=>wf_process_id,:step_id=>wf_step_id)
    actions = []
    wf_process_actions.each do |action|
      ref_action =  action.action_type.constantize.query(action.action_id).first
      next unless ref_action
      source_str = "#{action_mode},#{wf_process_id}"
      source_str = "#{source_str},#{wf_step_id}" if wf_step_id
      actions << {:action_type_name=>Irm::BusinessObject.class_name_to_meaning(action.action_type),
       :edit_url_options=>ref_action.urlable_url_options(:edit).merge({:source_str=>source_str,:back_url=>url_for({})}),
       :show_url_options=>ref_action.urlable_url_options(:show).merge({:source_str=>source_str,:back_url=>url_for({})}),
       :delete_url_options=>{:controller=>"irm/wf_approval_processes",:action=>"destroy_action",:id=>action.id,:back_url=>url_for({})},
       :ref_action=>ref_action ,:action=>action
      }
    end
    actions
  end


  # =========== for add_exists_action ==================================
  def available_action_type
    [Irm::WfMailAlert.name,Irm::WfFieldUpdate.name].collect{|i| [Irm::BusinessObject.class_name_to_meaning(i),Irm::BusinessObject.class_name_to_code(i)]}
  end

  def wf_approval_addable_actions(wf_process_id)
    action_types = [Irm::WfMailAlert,Irm::WfFieldUpdate]
    bo_code = Irm::WfApprovalProcess.find(wf_process_id).bo_code
    selectable_options = []
    action_types.each do |ac|
      actions = ac.where(:bo_code=>bo_code)
      actions.each do |a|
        selectable_options << ["#{Irm::BusinessObject.class_name_to_meaning(ac.name)}:#{a.name}","#{Irm::BusinessObject.class_name_to_code(ac.name)}##{a.id}",{:query=>a.name,:type=>Irm::BusinessObject.class_name_to_code(ac.name)}]
      end
    end
    selectable_options
  end

  def wf_approval_exists_actions(action_mode,wf_process_id,wf_step_id = nil)
    wf_approval_actions = Irm::WfApprovalAction.where(:action_mode=>action_mode,:process_id=>wf_process_id,:step_id=>wf_step_id)
    actions = []
    wf_approval_actions.each do |action|
      actions<<"#{Irm::BusinessObject.class_name_to_code(action.action_type)}##{action.action_id}"
    end
    actions.join(",")
  end
end
