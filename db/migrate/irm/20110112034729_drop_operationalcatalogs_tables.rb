class DropOperationalcatalogsTables < ActiveRecord::Migration
  def self.up
    drop_table :irm_operational_catalogs
  end

  def self.down
    create_table "irm_operational_catalogs", :force => true do |t|
      t.integer "company_id", :null => false
      t.string  "segment1", :limit => 30
      t.string  "segment2", :limit => 30
      t.string  "segment3", :limit => 30
      t.string  "concact_segment", :limit => 90
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end        
  end
end
