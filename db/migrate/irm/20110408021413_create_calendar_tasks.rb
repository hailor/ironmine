class CreateCalendarTasks < ActiveRecord::Migration
  def self.up
    if table_exists?("irm_calendar_tasks")
      drop_table :irm_calendar_tasks
    end
    create_table :irm_calendar_tasks do |t|
      t.integer  :company_id
      t.integer :owner_id
      t.string :name, :limit => 150, :null => false
      t.string :description, :limit => 3000
      t.datetime :start_at
      t.datetime :end_at
      t.datetime :completed
      t.integer :percent_complete
      t.integer :priority
      t.text :url
      t.boolean :all_day, :default => false
      t.string :color, :limit => 30
      t.string :source_type, :limit => 30
      t.integer :source_id
      t.string   :status_code,:limit => 30,:null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :irm_calendar_tasks
  end
end
