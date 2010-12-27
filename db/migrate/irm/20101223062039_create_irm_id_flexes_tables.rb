class CreateIrmIdFlexesTables < ActiveRecord::Migration
  def self.up
    create_table :irm_id_flexes do |t|
      t.string  "id_flex_code", :limit => 30, :null => false
      t.string  "id_flex_name", :limit => 150
      t.string  "description", :limit => 240
      t.string  "status_code", :limit => 30
      t.integer "created_by", :null => false
      t.integer "updated_by", :null => false
      t.datetime  "created_at", :null => false
      t.datetime  "updated_at", :null => false
    end

    add_index :irm_id_flexes, ["id_flex_code"], :name => "IRM_ID_FLEXES_U1", :unique => true
    
    create_table :irm_id_flex_structures do |t|
      t.string  "id_flex_code", :limit => 30, :null => false
      t.integer "id_flex_num", :null => false
      t.string  "id_flex_structure_code", :limit => 30, :null => false
      t.string  "concatenated_segment_delimiter"
      t.string  "freeze_flex_definition_flag"
      t.string  "status_code", :limit => 30
      t.integer "created_by", :null => false
      t.integer "updated_by", :null => false
      t.datetime  "created_at", :null => false
      t.datetime  "updated_at", :null => false
    end

    add_index :irm_id_flex_structures, ["id_flex_structure_code"], :name => "IRM_ID_FLEX_STRUCTURES_U1", :unique => true
    
    create_table :irm_id_flex_structures_tl do |t|
      t.string  "id_flex_code", :limit => 30, :null => false
      t.integer "id_flex_num", :null => false
      t.string  "id_flex_structure_name", :limit => 150, :null => false
      t.string  "description", :limit => 240, :null => false
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30      
      t.string  "status_code", :limit => 30
      t.integer "created_by", :null => false
      t.integer "updated_by", :null => false
      t.datetime  "created_at", :null => false
      t.datetime  "updated_at", :null => false
    end

    add_index :irm_id_flex_structures_tl, ["id_flex_code", "id_flex_num","language"], :name => "IRM_ID_FLEX_STRUCTURES_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_id_flex_structures_vl AS SELECT t.*,tl.id lang_id,tl.id_flex_structure_name,
                                             tl.description,tl.language,tl.source_lang
                                             FROM irm_id_flex_structures  t,irm_id_flex_structures_tl tl
                                             WHERE t.id_flex_code = tl.id_flex_code AND t.id_flex_num = tl.id_flex_num')

    create_table :irm_id_flex_segments do |t|
      t.string  "id_flex_code", :limit => 30, :null => false
      t.integer "id_flex_num", :null => false
      t.integer "segment_num", :null => false
      t.string  "segment_name", :limit => 150, :null => false
      t.string  "display_flag", :limit => 1, :default => "Y"
      t.integer "display_size"
      t.integer "flex_value_set_id"
      t.string  "default_type", :limit => 30
      t.string  "default_value", :limit => 240
      t.string  "status_code", :limit => 30
      t.integer "created_by", :null => false
      t.integer "updated_by", :null => false
      t.datetime  "created_at", :null => false
      t.datetime  "updated_at", :null => false
    end

    add_index :irm_id_flex_segments, ["segment_name"], :name => "IRM_ID_FLEX_SEGMENTS_U1", :unique => true

    create_table :irm_id_flex_segments_tl do |t|
      t.string  "segment_name", :limit => 150, :null => false
      t.string  "form_left_prompt", :limit => 150
      t.string  "form_above_prompt", :limit => 150
      t.string  "description", :limit => 240, :null => false
      t.string    "language",      :limit=>30
      t.string    "source_lang",   :limit=>30
      t.string  "status_code", :limit => 30
      t.integer "created_by", :null => false
      t.integer "updated_by", :null => false
      t.datetime  "created_at", :null => false
      t.datetime  "updated_at", :null => false
    end

    execute('CREATE OR REPLACE VIEW irm_flex_segments_vl AS SELECT t.*,tl.id lang_id, tl.form_left_prompt, tl.form_above_prompt,tl.description,tl.language,tl.source_lang
                                             FROM irm_id_flex_segments  t,irm_id_flex_segments_tl tl
                                             WHERE t.segment_name = tl.segment_name')
  end

  def self.down
    execute("drop view irm_flex_structures_vl")
    drop_table :irm_id_flexes
    drop_table :irm_id_flex_structures
    drop_table :irm_id_flex_structures_tl
    drop_table :irm_id_flex_segments
  end
end
