class AddSkmSettingTable < ActiveRecord::Migration
  def self.up
    create_table "skm_settings", :force => true do |t|
      t.integer "company_id", :null => false
      t.string "sidebar_file_menu_flag", :limit => 1, :null => false, :default => "N"
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
  end
end
