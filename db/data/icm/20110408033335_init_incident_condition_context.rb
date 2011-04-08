# -*- coding: utf-8 -*-
class InitIncidentConditionContext < ActiveRecord::Migration
  def self.up

    incident_request_pass = Irm::Condition.new(:context_code=>"INCIDENT_JOURNAL",:condition_code=>"INCIDENT_REQUEST_PASS",:not_auto_mult=>true)
    incident_request_pass.conditions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'转交事故单',:description=>'转交事故单')
    incident_request_pass.conditions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Pass incident request',:description=>'Pass incident request')
    incident_request_pass.save

    incident_request_close = Irm::Condition.new(:context_code=>"INCIDENT_JOURNAL",:condition_code=>"INCIDENT_REQUEST_CLOSE",:not_auto_mult=>true)
    incident_request_close.conditions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭事故单',:description=>'关闭事故单')
    incident_request_close.conditions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close incident request',:description=>'Close incident request')
    incident_request_close.save

    incident_request_context_field1 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.url",:not_auto_mult=>true)
    incident_request_context_field1.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单URL',:description=>'事故单URL')
    incident_request_context_field1.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request URL',:description=>'Incident Request URL')
    incident_request_context_field1.save


    incident_journal_context_field1 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"journal.url",:not_auto_mult=>true)
    incident_journal_context_field1.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单URL',:description=>'事故单URL')
    incident_journal_context_field1.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident Request URL',:description=>'Incident Request URL')
    incident_journal_context_field1.save

  end

  def self.down
  end
end
