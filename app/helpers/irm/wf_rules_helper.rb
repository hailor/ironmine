module Irm::WfRulesHelper
  def available_evaluate_criteria_rules
    Irm::LookupValue.query_by_lookup_type("WORKFLOW_RULE_EVALUATE_TYPE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end
end
