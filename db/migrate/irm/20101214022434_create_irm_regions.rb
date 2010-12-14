class CreateIrmRegions < ActiveRecord::Migration
  def self.up
      create_table "irm_regions", :force => true do |t|
        t.string   "region_code",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_regions", ["region_code"], :name => "IRM_REGIONS_U1"

      create_table "irm_regions_tl", :force => true do |t|
        t.integer  "region_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150, :null => false
        t.string   "description",       :limit => 240
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_regions_tl", ["region_id", "language"], :name => "IRM_REGIONS_TL_U1"

      execute('CREATE OR REPLACE VIEW irm_regions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_regions  t,irm_regions_tl tl
                                             WHERE t.id = tl.region_id')
  end

  def self.down
    drop_table :irm_regions
    drop_table :irm_regions_tl
  end
end
