class CreateUidExternalSystems < ActiveRecord::Migration

  def self.up
    create_table "uid_external_systems", :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.string   "external_system_code",:limit=>30
      t.string   "external_hostname",:limit=>150
      t.string   "external_ip_address",:limit=>30
      t.string   "status_code",        :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "uid_external_systems", ["company_id","external_system_code"], :name => "UID_EXTERNAL_SYSTEMS_N1"

    create_table :uid_external_systems_tl , :force => true do |t|
      t.integer  "company_id",              :null=> false
      t.integer :external_system_id
      t.string :system_name,:limit=>30
      t.string :system_description,:limit=>150,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "uid_external_systems_tl", ["external_system_id","language"], :name => "UID_EXTERNAL_SYSTEMS_TL_N1"

  end

  def self.down
    drop_table :uid_external_systems
    drop_table :uid_external_systems_tl
  end
end
