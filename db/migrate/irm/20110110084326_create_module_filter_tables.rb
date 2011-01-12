class CreateModuleFilterTables < ActiveRecord::Migration
  def self.up
      create_table "irm_view_columns", :force => true do |t|
        t.string  "filter_type",       :limit => 30, :null => false
        t.string  "column_code",       :limit => 30, :null => false
        t.string  "table_name",        :limit => 30, :null => false
        t.string  "column_name",       :limit => 30, :null => false
        t.string  "column_data_type",  :limit => 30, :null => false
        t.string  "dispaly_flag",      :limit => 1,  :default => "Y"
        t.integer  "dispaly_sequence",  :default => 10
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_view_columns", ["filter_type","column_code"], :name => "IRM_VIEW_COLUMNS_N1"

      create_table "irm_view_columns_tl", :force => true do |t|
        t.integer  "view_column_id"
        t.string   "language",          :limit => 30,  :null => false
        t.string   "name",              :limit => 150
        t.string   "description",       :limit => 240
        t.string   "source_lang",       :limit => 30,  :null => false
        t.string   "status_code",       :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_view_columns_tl", ["view_column_id", "language"], :name => "IRM_VIEW_COLUMNS_TL_U1", :unique => true
      add_index "irm_view_columns_tl", ["view_column_id"], :name => "IRM_VIEW_COLUMNS_TL_N1"

      execute('CREATE OR REPLACE VIEW irm_view_columns_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_view_columns t,irm_view_columns_tl tl
                                             WHERE t.id = tl.view_column_id')

      create_table "irm_view_filters", :force => true do |t|
        t.integer  "company_id",           :null => false
        t.string  "filter_type",           :limit => 30, :null => false
        t.string  "view_name",             :limit => 60, :null => false
        t.string  "view_code",             :limit => 30, :null => false
        t.integer  "own_id",               :null => false
        t.string  "default_flag",          :limit => 1,  :default => "N"
        t.string  "restrict_visibility",   :limit => 1,  :default => "N"
        t.string  "raw_condition_clause", :limit =>1000
        t.string  "condition_clause",     :limit =>1000
        t.string   "status_code",          :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_view_filters", ["filter_type","view_code"], :name => "IRM_VIEW_FILTERS_N1"

      create_table "irm_view_filter_criterions", :force => true do |t|
        t.integer  "company_id",           :null => false
        t.string   "view_code",            :limit => 30, :null => false
        t.integer  "seq_num",              :null => false
        t.string   "column_code",          :limit => 30
        t.string  "operator_code",         :limit => 30
        t.string   "filter_value",         :limit => 30
        t.string   "status_code",          :limit => 30, :null => false
        t.integer  "created_by"
        t.integer  "updated_by"
        t.datetime "created_at"
        t.datetime "updated_at"
      end

      add_index "irm_view_filter_criterions", ["view_code"], :name => "IRM_VIEW_FILTER_CRITERIONS_N1"


  end

  def self.down
    drop_table :irm_view_columns
    drop_table :irm_view_columns_tl
    drop_table :irm_view_filters
    drop_table :irm_view_filter_criterions
  end
end
