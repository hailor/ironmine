# -*- coding: utf-8 -*-
class AddIncidentRequestMenu < ActiveRecord::Migration
  def self.up
    ir_index = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REQUESTS_INDEX',
                                             :page_controller=>'icm/incident_requests',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    ir_index.permissions_tls.build(:language=>'zh',:name=>'事故单首页',:description=>'事故单首页',:source_lang=>'en')
    ir_index.permissions_tls.build(:language=>'en',:name=>'Incident request page',:description=>'Incident request page',:source_lang=>'en')
    ir_index.save

    menu_ir_index = Irm::MenuEntry.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',
                                         :permission_code=>'ICM_INCIDENT_REQUESTS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    menu_ir_index.menu_entries_tls.build(:language=>'zh',:name=>'事故单',:description=>'事故单',:source_lang=>'en')
    menu_ir_index.menu_entries_tls.build(:language=>'en',:name=>'Incident request',:description=>'Incident request',:source_lang=>'en')
    menu_ir_index.save

    ij_index = Irm::Permission.new(:permission_code=>'ICM_INCIDENT_JOURNALS_INDEX',
                                             :page_controller=>'icm/incident_journals',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    ij_index.permissions_tls.build(:language=>'zh',:name=>'事故单回复首页',:description=>'事故单回复首页',:source_lang=>'en')
    ij_index.permissions_tls.build(:language=>'en',:name=>'Incident journal page',:description=>'ncident journal page',:source_lang=>'en')
    ij_index.save

    menu_ij_index = Irm::MenuEntry.new(:menu_code=>'IRM_SOC_INCIDENT_MENU',
                                         :permission_code=>'ICM_INCIDENT_JOURNALS_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    menu_ij_index.menu_entries_tls.build(:language=>'zh',:name=>'事故单',:description=>'事故单',:source_lang=>'en')
    menu_ij_index.menu_entries_tls.build(:language=>'en',:name=>'Incident journal',:description=>'Incident journal',:source_lang=>'en')
    menu_ij_index.save
  end

  def self.down
  end
end
