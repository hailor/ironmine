module Irm::WfRuleTimeTriggersHelper
  def wf_rule_name(rule_id)
    Irm::WfRule.find(rule_id).name
  end

  def available_wf_trigger_time_unit
    Irm::LookupValue.query_by_lookup_type("WF_RULE_TRIGGER_TIME_UNIT").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def available_wf_trigger_time_mode
    Irm::LookupValue.query_by_lookup_type("WF_RULE_TRIGGER_TIME_MODE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def available_wf_trigger_date_attribute(rule_id)
    bo_code = Irm::WfRule.find(rule_id).bo_code
    date_attributes = [[t(:label_irm_wf_rule_trigger_datetime),"wf_rule_trigger_datetime"]]

    date_attributes +=  Irm::ObjectAttribute.multilingual.where(:business_object_code=>bo_code,:data_type=>"datetime").collect{|i| [i[:name],i.attribute_name]}

  end
end
