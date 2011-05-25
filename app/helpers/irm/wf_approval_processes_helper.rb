module Irm::WfApprovalProcessesHelper
  def available_next_approver_mode
    object_attributes = Irm::ObjectAttribute.person_column.enabled.multilingual.where(:business_object_code=>"IRM_PEOPLE")
    object_attributes.collect{|i|[i[:name],i.attribute_name]}
  end

  def available_wf_process_editability
    Irm::LookupValue.query_by_lookup_type("WF_PROCESS_RECORD_EDITABILITY").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end


  def active_approval_process(bo_code)
     Irm::WfApprovalProcess.where(:bo_code=>bo_code).enabled
  end

  def disable_approval_process(bo_code)
    Irm::WfApprovalProcess.where(:bo_code=>bo_code).disabled
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
end
