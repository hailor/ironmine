class CreateModuleUrgenceTables < ActiveRecord::Migration
  def self.up
    create_table "icm_urgence_codes", :force => true do |t|
        t.integer  "company_id",     :null => false
        t.string   "urgency_code",    :limit => 60, :null => false
        t.integer  "weight_values",  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_urgence_codes", ["urgency_code"], :name => "ICM_URGENCE_CODES_N1"

      create_table "icm_urgence_codes_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "urgence_code_id"
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

      add_index "icm_urgence_codes_tl", ["urgence_code_id", "language"], :name => "ICM_URGENCE_CODES_TL_U1", :unique => true
      add_index "icm_urgence_codes_tl", ["urgence_code_id"], :name => "ICM_URGENCE_CODES_TL_N1"

      execute('CREATE OR REPLACE VIEW icm_urgence_codes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_urgence_codes t,icm_urgence_codes_tl tl
                                             WHERE t.id = tl.urgence_code_id')
  end

  def self.down
    drop_table :icm_urgence_codes
    drop_table :icm_urgence_codes_tl
    execute('drop view icm_urgence_codes_vl')
  end
end
