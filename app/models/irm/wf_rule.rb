class Irm::WfRule < ActiveRecord::Base
  set_table_name :irm_wf_rules

  attr_accessor :step

  validates_presence_of :bo_code,:if=>Proc.new{|i| i.check_step(1)}
  validates_presence_of :name,:rule_code,:if=>Proc.new{|i| i.check_step(2)}
  validates_format_of :rule_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.rule_code.blank?}

  query_extend

  scope :with_evaluate_criteria_rule,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_criteria_rule ON evaluate_criteria_rule.lookup_type='WORKFLOW_RULE_EVALUATE_TYPE' AND evaluate_criteria_rule.lookup_code = #{table_name}.evaluate_criteria_rule AND evaluate_criteria_rule.language= '#{language}'").
    select(" evaluate_criteria_rule.meaning evaluate_criteria_rule_name")
  }

  scope :with_evaluate_criteria_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_rule_mode ON evaluate_rule_mode.lookup_type='WORKFLOW_RULE_EVALUATE_MODE' AND evaluate_rule_mode.lookup_code = #{table_name}.evaluate_rule_mode AND evaluate_rule_mode.language= '#{language}'").
    select(" evaluate_rule_mode.meaning evaluate_rule_mode_name")
  }

  scope :with_bo,lambda{|language|
    joins("JOIN #{Irm::BusinessObject.view_name} ON #{Irm::BusinessObject.view_name}.business_object_code = #{table_name}.bo_code AND #{Irm::BusinessObject.view_name}.language ='#{language}'").
    select("#{Irm::BusinessObject.view_name}.name bo_name")
  }

  scope :not_applied_before,lambda{|bo_id|
    where("NOT EXISTS(SELECT 1 FROM #{Irm::WfRuleHistory.table_name} WHERE #{Irm::WfRuleHistory.table_name}.rule_id=#{table_name}.id AND #{Irm::WfRuleHistory.table_name}.bo_code=#{table_name}.bo_code AND #{Irm::WfRuleHistory.table_name}.bo_id=?)",bo_id)
  }

  scope :create_edit_first_time,lambda{where(:evaluate_criteria_rule=>"CREATE_EDIT_FIRST_TIME")}

  scope :only_create,lambda{where(:evaluate_criteria_rule=>"ONLY_CREATE")}

  scope :create_edit_every_time,lambda{where(:evaluate_criteria_rule=>"CREATE_EDIT_EVERY_TIME")}

  def self.list_all
    select("#{table_name}.*").with_bo(I18n.locale).with_evaluate_criteria_rule(I18n.locale).with_evaluate_criteria_mode(I18n.locale)
  end



  def check_step(stp)
    self.step.nil?||self.step>=stp
  end

  # is the event match the filter or formula ?
  def match(event)
    rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,self.id).first
    business_object = rule_filter.generate_scope.where(:id=>event.business_object_id).first
    business_object
  end
  # apply the workflow
  def apply(business_object)
    logger.debug(business_object)
  end

end
