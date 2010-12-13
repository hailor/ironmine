class CreateIrmMailTemplates < ActiveRecord::Migration
  def self.up
    create_table "irm_mail_templates", :force => true do |t|
        t.string   "entity_code",       :limit => 30,  :null => false
        t.string   "template_code",     :limit => 30,  :null => false
        t.string   "template_type",     :limit => 30
        t.string   "from",              :limit => 150
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_mail_templates", ["entity_code", "template_code"], :name => "IRM_MAIL_TEMPLATES_N1"

      create_table "irm_mail_templates_tl", :force => true do |t|
        t.integer  "template_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150, :null => false
        t.string   "description",       :limit => 240
        t.string   "subject",           :limit => 150, :null => false
        t.text     "mail_body",                        :null => false
        t.text     "parsed_template"
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_mail_templates_tl", ["template_id", "language"], :name => "IRM_MAIL_TEMPLATES_TL_N1"

     execute('CREATE OR REPLACE VIEW irm_mail_templates_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_mail_templates  t,irm_mail_templates_tl tl
                                             WHERE t.id = tl.template_id')
     execute('CREATE OR REPLACE VIEW irm_scripts_vl AS SELECT t.*,tl.id lang_id,tl.description,tl.language,tl.source_lang
                                             FROM irm_scripts  t,irm_scripts_tl tl
                                             WHERE t.id = tl.script_id')
  end

  def self.down
    drop_table :irm_mail_templates
    drop_table :irm_mail_templates_tl
    execute('drop view irm_mail_templates_vl')
    execute('drop view irm_scripts_vl')
  end
end
