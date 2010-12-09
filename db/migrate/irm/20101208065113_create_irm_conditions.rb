class CreateIrmConditions < ActiveRecord::Migration
  def self.up
    create_table "irm_conditions", :force => true do |t|
        t.string   "entity_code",       :limit => 30, :null => false
        t.string   "condition_code",    :limit => 60, :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_conditions", ["entity_code", "condition_code"], :name => "IRM_CONDITIONS_N1"

      create_table "irm_conditions_tl", :force => true do |t|
        t.integer  "condition_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150, :null => false
        t.string   "description",       :limit => 240, :null => false
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_conditions_tl", ["condition_id", "language"], :name => "IRM_CONDITIONS_TL_U1", :unique => true
      add_index "irm_conditions_tl", ["condition_id"], :name => "IRM_CONDITIONS_TL_N1"

      execute('CREATE OR REPLACE VIEW irm_conditions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_conditions t,irm_conditions_tl tl
                                             WHERE t.id = tl.condition_id')
  end

  def self.down
    drop_table :irm_conditions
    drop_table :irm_conditions_tl
  end
end
