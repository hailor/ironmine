class CreateRolesTables < ActiveRecord::Migration
  def self.up
    create_table "irm_roles", :force => true do |t|
      t.integer  :company_id, :null => false
      t.string :role_code, :limit => 30, :null => false
      t.string :menu_code, :limit => 30
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_roles", ["role_code"], :name => "IRM_ROLES_N1"
    create_table "irm_roles_tl", :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :role_id, :null => false
      t.string :name, :limit => 60, :null => false
      t.string :description, :limit => 150,  :null => false
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.string :language, :limit => 30
      t.string :source_lang, :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at      
    end
    add_index "irm_roles_tl", ["role_id", "language"], :name => "IRM_ROLES_TL_U1", :unique => true
    execute('CREATE OR REPLACE VIEW irm_roles_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_roles  t,irm_roles_tl tl
                                             WHERE t.id = tl.role_id')    
  end

  def self.down
    execute('drop view irm_roles_vl')
    drop_table :irm_roles
    drop_table :irm_roles_tl
  end
end
