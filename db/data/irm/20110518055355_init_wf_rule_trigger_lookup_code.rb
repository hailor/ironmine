# -*- coding: utf-8 -*-
class InitWfRuleTriggerLookupCode < ActiveRecord::Migration
  def self.up
    wf_rule_trigger_time_unit=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_RULE_TRIGGER_TIME_UNIT',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_unit.lookup_types_tls.build(:lookup_type_id=>wf_rule_trigger_time_unit.id,:meaning=>'工作流规则触发器时间单位',:description=>'工作流规则触发器时间单位',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unit.lookup_types_tls.build(:lookup_type_id=>wf_rule_trigger_time_unit.id,:meaning=>'Workflow rule trigger time unit',:description=>'Workflow rule trigger time unit',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unit.save
    wf_rule_trigger_time_mode=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_RULE_TRIGGER_TIME_MODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_mode.lookup_types_tls.build(:lookup_type_id=>wf_rule_trigger_time_mode.id,:meaning=>'工作流规则触发器时间触发方式',:description=>'工作流规则触发器时间触发方式',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_mode.lookup_types_tls.build(:lookup_type_id=>wf_rule_trigger_time_mode.id,:meaning=>'Workflow rule trigger time mode',:description=>'Workflow rule trigger time mode',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_mode.save
    wf_rule_trigger_time_unitday= Irm::LookupValue.new(:lookup_type=>'WF_RULE_TRIGGER_TIME_UNIT',:lookup_code=>'DAY',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_unitday.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_unitday.id,:meaning=>'天',:description=>'天',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unitday.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_unitday.id,:meaning=>'Day',:description=>'Day',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unitday.save
    wf_rule_trigger_time_unithour= Irm::LookupValue.new(:lookup_type=>'WF_RULE_TRIGGER_TIME_UNIT',:lookup_code=>'HOUR',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_unithour.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_unithour.id,:meaning=>'小时',:description=>'小时',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unithour.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_unithour.id,:meaning=>'Hour',:description=>'Hour',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_unithour.save
    wf_rule_trigger_time_modebefore= Irm::LookupValue.new(:lookup_type=>'WF_RULE_TRIGGER_TIME_MODE',:lookup_code=>'BEFORE',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_modebefore.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_modebefore.id,:meaning=>'早于',:description=>'早于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_modebefore.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_modebefore.id,:meaning=>'Before',:description=>'Before',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_modebefore.save
    wf_rule_trigger_time_modeafter= Irm::LookupValue.new(:lookup_type=>'WF_RULE_TRIGGER_TIME_MODE',:lookup_code=>'AFTER',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_rule_trigger_time_modeafter.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_modeafter.id,:meaning=>'晚于',:description=>'晚于',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_modeafter.lookup_values_tls.build(:lookup_value_id=>wf_rule_trigger_time_modeafter.id,:meaning=>'After',:description=>'After',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_rule_trigger_time_modeafter.save
  end

  def self.down
  end
end
