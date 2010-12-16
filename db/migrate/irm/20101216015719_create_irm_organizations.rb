class CreateIrmOrganizations < ActiveRecord::Migration
  def self.up
      create_table "irm_organizations", :force => true do |t|
        t.integer  "company_id"
        t.string   "short_name",       :limit => 30,  :null => false        
        t.string   "status_code",       :limit => 30,  :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_organizations", ["company_id","short_name"], :name => "IRM_ORGANIZATIONS_U1"

      create_table "irm_organizations_tl", :force => true do |t|
        t.integer  "organization_id"
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

      add_index "irm_organizations_tl", ["organization_id", "language"], :name => "IRM_ORGANIZATIONS_TL_U1"

      execute('CREATE OR REPLACE VIEW irm_organizations_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_organizations  t,irm_organizations_tl tl
                                             WHERE t.id = tl.organization_id')
  end

  def self.down
    drop_table :irm_organizations
    drop_table :irm_organizations_tl
  end
end
