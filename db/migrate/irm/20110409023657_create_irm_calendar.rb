class CreateIrmCalendar < ActiveRecord::Migration
  def self.up
    if table_exists?("irm_calendars")
      drop_table :irm_calendars
    end
    create_table :irm_calendars do |t|
      t.integer  :company_id
      t.integer :assigned_to
      t.string :current, :limit => 1
      t.string :name, :limit => 150, :null => false
      t.string :description, :limit => 3000
      t.string   :status_code,:limit => 30,:null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :irm_calendars
  end
end
