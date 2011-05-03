class CreateIrmRecentlyObjects < ActiveRecord::Migration
  def self.up
    create_table :irm_recently_objects do |t|
      t.integer :company_id, :null => false
      t.string :source_type, :limit => 30
      t.integer :source_id
      t.string :status_code, :limit => 30, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :irm_recently_objects
  end
end
