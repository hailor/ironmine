class CreateIrmScripts < ActiveRecord::Migration
  def self.up
    create_table "irm_scripts", :force => true do |t|
      t.string   "entity_code",       :limit => 30, :null => false
      t.string   "condition_code",    :limit => 60, :null => false
      t.string   "action_code",       :limit => 60, :null => false
      t.string   "template_code",     :limit => 60, :null => false
      t.string   "status_code",       :limit => 30, :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_scripts", ["entity_code", "condition_code", "action_code", "template_code"], :name => "IRM_SCRIPTS_N1"

    create_table "irm_scripts_tl", :force => true do |t|
      t.integer  "script_id"
      t.string   "language",          :limit => 30,  :null => false
      t.string   "description",       :limit => 240, :null => false
      t.string   "source_lang",       :limit => 30,  :null => false
      t.string   "status_code",       :limit => 30, :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_scripts_tl", ["script_id", "language"], :name => "IRM_SCRIPTS_TL_U1", :unique => true
    add_index "irm_scripts_tl", ["script_id"], :name => "IRM_SCRIPTS_TL_N1"
  end

  def self.down
    drop_table :irm_scripts
    drop_table :irm_scripts_tl
  end
end
