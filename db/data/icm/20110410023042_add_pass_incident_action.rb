# -*- coding: utf-8 -*-
class AddPassIncidentAction < ActiveRecord::Migration
  def self.up
    pass_incident_action = Irm::Action.new(:action_code=>"PASS_INCIDENT",:handler=>"Irm::Actions::PassIncident",:not_auto_mult=>true)
    pass_incident_action.actions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'转交事故单计算Open Tasks',:description=>'转交事故单计算Open Tasks')
    pass_incident_action.actions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Calculate open tasks on pass',:description=>'Calculate open tasks on pass')
    pass_incident_action.save
  end

  def self.down
    pass_incident_action = Irm::Action.where(:action_code=>"PASS_INCIDENT").first
    pass_incident_action.destroy if pass_incident_action
  end
end
