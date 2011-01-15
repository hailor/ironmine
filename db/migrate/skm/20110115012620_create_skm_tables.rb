class CreateSkmTables < ActiveRecord::Migration
  def self.up
    create_table "skm_entry_statuses", :force => true do |t|
      t.integer "company_id", :null => false
      t.string   "entry_status_code", :limit => 30, :null => false
      t.string  "visiable_flag", :limit => 1, :default => "Y"
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "skm_entry_statuses_tl", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_status_id", :null => false
      t.string "name", :limit => 60, :null => false
      t.string "description", :limit => 150
      t.string "language", :limit => 30, :null => false
      t.string "source_lang", :limit => 30, :null => false
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "skm_entry_statuses_tl", ["entry_status_id", "language"], :name => "SKM_ENTRY_STATUSES_TL_U1", :unique => true
    add_index "skm_entry_statuses_tl", ["entry_status_id"], :name => "SKM_ENTRY_STATUSES_TL_N1"

    execute('CREATE OR REPLACE VIEW skm_entry_statuses_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                           FROM skm_entry_statuses t,skm_entry_statuses_tl tl
                                           WHERE t.id = tl.entry_status_id')

    create_table "skm_entry_templates", :force => true do |t|
      t.integer "company_id", :null => false
      t.string   "entry_template_code", :limit => 30, :null => false
      t.string   "name", :limit => 60, :null => false
      t.string   "description", :limit => 150
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "skm_entry_template_elements", :force => true do |t|
      t.integer "company_id", :null => false
      t.string   "entry_template_element_code", :limit => 30, :null => false
      t.integer  "default_rows", :default => 4
      t.string  "name", :limit => 60, :null => false
      t.string  "description", :limit => 150
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "skm_entry_template_details", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_template_id", :null => false
      t.integer "entry_template_element_id", :null => false
      t.integer "line_num"
      t.string  "required_flag", :default => "N", :limit => 1
      t.integer "default_rows", :default => 4
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"      
    end

    create_table "skm_entry_headers", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_template_id", :null => false
      t.string  "entry_title", :null => false, :limit => 60
      t.string  "keyword_tags", :limit => 150
      t.string  "doc_number", :limit => 30
      t.string  "history_flag", :limit => 1, :default => "N"
      t.string  "entry_status_code", :limit => 30
      t.string  "version_number", :limit => 30
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"  
    end

    create_table "skm_entry_details", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_header_id", :null => false
      t.string "element_name", :limit => 60, :null => false
      t.string "element_description", :limit => 150
      t.integer "default_rows", :default => 4
      t.integer "entry_template_element_id"
      t.string  "entry_content"
      t.string  "required_flag", :limit => 1
      t.integer "line_num"
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"        
    end

    create_table "skm_entry_subjects", :force => true do |t|
      t.integer "company_id", :null => false
      t.integer "entry_header_id", :null => false
      t.integer "subject_id", :null => false
      t.string   "status_code", :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"            
    end
  end

  def self.down
    execute("DROP VIEW skm_entry_statuses_vl")
    drop_table :skm_entry_statuses
    drop_table :skm_entry_statuses_tl
    drop_table :skm_entry_templates
    drop_table :skm_entry_template_details
    drop_table :skm_entry_template_elements
    drop_table :skm_entry_headers
    drop_table :skm_entry_details
    drop_table :skm_entry_subjects
  end
end
