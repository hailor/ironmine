class CreateWfSettings < ActiveRecord::Migration
  def self.up
    create_table "irm_wf_settings", :force => true do |t|
      t.integer  "company_id",           :null => false
      t.integer "default_workflow_person_id"
      t.string  "email_approval_flag",:limit => 1, :null => false, :default => "N"
      t.string   "status_code",:limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :irm_wf_settings
  end
end
