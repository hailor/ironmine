class CreateEventModuleTables < ActiveRecord::Migration
  def self.up
    create_table "irm_events", :force => true do |t|
      t.integer  "company_id"
      t.string   "event_code",        :limit => 30, :null => false
      t.text   "params"
      t.datetime "end_at"
      t.string   "last_error"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_events", ["event_code"], :name => "IRM_EVENTS_N1"

    create_table "delayed_jobs", :force => true do |t|
      t.integer  "priority",          :default => 0
      t.integer  "attempts",          :default => 0
      t.text     "handler"
      t.text     "last_error"
      t.datetime "run_at"
      t.datetime "locked_at"
      t.datetime "failed_at"
      t.string   "locked_by"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
    add_index "delayed_jobs", [:priority, :run_at], :name => "DELAYED_JOBS_N1"
  end

  def self.down
    drop_table :irm_events
    drop_table :delayed_jobs
  end
end
