# -*- coding: utf-8 -*-
class InitEscalateMode < ActiveRecord::Migration
  def self.up
    slm_escalation_mode=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SLM_ESCALATION_MODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_escalation_mode.lookup_types_tls.build(:lookup_type_id=>slm_escalation_mode.id,:meaning=>'服务升级模式',:description=>'服务升级模式',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode.lookup_types_tls.build(:lookup_type_id=>slm_escalation_mode.id,:meaning=>'SERVICE ESCALATION MODE',:description=>'SERVICE ESCALATION MODE',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode.save

    slm_escalation_mode_before= Irm::LookupValue.new(:lookup_type=>'SLM_ESCALATION_MODE',:lookup_code=>'BEFORE_ESCALATION',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_escalation_mode_before.lookup_values_tls.build(:lookup_value_id=>slm_escalation_mode_before.id,:meaning=>'逾期前',:description=>'逾期前',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode_before.lookup_values_tls.build(:lookup_value_id=>slm_escalation_mode_before.id,:meaning=>'Before Escalation',:description=>'Before Escalation',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode_before.save
    slm_escalation_mode_after= Irm::LookupValue.new(:lookup_type=>'SLM_ESCALATION_MODE',:lookup_code=>'AFTER_ESCALATION',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_escalation_mode_after.lookup_values_tls.build(:lookup_value_id=>slm_escalation_mode_after.id,:meaning=>'逾期后',:description=>'逾期后',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode_after.lookup_values_tls.build(:lookup_value_id=>slm_escalation_mode_after.id,:meaning=>'After Escalation',:description=>'After Escalation',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_escalation_mode_after.save
  end

  def self.down
  end
end
