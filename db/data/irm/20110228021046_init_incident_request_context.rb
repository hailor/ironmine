class InitIncidentRequestContext < ActiveRecord::Migration
  def self.up
    incident_request_context = Irm::ScriptContext.new(:context_code=>"INCIDENT_REQUEST",:not_auto_mult=>true)
    incident_request_context.script_contexts_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    incident_request_context.script_contexts_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    incident_request_context.save
  end

  def self.down
  end
end
