class CreateWfFieldUpdates < ActiveRecord::Migration
  def self.up
    create_table :irm_wf_field_updates,:force=>true do |t|
      t.integer  "company_id",           :null => false
      t.string :bo_code,:limit=>30,:null=>false
      t.string :name, :limit => 60, :null => false
      t.string :field_update_code,:limit=>30,:null=>false
      t.string :description, :limit => 150
      t.string :relation_bo,:limit=>30
      t.string :object_attribute,:limit=>30,:null=>false
      t.string :value_type,:limit=>30,:null=>false
      t.string :value,:limit=>150
      t.string   "status_code",:limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    drop_table :irm_wf_field_updates
  end
end
