class CreateIrmSupportGroups < ActiveRecord::Migration
  def self.up
    create_table "irm_support_groups", :force => true do |t|
        t.integer  "company_id"
        t.integer  "organization_id"
        t.string   "group_code",       :limit => 30,  :null => false
        t.string   "support_role_code",       :limit => 30,  :null => false
        t.string   "vendor_group_flag",       :limit => 1,  :null => false,:default=>'N'
        t.string   "oncall_group_flag",       :limit => 1,  :null => false,:default=>'N'
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_support_groups", ["company_id","organization_id","group_code"], :name => "IRM_SUPPORT_GROUPS_N1"

      create_table "irm_support_groups_tl", :force => true do |t|
        t.integer  "support_group_id"
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

      add_index "irm_support_groups_tl", ["support_group_id", "language"], :name => "IRM_SUPPORT_GROUPS_TL_U1"

      execute('CREATE OR REPLACE VIEW irm_support_groups_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_support_groups  t,irm_support_groups_tl tl
                                             WHERE t.id = tl.support_group_id')
  end

  def self.down
    drop_table :irm_support_groups
    drop_table :irm_support_groups_tl
    execute("drop view irm_support_groups_vl")
  end
end
