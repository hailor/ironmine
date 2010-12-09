class CreateIrmActions < ActiveRecord::Migration
  def self.up
    create_table "irm_actions", :force => true do |t|
        t.string   "entity_code",       :limit => 30
        t.string   "action_code",       :limit => 30,                   :null => false
        t.string   "handler",           :limit => 240
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_actions", ["action_code"], :name => "IRM_ACTIONS_U1", :unique => true

      create_table "irm_actions_tl", :force => true do |t|
        t.integer  "action_id"
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

      add_index "irm_actions_tl", ["action_id", "language"], :name => "IRM_ACTIONS_TL_U1", :unique => true
      add_index "irm_actions_tl", ["action_id"], :name => "IRM_ACTIONS_TL_N1"

      execute('CREATE OR REPLACE VIEW irm_actions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_actions t,irm_actions_tl tl
                                             WHERE t.id = tl.action_id')
  end

  def self.down
    drop_table :irm_actions
    drop_table :irm_actions_tl
  end
end
