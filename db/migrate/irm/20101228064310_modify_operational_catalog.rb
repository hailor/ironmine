class ModifyOperationalCatalog < ActiveRecord::Migration
  def self.up
    execute("drop view irm_operational_catalogs_vl")
    remove_column :irm_operational_catalogs, :catalog_code
    remove_column :irm_operational_catalogs, :catalog_type
    drop_table :irm_operational_catalogs_tl
    drop_table :irm_op_catalog_accesses
  end

  def self.down
    add_column :irm_operational_catalogs, :catalog_code, :string, :limit => 30, :after => company_id
    add_column :irm_operational_catalogs, :catalog_type, :string, :limit => 30, :after => company_id
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

    create_table "irm_operational_catalogs_tl", :force => true do |t|
      t.integer   "company_id",       :null=>false
      t.integer   "operational_catalog_id", :null=>false
      t.string    "name", :limit => 150, :null => false
      t.string    "description",   :limit=>240
      t.string    "language",      :limit=>30, :null => false
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end    
  end
end
