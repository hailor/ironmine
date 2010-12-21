class ModifyFlexValueTables < ActiveRecord::Migration
  def self.up
    execute('drop view irm_value_sets_vl')
    execute('drop view irm_flex_values_vl')   
    drop_table :irm_value_sets_tl
    drop_table :irm_value_sets
    drop_table :irm_flex_values
    drop_table :irm_flex_values_tl
    
    create_table "irm_flex_value_sets", :force => true do |t|
      t.string   "flex_value_set_name",  :limit => 150,  :null=>false
      t.string    "description",   :limit=>240
      t.string  "validation_type", :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    create_table "irm_flex_values", :force => true do |t|
      t.integer "flex_value_set_id", :null => false
      t.string  "flex_value", :limit => 30, :null => false
      t.integer  "display_sequence", :default => 10
      t.datetime   "start_date_active"
      t.datetime   "end_date_active"
      t.string   "status_code",      :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_flex_values", ["flex_value"],:name => "IRM_FLEX_VALUES_U1",:unique=>true

    create_table "irm_flex_values_tl", :force => true do |t|
      t.integer   "flex_value_id",       :null=>false
      t.string    "name",          :limit=>150,:null=>false
      t.string    "description",   :limit=>240
      t.string    "language",      :limit=>30,  :null=> false
      t.string    "source_lang",   :limit=>30,  :null=> false
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_flex_values_tl", ["flex_value_id", "language"], :name => "IRM_FLEX_VALUES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')    
  end

  def self.down
    execute('drop view irm_flex_values_vl') 
    create_table "irm_value_sets", :force => true do |t|
      t.string   "value_set_code",         :limit => 30,:null => false
      t.string   "validation_type",             :limit => 30
      t.string   "status_code",       :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_value_sets", ["value_set_code"],:name => "IRM_VALUE_SET_U1",:unique=>true

    create_table "irm_value_sets_tl", :force => true do |t|
      t.integer   "value_set_id",       :null=>false
      t.string    "name",          :limit=>150,:null=>false
      t.string    "description",   :limit=>240
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_value_sets_tl", ["value_set_id", "language"], :name => "IRM_VALUE_SETS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_value_sets_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_value_sets  t,irm_value_sets_tl tl
                                             WHERE t.id = tl.value_set_id')

    create_table "irm_flex_values", :force => true do |t|
      t.string   "value_code",  :limit=>30, :null => false
      t.integer  "position",   :null => false
      t.datetime   "start_date_active"
      t.datetime   "end_date_active"
      t.string   "status_code",      :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_flex_values", ["value_code"],:name => "IRM_FLEX_VALUES_U1",:unique=>true

    create_table "irm_flex_values_tl", :force => true do |t|
      t.integer   "flex_value_id",       :null=>false
      t.string    "name",          :limit=>150,:null=>false
      t.string    "description",   :limit=>240
      t.string    "language",      :limit=>30,  :null=> false
      t.string    "source_lang",   :limit=>30,  :null=> false
      t.string    "status_code",   :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_flex_values_tl", ["flex_value_id", "language"], :name => "IRM_FLEX_VALUES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')
  end
end
