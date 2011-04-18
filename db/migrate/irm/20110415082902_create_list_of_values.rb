class CreateListOfValues < ActiveRecord::Migration
  def self.up
    create_table "irm_list_of_values", :force => true do |t|
      t.integer :company_id,:null=>false
      t.string :lov_code, :limit => 30, :null => false
      t.string :bo_code , :limit => 30, :null => false
      t.text :where_clause
      t.text :query_clause
      t.text :addition_clause
      t.string :id_column , :limit => 30, :null => false
      t.string :value_column, :limit => 30, :null => false
      t.string :value_column_width, :limit => 30
      t.string :desc_column, :limit => 30
      t.string :desc_column_width , :limit => 30
      t.string :addition_column, :limit => 150
      t.string :addition_column_width, :limit => 150
      t.string :listable_flag,:limit => 1, :null => false, :default => "Y"
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_list_of_values", ["lov_code"], :name => "IRM_LIST_OF_VALUES_N1"
    create_table "irm_list_of_values_tl", :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :list_of_value_id, :null => false
      t.string :name, :limit => 60, :null => false
      t.string :description, :limit => 150
      t.string :value_title  , :limit => 60
      t.string :desc_title, :limit => 60
      t.string :addition_title , :limit => 150
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.string :language, :limit => 30
      t.string :source_lang, :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_list_of_values_tl", ["list_of_value_id", "language"], :name => "IRM_LIST_OF_VALUES_TL_U1", :unique => true
    execute('CREATE OR REPLACE VIEW irm_list_of_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.value_title,tl.desc_title,tl.addition_title,tl.language,tl.source_lang
                                             FROM irm_list_of_values  t,irm_list_of_values_tl tl
                                             WHERE t.id = tl.list_of_value_id')

  end

  def self.down
    drop_table :irm_list_of_values
    drop_table :irm_list_of_values_tl
    execute('drop view irm_list_of_values_vl')
  end
end
