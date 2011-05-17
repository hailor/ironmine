module Irm::WfMailAlertsHelper
  def available_mail_alert_recipient_type
    Irm::LookupValue.query_by_lookup_type("WF_MAIL_ALERT_RECIPIENT_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def available_bo_person_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.person_column.enabled.multilingual.where(:business_object_code=>business_object_code)
    end
    object_attributes.collect{|i|[i[:name],i.attribute_name]}
  end
end
