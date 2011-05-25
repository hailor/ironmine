class Irm::WfApprovalSubmitter < ActiveRecord::Base
  set_table_name :irm_wf_approval_submitters

  belongs_to :wf_approval_process,:foreign_key => :process_id

  query_extend


  attr_accessor :bo_code


  def self.submitter_types
    return @submitter_types if @submitter_types
    @submitter_types = Irm::LookupValue.query_by_lookup_type("WF_MAIL_ALERT_RECIPIENT_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def ref
    "#{self.submitter_type}##{self.submitter_id}"
  end

  def label
    type_name = self.class.submitter_types.detect{|i| i[1].eql?(self.submitter_type)}[0]
    submitter_name = ""
    case self.submitter_type
      when "RELATED_PERSON"
        oa = Irm::ObjectAttribute.multilingual.where(:business_object_code=>self.bo_code||self.wf_approval_process.bo_code,:attribute_name=>self.submitter_id).first
        submitter_name = oa[:name] if oa
      when "ROLE"
        role = Irm::Role.multilingual.query(self.submitter_id).first
        submitter_name = role[:name] if role
      when "PERSON"
        person = Irm::Person.query(self.submitter_id).first
        submitter_name = person.full_name if person
    end
    "#{type_name}: #{submitter_name}"
  end

  def person_ids(bo)
    person_ids = []
    case self.submitter_type
      when "RELATED_PERSON"
        if bo
          value = Irm::BusinessObject.attribute_of(bo,self.submitter_id)
          if value.present?
            if value.is_a?(Array)
              person_ids = value
            else
              person_ids = [value.to_i]
            end
          end
        end
      when "ROLE"
        person_ids = Irm::PersonRole.where(:role_id=>self.submitter_id).collect{|i| i.person_id}
      when "PERSON"
        person_ids = [self.submitter_id]
    end
  end

end
