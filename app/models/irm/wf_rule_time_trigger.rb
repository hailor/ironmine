class Irm::WfRuleTimeTrigger < ActiveRecord::Base
  set_table_name :irm_wf_rule_time_triggers

  belongs_to :wf_rule,:foreign_key => :rule_id

  validates_presence_of :time_lead,:rule_id

  scope :with_time_unit,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} time_unit ON time_unit.lookup_type='WF_RULE_TRIGGER_TIME_UNIT' AND time_unit.lookup_code = #{table_name}.time_unit AND time_unit.language= '#{language}'").
    select(" time_unit.meaning time_unit_name")
  }

  scope :with_trigger_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} trigger_mode ON trigger_mode.lookup_type='WF_RULE_TRIGGER_TIME_MODE' AND trigger_mode.lookup_code = #{table_name}.trigger_mode AND trigger_mode.language= '#{language}'").
    select(" trigger_mode.meaning trigger_mode_name")
  }

  scope :with_wf_rule,lambda{
    joins("LEFT OUTER JOIN #{Irm::WfRule.table_name} ON #{table_name}.rule_id = #{Irm::WfRule.table_name}.id").
    select("#{Irm::WfRule.table_name}.bo_code,#{Irm::WfRule.table_name}.name wf_rule_name")
  }

  def self.list_all
    select("#{table_name}.*").with_time_unit(I18n.locale).with_trigger_mode(I18n.locale).with_wf_rule
  end

  def meaning
    attribute_name = I18n.t(:label_irm_wf_rule_trigger_datetime);
    unless self.trigger_data_object.eql?("wf_rule_trigger_datetime")
      bo_code = self[:bo_code]
      bo_code ||= self.wf_rule.bo_code
      attribute_name = Irm::ObjectAttribute.multilingual.where(:business_object_code=>bo_code,:attribute_name=>self.trigger_data_object).first[:name]
    end
    message = "#{self.time_lead} #{self[:time_unit_name]} #{self[:trigger_mode_name]} #{attribute_name}"
  end

  def date_time(bo)
    ref_datetime = Time.now
    unless self.trigger_data_object.eql?("wf_rule_trigger_datetime")
      ref_datetime = Irm::BusinessObject.attribute_of(bo,self.trigger_data_object)
    end
    ref_datetime||= Time.now
    script_str = "#{self.time_lead}"
    if(time_unit.eql?("HOUR"))
      script_str +=".hours"
    else
      script_str +=".days"
    end

    if(self.trigger_mode.eql?("BEFORE"))
      script_str +=".ago(ref_datetime)"
    else
      script_str +=".from_now(ref_datetime)"
    end

    eval(script_str)

  end
end
