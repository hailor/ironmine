class CreateModuleCloseReasonTables < ActiveRecord::Migration
def self.up
      create_table "icm_close_reasons", :force => true do |t|
        t.integer  "company_id",    :null => false
        t.string   "close_code",    :limit => 30, :null => false
        t.integer  "category_id",  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_close_reasons", ["close_code"], :name => "ICM_CLOSE_REASONS_N1"

      create_table "icm_close_reasons_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "close_reason_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150
        t.string   "description",       :limit => 240
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "icm_close_reasons_tl", ["close_reason_id", "language"], :name => "ICM_CLOSE_REASONS_TL_U1", :unique => true
      add_index "icm_close_reasons_tl", ["close_reason_id"], :name => "ICM_CLOSE_REASONS_TL_N1"

      execute('CREATE OR REPLACE VIEW icm_close_reasons_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM icm_close_reasons t,icm_close_reasons_tl tl
                                             WHERE t.id = tl.close_reason_id')
  end

  def self.down
    drop_table :icm_close_reasons
    drop_table :icm_close_reasons_tl
    execute('drop view icm_close_reasons_vl')
  end
end
