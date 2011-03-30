class CreateUserLoginMapping < ActiveRecord::Migration
  def self.up
    create_table :uid_user_login_mappings do |t|
      t.integer :company_id
      t.string  :external_system_code,:limit=>30
      t.string  :external_login_name,:limit=>30
      t.integer :person_id,:limit=>30
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :uid_user_login_mappings
  end
end
