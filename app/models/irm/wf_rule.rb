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
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_rule_mode ON evaluate_rule_mode.lookup_type='WORKFLOW_RULE_EVALUATE_TYPE' AND evaluate_rule_mode.lookup_code = #{table_name}.evaluate_rule_mode AND evaluate_rule_mode.language= '#{language}'").
    select(" evaluate_rule_mode.meaning evaluate_rule_mode_name")
  }

  scope :with_bo,lambda{|language|
    joins("JOIN #{Irm::BusinessObject.view_name} ON #{Irm::BusinessObject.view_name}.business_object_code = #{table_name}.bo_code AND #{Irm::BusinessObject.view_name}.language ='#{language}'").
    select("#{Irm::BusinessObject.view_name}.name bo_name")
  }


  def self.list_all
    select("#{table_name}.*").with_bo(I18n.locale).with_evaluate_criteria_rule(I18n.locale).with_evaluate_criteria_mode(I18n.locale)
  end



  def check_step(stp)
    self.step.nil?||self.step>=stp
  end

end
