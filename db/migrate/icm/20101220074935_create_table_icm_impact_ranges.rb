class CreateTableIcmImpactRanges < ActiveRecord::Migration
  def self.up
    create_table "icm_impact_ranges", :force => true do |t|
        t.integer  "company_id",    :limit => 30, :null => false
        t.string   "impact_code",    :limit => 60, :null => false
        t.integer  "weight_values",  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_impact_ranges", ["impact_code"], :name => "ICM_IMPACT_RANGES_N1"

      create_table "icm_impact_ranges_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "impact_range_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150, :null => false
        t.string   "description",       :limit => 240
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_impact_ranges_tl", ["impact_range_id", "language"], :name => "ICM_IMPACT_RANGES_TL_U1", :unique => true
      add_index "icm_impact_ranges_tl", ["impact_range_id"], :name => "ICM_IMPACT_RANGES_TL_N1"

      execute('CREATE OR REPLACE VIEW icm_impact_ranges_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_impact_ranges t,icm_impact_ranges_tl tl
                                             WHERE t.id = tl.impact_range_id')
  end

  def self.down
    drop_table :icm_impact_ranges
    drop_table :icm_impact_ranges_tl
    execute('drop view icm_impact_ranges_vl')
  end
end
