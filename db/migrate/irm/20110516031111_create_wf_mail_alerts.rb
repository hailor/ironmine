class CreateWfMailAlerts < ActiveRecord::Migration
  def self.up
   create_table :irm_wf_mail_alerts do |t|
      t.integer "company_id",       :null => false
      t.string  "name",             :null => false,:limit=>60
      t.string  "mail_alert_code",  :null => false,:limit=>30
      t.string  "bo_code",          :null => false,:limit=>30
      t.string  "description",      :limit => 150
      t.string  "mail_template_code",:null => false,:limit=>30
      t.string  "additional_email", :limit => 250
      t.string  "from_email",       :limit => 150
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table :irm_wf_mail_recipients do |t|
      t.integer "company_id",       :null => false
      t.integer "wf_mail_alert_id", :null => false
      t.string  "recipient_type",   :null => false,:limit=>30
      t.string  "recipient_id",    :null => false ,:limit=>30
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :irm_wf_mail_alerts
    drop_table :irm_wf_mail_recipients
  end
end
