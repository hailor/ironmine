class CreateModuleIncidentTables < ActiveRecord::Migration
  def self.up
      create_table "icm_incident_requests", :force => true do |t|
        t.integer  "company_id",              :null => false
        t.string   "title",                   :limit=>150,:null =>false
        t.text     "summary",                 :null =>false
        t.string   "request_type_code",       :limit=>30
        t.string   "service_code",            :limit => 30
        t.integer  "requested_by"
        t.integer  "submitted_by"
        t.string   "impact_range_code",       :limit => 30
        t.string   "urgence_code",            :limit => 30
        t.integer  "contact_id"
        t.string   "contact_number",          :limit => 30
        t.string   "report_source_code",      :limit => 30
        t.string   "incident_status_code",    :limit => 30
        t.integer  "support_group_id"
        t.integer  "support_person_id"
        t.string   "close_reason_code",       :limit => 30
        t.datetime "submitted_date"
        t.string   "status_code",             :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_requests", ["submitted_by"], :name => "ICM_INCIDENT_REQUESTS_N1"
      add_index "icm_incident_requests", ["requested_by"], :name => "ICM_INCIDENT_REQUESTS_N2"
      add_index "icm_incident_requests", ["contact_id"], :name => "ICM_INCIDENT_REQUESTS_N3"
      add_index "icm_incident_requests", ["company_id"], :name => "ICM_INCIDENT_REQUESTS_N4"   

      create_table "icm_incident_journals", :force => true do |t|
        t.integer  "company_id"
        t.integer  "incident_request_id", :null=>false
        t.integer  "replied_by",          :null => false
        t.text     "message_body",        :null => false
        t.string   "status_code",         :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_journals", ["incident_request_id"], :name => "ICM_INCIDENT_JOURNALS_N1"
      add_index "icm_incident_journals", ["replied_by"], :name => "ICM_INCIDENT_JOURNALS_N2"

      create_table "icm_incident_histories", :force => true do |t|
        t.integer  "company_id"
        t.integer  "request_id"
        t.integer  "journal_id"
        t.string   "batch_number",        :limit => 30
        t.string   "property_key",        :limit => 60
        t.string   "old_value",           :limit => 60
        t.string   "new_value",           :limit => 60
        t.integer  "elapsed_time"
        t.string   "status_code",         :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_incident_histories", ["request_id"], :name => "ICM_INCIDENT_HISTORIES_N1"
      add_index "icm_incident_histories", ["journal_id"], :name => "ICM_INCIDENT_HISTORIES_N2"
  end

  def self.down
    drop_table :icm_incident_requests
    drop_table :icm_incident_journals
    drop_table :icm_incident_histories
  end
end
