class ModifyScriptModuleTables < ActiveRecord::Migration
  def self.up
    remove_column :irm_scripts,:entity_code
    execute('CREATE OR REPLACE VIEW irm_scripts_vl AS SELECT t.*,tl.id lang_id,tl.description,tl.language,tl.source_lang
                                             FROM irm_scripts  t,irm_scripts_tl tl
                                             WHERE t.id = tl.script_id')
    remove_column :irm_actions,:entity_code
    execute('CREATE OR REPLACE VIEW irm_actions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_actions  t,irm_actions_tl tl
                                             WHERE t.id = tl.action_id')
    rename_column :irm_conditions,:entity_code,:context_code
    execute('CREATE OR REPLACE VIEW irm_conditions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_conditions  t,irm_conditions_tl tl
                                             WHERE t.id = tl.condition_id')
    rename_column :irm_mail_templates,:entity_code,:context_code
    execute('CREATE OR REPLACE VIEW irm_mail_templates_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.subject,tl.mail_body,tl.parsed_template,tl.description,tl.language,tl.source_lang
                                             FROM irm_mail_templates  t,irm_mail_templates_tl tl
                                             WHERE t.id = tl.template_id')

    create_table "irm_script_contexts", :force => true do |t|
      t.integer  "company_id", :null => false
      t.string   "context_code",:limit=>30,:null=>false
      t.string   "status_code", :limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_script_contexts", ["context_code"], :name => "IRM_SCRIPT_CONTEXTS_U1",:unique => true

    create_table "irm_script_contexts_tl", :force => true do |t|
      t.integer  "company_id"
      t.integer  "script_context_id"
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

    add_index "irm_script_contexts_tl", ["script_context_id", "language"], :name => "IRM_SCRIPT_CONTEXTS_TL_U1", :unique => true
    add_index "irm_script_contexts_tl", ["script_context_id"], :name => "IRM_SCRIPT_CONTEXTS_TL_N1"

    execute('CREATE OR REPLACE VIEW irm_script_contexts_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_script_contexts t,irm_script_contexts_tl tl
                                             WHERE t.id = tl.script_context_id')

    create_table "irm_script_context_fields", :force => true do |t|
      t.integer  "company_id", :null => false
      t.string   "context_code",:limit=>30,:null=>false
      t.string   "field_key", :limit=>30,:null=>false
      t.string   "status_code", :limit => 30, :null => false, :default => "ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_script_contexts", ["context_code"], :name => "IRM_SCRIPT_CONTEXT_FIELDS_U1",:unique => true

    create_table "irm_script_context_fields_tl", :force => true do |t|
      t.integer  "company_id"
      t.integer  "script_context_field_id"
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

    add_index "irm_script_context_fields_tl", ["script_context_field_id", "language"], :name => "IRM_SCRIPT_CONTEXT_FIELDS_TL_U1", :unique => true
    add_index "irm_script_context_fields_tl", ["script_context_field_id"], :name => "IRM_SCRIPT_CONTEXT_FIELDS_TL_N1"

    execute('CREATE OR REPLACE VIEW irm_script_context_fields_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_script_context_fields t,irm_script_context_fields_tl tl
                                             WHERE t.id = tl.script_context_field_id')
  end

  def self.down
    add_column :irm_scripts,:entity_code,:limit=>30,:null=>false
    execute('CREATE OR REPLACE VIEW irm_scripts_vl AS SELECT t.*,tl.id lang_id,tl.description,tl.language,tl.source_lang
                                             FROM irm_scripts  t,irm_scripts_tl tl
                                             WHERE t.id = tl.script_id')
    add_column :irm_actions,:entity_code,:limit=>30,:null=>false
    execute('CREATE OR REPLACE VIEW irm_actions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_actions  t,irm_actions_tl tl
                                             WHERE t.id = tl.action_id')
    rename_column :irm_conditions,:context_code,:entity_code
    execute('CREATE OR REPLACE VIEW irm_conditions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_conditions  t,irm_conditions_tl tl
                                             WHERE t.id = tl.condition_id')
    rename_column :irm_mail_templates,:context_code,:entity_code
    execute('CREATE OR REPLACE VIEW irm_mail_templates_vl AS SELECT t.*,tl.id lang_id,tl.name,t.subject,t.mail_body,t.parsed_template,tl.description,tl.language,tl.source_lang
                                             FROM irm_mail_templates  t,irm_mail_templates_tl tl
                                             WHERE t.id = tl.template_id')
    drop_table :irm_script_contexts
    drop_table :irm_script_contexts_tl
    execute('drop view irm_script_contexts_vl')
    drop_table :irm_script_context_fields
    drop_table :irm_script_context_fields_tl
    execute('drop view irm_script_context_fields_vl')
  end
end
