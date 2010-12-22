class CreateOpCatalogAccessTables < ActiveRecord::Migration
  def self.up
    create_table "irm_op_catalog_accesses", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "catalog_id", :null => false
      t.string  "icm_flag", :limit => 1, :default => "N"
      t.string  "csi_flag", :limit => 1, :default => "N"
      t.string  "skm_flag", :limit => 1, :default => "N"
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end    
  end

  def self.down
    drop_table :irm_op_catalog_accesses
  end
end
