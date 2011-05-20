class Irm::WfMailRecipient < ActiveRecord::Base
  set_table_name :irm_wf_mail_recipients

  belongs_to :wf_mail_alert

  query_extend

  attr_accessor :bo_code


  def self.recipient_types
    return @recipient_types if @recipient_types
    @recipient_types = Irm::LookupValue.query_by_lookup_type("WF_MAIL_ALERT_RECIPIENT_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def ref
    "#{self.recipient_type}##{self.recipient_id}"
  end

  def label
    type_name = self.class.recipient_types.detect{|i| i[1].eql?(self.recipient_type)}[0]
    recipient_name = ""
    case self.recipient_type
      when "RELATED_PERSON"
        oa = Irm::ObjectAttribute.multilingual.where(:business_object_code=>self.bo_code||self.wf_mail_alert.bo_code,:attribute_name=>self.recipient_id).first
        recipient_name = oa[:name] if oa
      when "ROLE"
        role = Irm::Role.multilingual.query(self.recipient_id).first
        recipient_name = role[:name] if role
      when "PERSON"
        person = Irm::Person.query(self.recipient_id).first
        recipient_name = person.full_name if person
    end
    "#{type_name}: #{recipient_name}"
  end

  def person_ids(bo)
    person_ids = []
    case self.recipient_type
      when "RELATED_PERSON"
        if bo
          value = Irm::BusinessObject.attribute_of(bo,self.recipient_id)
          if value.present?
            if value.is_a?(Array)
              person_ids = value
            else
              person_ids = [value.to_i]
            end
          end
        end
      when "ROLE"
        person_ids = Irm::PersonRole.where(:role_id=>self.recipient_id).collect{|i| i.person_id}
      when "PERSON"
        person_ids = [self.recipient_id]
    end
  end
end
