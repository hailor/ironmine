class CreateIrmCurrencies < ActiveRecord::Migration
  def self.up
    create_table "irm_currencies", :force => true do |t|
        t.string   "currency_code",       :limit => 30,  :null => false
        t.integer  "precision"
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_currencies", ["currency_code"], :name => "IRM_CURRENCIES_U1"

      create_table "irm_currencies_tl", :force => true do |t|
        t.integer  "currency_id"
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

      add_index "irm_currencies_tl", ["currency_id", "language"], :name => "IRM_CURRENCIES_TL_U1"

      execute('CREATE OR REPLACE VIEW irm_currencies_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_currencies  t,irm_currencies_tl tl
                                             WHERE t.id = tl.currency_id')
  end

  def self.down
    drop_table :irm_currencies
    drop_table :irm_currencies_tl
  end
end
