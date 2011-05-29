class Irm::WfApprovalStepApprover < ActiveRecord::Base
  set_table_name :irm_wf_approval_step_approvers

  belongs_to :wf_approval_step,:foreign_key => :step_id


  query_extend
  
  attr_accessor :bo_code

  def self.approver_types
    return @approver_types if @approver_types
    @approver_types = Irm::LookupValue.query_by_lookup_type("WF_MAIL_ALERT_RECIPIENT_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def ref
    "#{self.approver_type}##{self.approver_id}"
  end

  def label
    type_name = self.class.approver_types.detect{|i| i[1].eql?(self.approver_type)}[0]
    approver_name = ""
    case self.approver_type
      when "RELATED_PERSON"
        oa = Irm::ObjectAttribute.multilingual.where(:business_object_code=>self.bo_code||Irm::WfApprovalProcess.query_by_step(self.step_id).first.bo_code,:attribute_name=>self.approver_id).first
        approver_name = oa[:name] if oa
      when "ROLE"
        role = Irm::Role.multilingual.query(self.approver_id).first
        approver_name = role[:name] if role
      when "PERSON"
        person = Irm::Person.query(self.approver_id).first
        approver_name = person.full_name if person
    end
    "#{type_name}: #{approver_name}"
  end

  def person_ids(bo)
    person_ids = []
    case self.approver_type
      when "RELATED_PERSON"
        if bo
          value = Irm::BusinessObject.attribute_of(bo,self.approver_id)
          if value.present?
            if value.is_a?(Array)
              person_ids = value
            else
              person_ids = [value.to_i]
            end
          end
        end
      when "ROLE"
        person_ids = Irm::PersonRole.where(:role_id=>self.approver_id).collect{|i| i.person_id}
      when "PERSON"
        person_ids = [self.approver_id]
    end
  end
end
