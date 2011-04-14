class CreateTableForBoFilterLov < ActiveRecord::Migration
  def self.up
    create_table "irm_business_objects", :force => true do |t|
      t.integer :company_id,:null=>false
      t.string  :business_object_code, :limit => 30, :null => false
      t.string :bo_table_name, :limit => 60, :null => false
      t.string :bo_model_name, :limit => 150
      t.string :auto_generate_flag,:limit=>1,:null => false,:default=>"Y"
      t.string :multilingual_flag,:limit=>1,:null => false,:default=>"N"
      t.text :sql_cache
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_business_objects", ["business_object_code"], :name => "IRM_BUSINESS_OBJECTS_N1"
    create_table "irm_business_objects_tl", :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :business_object_id, :null => false
      t.string :name, :limit => 60, :null => false
      t.string :description, :limit => 150
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.string :language, :limit => 30
      t.string :source_lang, :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_business_objects_tl", ["business_object_id", "language"], :name => "IRM_BUSINESS_OBJECTS_TL_U1", :unique => true
    execute('CREATE OR REPLACE VIEW irm_business_objects_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_business_objects  t,irm_business_objects_tl tl
                                             WHERE t.id = tl.business_object_id')



    create_table "irm_object_attributes", :force => true do |t|
      t.integer :company_id,:null=>false
      t.string  :business_object_code, :limit => 30, :null => false
      t.string :approval_page_field_flag,:limit=>1,:null => false,:default=>"Y"
      t.string :attribute_name,:limit=>30,:null => false
      t.string :attribute_type,:limit=>30,:null => false,:default=>"TABLE_COLUMN"
      t.string :exists_relation_flag,:limit=>1,:default=>"N"
      t.string :relation_bo_code, :limit => 30
      t.string :relation_table_alias_name, :limit => 30
      t.string :relation_column, :limit => 30
      t.string :relation_type,:limit=>30
      t.text :where_clause
      t.string :lov_code, :limit => 30
      t.string :data_type, :limit => 30
      t.string :data_length, :limit => 30
      t.string :nullable_flag, :limit => 30
      t.string :key_type, :limit => 30
      t.string :default_value, :limit => 30
      t.string :extra_info, :limit => 30
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_object_attributes", ["business_object_code"], :name => "IRM_OBJECT_ATTRIBUTES_N1"
    create_table "irm_object_attributes_tl", :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :object_attribute_id, :null => false
      t.string :name, :limit => 60, :null => false
      t.string :description, :limit => 150
      t.string :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.string :language, :limit => 30
      t.string :source_lang, :limit => 30
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end
    add_index "irm_object_attributes_tl", ["object_attribute_id", "language"], :name => "IRM_OBJECT_ATTRIBUTES_TL_U1", :unique => true
    execute('CREATE OR REPLACE VIEW irm_object_attributes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_object_attributes  t,irm_object_attributes_tl tl
                                             WHERE t.id = tl.object_attribute_id')

  end

  def self.down
    drop_table :irm_business_objects
    drop_table :irm_business_objects_tl
    execute('drop view irm_business_objects_vl')
    drop_table :irm_object_attributes
    drop_table :irm_object_attributes_tl
    execute('drop view irm_object_attributes_vl')
  end
end
