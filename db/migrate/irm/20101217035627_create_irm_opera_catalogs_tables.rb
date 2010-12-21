class CreateIrmOperaCatalogsTables < ActiveRecord::Migration
  def self.up
    create_table "irm_operational_catalogs", :force => true do |t|
      t.integer "company_id", :null => false
      t.string   "catalog_code", :limit => 30,:null => false
      t.string   "catalog_type", :limit => 30
      t.string  "segment1", :limit => 30
      t.string "segment2", :limit => 30
      t.string "segment3", :limit => 30
      t.string "concact_segment", :limit => 90
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_operational_catalogs", ["catalog_code"],:name => "IRM_OPERATIONAL_CATALOGS_U1",:unique=>true

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

    add_index "irm_operational_catalogs_tl", ["operational_catalog_id", "language"], :name => "IRM_OPERATIONAL_CATALOGS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_operational_catalogs_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_operational_catalogs  t,irm_operational_catalogs_tl tl
                                             WHERE t.id = tl.operational_catalog_id')
  end

  def self.down
    execute('drop view irm_operational_catalogs_vl')
    drop_table :irm_operational_catalogs
    drop_table :irm_operational_catalogs_tl
  end
end
