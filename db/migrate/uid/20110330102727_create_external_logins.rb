class CreateExternalLogins < ActiveRecord::Migration
  def self.up
    create_table :uid_external_logins do |t|
      t.integer :company_id
      t.string :external_system_code,:limit=>30
      t.string :external_login_name,:limit=>60
      t.integer :external_login_id
      t.date :active_start_date
      t.date :active_end_date
      t.string :source_type,:limit=>30
      t.string :description,:limit=>300
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "uid_external_logins", ["company_id","external_system_code","external_login_name","external_login_id"],
              :name => "UID_EXTERNAL_LOGINS_N1"

  end

  def self.down
    drop_table :uid_external_logins
  end
end
