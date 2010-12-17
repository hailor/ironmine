class CreateModuleFunctionTables < ActiveRecord::Migration
  def self.up
     create_table "irm_permissions", :force => true do |t|
      t.string   "product_id",        :limit => 30,:null => false
      t.string   "permission_code",   :limit => 30,:null => false
      t.string   "permission_type",   :limit => 30
      t.string   "page_controller",   :limit => 30
      t.string   "page_action",       :limit => 30
      t.string   "status_code",       :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_permissions", ["permission_code"],:name => "IRM_PERMISSIONS_U1",:unique=>true

    create_table "irm_permissions_tl", :force => true do |t|
      t.integer   "permission_id", :null=>false
      t.string    "name",          :limit=>60,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_permissions_tl", ["permission_id", "language"], :name => "IRM_PERMISSIONS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_permissions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_permissions  t,irm_permissions_tl tl
                                             WHERE t.id = tl.permission_id')


    create_table "irm_functions", :force => true do |t|
      t.string   "function_code",   :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_functions", ["function_code"],:name => "IRM_FUNCTIONS_U1",:unique=>true

    create_table "irm_functions_tl", :force => true do |t|
      t.integer   "function_id",   :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_functions_tl", ["function_id", "language"], :name => "IRM_FUNCTIONS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_functions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_functions  t,irm_functions_tl tl
                                             WHERE t.id = tl.function_id')

    create_table "irm_function_members", :force => true do |t|
      t.string   "function_code",   :limit => 30,:null => false
      t.string   "permission_code", :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_function_members", ["function_code","permission_code"],:name => "IRM_FUNCTION_MEMBERS_U1",:unique=>true

    create_table "irm_function_groups", :force => true do |t|
      t.string   "group_code",   :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_function_groups", ["group_code"],:name => "IRM_FUNCTION_GROUPS_U1",:unique=>true

    create_table "irm_function_groups_tl", :force => true do |t|
      t.integer   "function_group_id",   :null=>false
      t.string    "name",          :limit=>30,:null=>false
      t.string    "description",   :limit=>150
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_function_groups_tl", ["function_group_id", "language"], :name => "IRM_FUNCTION_GROUPS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_function_groups_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_function_groups t,irm_function_groups_tl tl
                                             WHERE t.id = tl.function_group_id')

    create_table "irm_function_group_members", :force => true do |t|
      t.string   "group_code",      :limit => 30,:null => false
      t.string   "function_code",   :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_function_group_members", ["function_code","group_code"],:name => "IRM_FUNCTION_GROUP_MEMBERS_U1",:unique=>true
  end

  def self.down
    drop_table :irm_permissions
    drop_table :irm_permissions_tl
    execute('drop view irm_permissions_vl')
    drop_table :irm_functions
    drop_table :irm_functions_tl
    execute('drop view irm_functions_vl')
    drop_table :irm_function_members
    drop_table :irm_function_groups
    drop_table :irm_function_groups_tl
    execute('drop view irm_function_groups_vl')
    drop_table :irm_function_group_members
  end
end
