class CreateModuleIncidentPhasesTables < ActiveRecord::Migration
  def self.up
      create_table "icm_incident_phases", :force => true do |t|
        t.integer  "company_id",    :null => false
        t.string   "phase_code",    :limit => 30, :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_phases", ["phase_code"], :name => "ICM_INCIDENT_PHASES_N1"

      create_table "icm_incident_phases_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "incident_phase_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150
        t.string   "description",       :limit => 240
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_phases_tl", ["incident_phase_id", "language"], :name => "ICM_INCIDENT_PHASES_TL_U1", :unique => true
      add_index "icm_incident_phases_tl", ["incident_phase_id"], :name => "ICM_INCIDENT_PHASES_TL_N1"

      execute('CREATE OR REPLACE VIEW icm_incident_phases_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_incident_phases t,icm_incident_phases_tl tl
                                             WHERE t.id = tl.incident_phase_id')
  end

  def self.down
    drop_table :icm_incident_phases
    drop_table :icm_incident_phases_tl
    execute('drop view icm_incident_phases_vl')
  end
end
