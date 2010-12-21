class CreateTableIcmRuleSettings < ActiveRecord::Migration
  def self.up
    create_table "icm_rule_settings", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "description",             :limit => 150
      t.string   "report_date_changable",   :limit => 1,:default=>"N"
      t.string   "respond_date_changable",  :limit => 1,:default=>"N"
      t.string   "slove_date_changable",    :limit => 1,:default=>"N"
      t.string   "auto_assignable",       :limit => 1,:default=>"N"
      t.string   "assignment_process_code", :limit => 30,:null=>false
      t.integer  "auto_closure_days",:default=>"5"
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "icm_rule_settings", ["company_id","assignment_process_code"], :name => "ICM_RULE_SETTINGS_U1", :unique => true
  end

  def self.down
    drop_table :icm_rule_settings
  end
end
