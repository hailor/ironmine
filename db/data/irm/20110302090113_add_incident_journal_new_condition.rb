# -*- coding: utf-8 -*-
class AddIncidentJournalNewCondition < ActiveRecord::Migration
  def self.up
    incident_journal_new = Irm::Condition.new(:context_code=>"INCIDENT_JOURNAL",:condition_code=>"INCIDENT_JOURNAL_NEW",:not_auto_mult=>true)
    incident_journal_new.conditions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复事故单',:description=>'回复事故单')
    incident_journal_new.conditions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply incident request',:description=>'Reply incident request')
    incident_journal_new.save
  end

  def self.down
  end
end
