class CreateModuleIncidentStatusTables < ActiveRecord::Migration
  def self.up
      create_table "icm_incident_statuses", :force => true do |t|
        t.integer  "company_id",              :null => false
        t.string   "incident_status_code",    :limit => 30, :null => false
        t.string   "status_code",             :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_statuses", ["incident_status_code"], :name => "ICM_INCIDENT_STATUSES_N1"

      create_table "icm_incident_statuses_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "incident_status_id"
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

      add_index "icm_incident_statuses_tl", ["incident_status_id", "language"], :name => "ICM_INCIDENT_STATUSES_TL_U1", :unique => true
      add_index "icm_incident_statuses_tl", ["incident_status_id"], :name => "ICM_INCIDENT_STATUSES_TL_N1"

      execute('CREATE OR REPLACE VIEW icm_incident_statuses_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_incident_statuses t,icm_incident_statuses_tl tl
                                             WHERE t.id = tl.incident_status_id')
  end

  def self.down
    drop_table :icm_incident_statuses
    drop_table :icm_incident_statuses_tl
    execute('drop view icm_incident_statuses_vl')
  end
end
