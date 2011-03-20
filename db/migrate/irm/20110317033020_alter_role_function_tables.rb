class AlterRoleFunctionTables < ActiveRecord::Migration
  def self.up
    remove_column(:irm_roles,:role_type)
    remove_column(:irm_roles,:menu_code)
    execute('CREATE OR REPLACE VIEW irm_roles_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_roles  t,irm_roles_tl tl
                                             WHERE t.id = tl.role_id')
    create_table "irm_role_functions", :force => true do |t|
      t.integer  "company_id",:null => false
      t.integer  "role_id",:null => false
      t.integer  "function_id",:null => false
      t.string   "status_code", :limit => 30, :default => "ENABLED", :null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end
  end

  def self.down
    add_column(:irm_roles,:role_type,:string,:limit=>30)
    add_column(:irm_roles,:menu_code,:string,:limit=>30)
    execute('CREATE OR REPLACE VIEW irm_roles_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_roles  t,irm_roles_tl tl
                                             WHERE t.id = tl.role_id')
    drop_table :irm_role_functions
  end
end
