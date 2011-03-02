# -*- coding: utf-8 -*-
class InitJournalScriptContext < ActiveRecord::Migration
  def self.up
    incident_request_context_field1 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.request_number",:not_auto_mult=>true)
    incident_request_context_field1.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单编号',:description=>'事故单编号')
    incident_request_context_field1.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request number',:description=>'Incident request number')
    incident_request_context_field1.save

    incident_request_context_field2 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.title",:not_auto_mult=>true)
    incident_request_context_field2.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单标题',:description=>'事故单标题')
    incident_request_context_field2.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request title',:description=>'Incident request title')
    incident_request_context_field2.save

    incident_request_context_field3 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.incident_status_name",:not_auto_mult=>true)
    incident_request_context_field3.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单状态',:description=>'事故单状态')
    incident_request_context_field3.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request status',:description=>'Incident request status')
    incident_request_context_field3.save

    incident_request_context_field4 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.summary",:not_auto_mult=>true)
    incident_request_context_field4.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单内容',:description=>'事故单内容')
    incident_request_context_field4.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request summary',:description=>'Incident request summary')
    incident_request_context_field4.save

    incident_request_context_field5 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.submitted_name",:not_auto_mult=>true)
    incident_request_context_field5.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单提交人',:description=>'事故单提交人')
    incident_request_context_field5.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request submitted by',:description=>'Incident request submitted by')
    incident_request_context_field5.save

    incident_request_context_field6 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.requested_name",:not_auto_mult=>true)
    incident_request_context_field6.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单客户',:description=>'事故单客户')
    incident_request_context_field6.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request customer',:description=>'Incident request customer')
    incident_request_context_field6.save

    incident_request_context_field8 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.urgence_name",:not_auto_mult=>true)
    incident_request_context_field8.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故紧急度',:description=>'事故紧急度')
    incident_request_context_field8.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request urgence',:description=>'Incident request urgence')
    incident_request_context_field8.save

    incident_request_context_field9 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_REQUEST",:field_key=>"request.impact_range_name",:not_auto_mult=>true)
    incident_request_context_field9.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故影响度',:description=>'事故影响度')
    incident_request_context_field9.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request impact',:description=>'Incident request impact')
    incident_request_context_field9.save


    incident_request_journal = Irm::ScriptContext.new(:context_code=>"INCIDENT_JOURNAL",:not_auto_mult=>true)
    incident_request_journal.script_contexts_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复事故单',:description=>'回复事故单')
    incident_request_journal.script_contexts_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply incident request ',:description=>'Reply incident request')
    incident_request_journal.save

    incident_journal_context_field1 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"journal.message_body",:not_auto_mult=>true)
    incident_journal_context_field1.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复内容',:description=>'回复内容')
    incident_journal_context_field1.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply message',:description=>'Reply message')
    incident_journal_context_field1.save

    incident_journal_context_field2 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"journal.replied_name",:not_auto_mult=>true)
    incident_journal_context_field2.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复人',:description=>'回复人')
    incident_journal_context_field2.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Replied by',:description=>'Replied by')
    incident_journal_context_field2.save

    incident_journal_context_field3 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"journal.change_message",:not_auto_mult=>true)
    incident_journal_context_field3.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单变更信息',:description=>'事故单变更信息')
    incident_journal_context_field3.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request number',:description=>'Incident request number')
    incident_journal_context_field3.save


    incident_journal_context_field4 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.request_number",:not_auto_mult=>true)
    incident_journal_context_field4.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单编号',:description=>'事故单编号')
    incident_journal_context_field4.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request number',:description=>'Incident request number')
    incident_journal_context_field4.save

    incident_journal_context_field5 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.title",:not_auto_mult=>true)
    incident_journal_context_field5.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单标题',:description=>'事故单标题')
    incident_journal_context_field5.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request title',:description=>'Incident request title')
    incident_journal_context_field5.save

    incident_journal_context_field6 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.incident_status_name",:not_auto_mult=>true)
    incident_journal_context_field6.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单状态',:description=>'事故单状态')
    incident_journal_context_field6.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request status',:description=>'Incident request status')
    incident_journal_context_field6.save

    incident_journal_context_field7 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.summary",:not_auto_mult=>true)
    incident_journal_context_field7.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单内容',:description=>'事故单内容')
    incident_journal_context_field7.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request summary',:description=>'Incident request summary')
    incident_journal_context_field7.save

    incident_journal_context_field8 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.submitted_name",:not_auto_mult=>true)
    incident_journal_context_field8.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单提交人',:description=>'事故单提交人')
    incident_journal_context_field8.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request submitted by',:description=>'Incident request submitted by')
    incident_journal_context_field8.save

    incident_journal_context_field9 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.requested_name",:not_auto_mult=>true)
    incident_journal_context_field9.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单客户',:description=>'事故单客户')
    incident_journal_context_field9.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request customer',:description=>'Incident request customer')
    incident_journal_context_field9.save

    incident_journal_context_field10 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.urgence_name",:not_auto_mult=>true)
    incident_journal_context_field10.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故紧急度',:description=>'事故紧急度')
    incident_journal_context_field10.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request urgence',:description=>'Incident request urgence')
    incident_journal_context_field10.save

    incident_journal_context_field11 = Irm::ScriptContextField.new(:context_code=>"INCIDENT_JOURNAL",:field_key=>"request.impact_range_name",:not_auto_mult=>true)
    incident_journal_context_field11.script_context_fields_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故影响度',:description=>'事故影响度')
    incident_journal_context_field11.script_context_fields_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request impact',:description=>'Incident request impact')
    incident_journal_context_field11.save


  end

  def self.down
  end
end
