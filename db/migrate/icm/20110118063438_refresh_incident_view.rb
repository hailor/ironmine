class RefreshIncidentView < ActiveRecord::Migration
  def self.up
    execute('CREATE OR REPLACE VIEW icm_impact_ranges_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_impact_ranges t,icm_impact_ranges_tl tl
                                             WHERE t.id = tl.impact_range_id')
    execute('CREATE OR REPLACE VIEW icm_incident_phases_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_incident_phases t,icm_incident_phases_tl tl
                                             WHERE t.id = tl.incident_phase_id')
    execute('CREATE OR REPLACE VIEW icm_urgence_codes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_urgence_codes t,icm_urgence_codes_tl tl
                                             WHERE t.id = tl.urgence_code_id')
    execute('CREATE OR REPLACE VIEW icm_incident_statuses_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_incident_statuses t,icm_incident_statuses_tl tl
                                             WHERE t.id = tl.incident_status_id')
  end

  def self.down
  end
end
