class CreateIrmLookupTypes < ActiveRecord::Migration
  def self.up
    create_table :irm_lookup_types , :force => true do |t|
      t.integer :product_id
      t.string :lookup_level,:limit=>30,:null=>false
      t.string :lookup_type,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "irm_lookup_types", ["lookup_type"], :name => "IRM_LOOKUP_TYPES_N1"

    create_table :irm_lookup_types_tl , :force => true do |t|
      t.integer :product_id
      t.integer :lookup_type_id
      t.string :meaning,:limit=>60,:null=>false
      t.string :description,:limit=>150,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "irm_lookup_types_tl", ["lookup_type_id","language"], :name => "IRM_LOOKUP_TYPES_TL_N1"

    execute('CREATE OR REPLACE VIEW irm_lookup_types_vl AS SELECT t.*,tl.id lang_id,tl.meaning,tl.description,tl.language,tl.source_lang
                                             FROM irm_lookup_types t,irm_lookup_types_tl tl
                                             WHERE t.id = tl.lookup_type_id')

    create_table :irm_lookup_values , :force => true do |t|
      t.string :lookup_type,:limit=>30,:null=>false
      t.string :lookup_code,:limit=>30,:null=>false
      t.date :start_date_active
      t.date :end_date_active
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "irm_lookup_values", ["lookup_type","lookup_code"], :name => "IRM_LOOKUP_VALUES_N1"

    create_table :irm_lookup_values_tl , :force => true do |t|
      t.string :lookup_value_id,:limit=>30,:null=>false
      t.string :language,:limit=>30,:null=>false
      t.string :source_lang,:limit=>30,:null=>false
      t.string :meaning,:limit=>60,:null=>false
      t.string :description,:limit=>150,:null=>false
      t.string :status_code,:limit=>30,:null=>false
      t.integer :created_by
      t.integer :updated_by
      t.date :created_at
      t.date :updated_at
    end

    add_index "irm_lookup_values_tl", ["lookup_value_id","language"], :name => "IRM_LOOKUP_VALUES_TL_N1"

    execute('CREATE OR REPLACE VIEW irm_lookup_values_vl AS SELECT t.*,tl.id lang_id,tl.meaning,tl.description,tl.language,tl.source_lang
                                             FROM irm_lookup_values t,irm_lookup_values_tl tl
                                             WHERE t.id = tl.lookup_value_id')
    
  end

  def self.down
    drop_table :irm_lookup_types
    drop_table :irm_lookup_types_tl
    drop_table :irm_lookup_values
    drop_table :irm_lookup_values_tl
    execute('drop view irm_lookup_types_vl')
    execute('drop view irm_lookup_values_vl')
  end
end
