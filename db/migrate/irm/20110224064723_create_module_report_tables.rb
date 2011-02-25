class CreateModuleReportTables < ActiveRecord::Migration
  def self.up
    create_table "irm_reports", :force => true do |t|
        t.integer  "company_id",       :null => false
        t.string   "report_code",      :limit => 30, :null => false
        t.string  "permission_code",  :limit => 30, :null => false
        t.string  "category_code",    :limit => 30, :null => false
        t.string   "status_code",      :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_reports", ["report_code"], :name => "IRM_REPORTS_U1",:unique => true

      create_table "irm_reports_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "report_id"
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

      add_index "irm_reports_tl", ["report_id", "language"], :name => "IRM_REPORTS_TL_U1", :unique => true
      add_index "irm_reports_tl", ["report_id"], :name => "IRM_REPORTS_TL_N1"

      execute('CREATE OR REPLACE VIEW irm_reports_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_reports t,irm_reports_tl tl
                                             WHERE t.id = tl.report_id')

    create_table "irm_report_groups", :force => true do |t|
        t.integer  "company_id",       :null => false
        t.string   "group_code",       :limit => 30, :null => false
        t.string   "status_code",      :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_report_groups", ["group_code"], :name => "IRM_REPORT_GROUPS_U1",:unique => true

      create_table "irm_report_groups_tl", :force => true do |t|
        t.integer  "company_id"
        t.integer  "report_group_id"
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

      add_index "irm_report_groups_tl", ["report_group_id", "language"], :name => "IRM_REPORT_GROUPS_TL_U1", :unique => true
      add_index "irm_report_groups_tl", ["report_group_id"], :name => "IRM_REPORT_GROUPS_TL_N1"

      execute('CREATE OR REPLACE VIEW irm_report_groups_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_report_groups t,irm_report_groups_tl tl
                                             WHERE t.id = tl.report_group_id')

      create_table "irm_report_group_members", :force => true do |t|
        t.integer  "company_id",       :null => false
        t.string   "group_code",       :limit => 30, :null => false
        t.string   "report_code",      :limit => 30, :null => false
        t.integer  "display_sequence", :default=>10
        t.string   "status_code",      :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_report_group_members", ["group_code", "report_code"], :name => "IRM_REPORT_GROUP_MEMBERS_U1", :unique => true


  end

  def self.down
    drop_table :irm_reports
    drop_table :irm_reports_tl
    execute('drop view irm_reports_vl')
    drop_table :irm_report_groups
    drop_table :irm_report_groups_tl
    execute('drop view irm_report_groups_vl')
    drop_table :irm_report_group_members

  end
end
