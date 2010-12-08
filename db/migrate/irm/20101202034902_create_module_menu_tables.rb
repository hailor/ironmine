class CreateModuleMenuTables < ActiveRecord::Migration
  def self.up
    create_table "irm_menus", :force => true do |t|
      t.string   "menu_code",         :limit => 30,:null => false
      t.string   "icon",             :limit => 30
      t.string   "status_code",       :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_menus", ["menu_code"],:name => "IRM_MENUS_U1",:unique=>true

    create_table "irm_menus_tl", :force => true do |t|
      t.integer   "menu_id",       :null=>false
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

    add_index "irm_menus_tl", ["menu_id", "language"], :name => "IRM_MENUS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_menus_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menus  t,irm_menus_tl tl
                                             WHERE t.id = tl.menu_id')

    create_table "irm_menu_entries", :force => true do |t|
      t.string   "menu_code",        :limit=>30
      t.string   "sub_menu_code",    :limit=>30
      t.string   "permission_code",  :limit=>30
      t.string   "parameter_value",  :limit=>300
      t.integer  "display_sequence",  :default => 10
      t.string   "display_flag",     :limit=>1,:default=>"Y"
      t.string   "status_code",      :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_menu_entries", ["menu_code","sub_menu_code"],:name => "IRM_MENU_ENTRIES_U1",:unique=>true
    add_index "irm_menu_entries", ["menu_code","permission_code"],:name => "IRM_MENU_ENTRIES_N1"

    create_table "irm_menu_entries_tl", :force => true do |t|
      t.integer   "menu_entry_id",       :null=>false
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

    add_index "irm_menu_entries_tl", ["menu_entry_id", "language"], :name => "IRM_MENU_ENTRIES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_menu_entries_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menu_entries  t,irm_menu_entries_tl tl
                                             WHERE t.id = tl.menu_entry_id')
  end

  def self.down
    drop_table :irm_menus
    drop_table :irm_menus_tl
    execute('drop view irm_menus_vl')
    drop_table :irm_menu_entries
    drop_table :irm_menu_entries_tl
    execute('drop view irm_menu_entries_vl')
  end
end
