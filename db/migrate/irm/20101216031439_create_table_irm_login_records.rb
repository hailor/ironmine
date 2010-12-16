class CreateTableIrmLoginRecords < ActiveRecord::Migration
  def self.up
   create_table "irm_login_records", :force => true do |t|
      t.integer  "identity_id", :null => false
      t.string   "session_id",  :limit => 60,  :null => false
      t.string  "user_ip",      :limit => 60
      t.string   "user_agent",  :limit => 1000
      t.datetime "login_at"
      t.datetime "logout_at"
      t.string   "status_code",  :limit => 30,  :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
   end    
  end

  def self.down
    drop_table :irm_login_records
  end
end
