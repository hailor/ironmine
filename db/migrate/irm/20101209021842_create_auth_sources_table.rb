class CreateAuthSourcesTable < ActiveRecord::Migration
  def self.up
    create_table :irm_auth_sources do |t|
      t.integer "company_id", :null => false
      t.string   "type", :limit=>30, :null => false
      t.string   "name", :limit=>150, :null => false
      t.string   "host", :limit=>150
      t.integer  "post"
      t.string   "account", :limit => 60
      t.string   "account_password", :limit => 60
      t.string   "base_dn", :limit => 255
      t.string   "attr_login", :limit => 60
      t.string   "attr_firstname", :limit => 60
      t.string   "attr_lastname", :limit => 60
      t.string   "attr_email", :limit => 60
      t.string   "onthefly_register_flag", :limit=> 1, :default => "N"
      t.string   "status_code", :limit => 30, :default => "ENABLED", :null => false
      t.integer  "created_by", :null => false
      t.integer  "updated_by", :null => false
      t.datetime "created_at", :null => false
      t.datetime "updated_at", :null => false
    end
  end

  def self.down
    drop_table :irm_auth_sources
  end
end
