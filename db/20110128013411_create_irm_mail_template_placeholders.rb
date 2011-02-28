class CreateIrmMailTemplatePlaceholders < ActiveRecord::Migration
  def self.up
    create_table "irm_mail_template_placeholders",:force=>true do |t|
      t.integer  :company_id, :null => false
      t.string   :placeholder_code,:limit => 30,:null=>false
      t.string   :entity_code,:limit=>30
      t.string   :entity_field,:limit=>60
      t.string   :replacement_code,:limit=>60
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end

    #构建
    create_table "irm_mt_entities",:force=>true do |t|
      t.integer  :company_id, :null => false
      t.string   :entity_code,:limit=>30,:null=>false
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at

      add_index "irm_mt_entities", ["entity_code"], :name => "IRM_MT_ENTITIES_U1",:unique => true
    end

    create_table "irm_mt_entities_tl",:force=>true do |t|
      t.integer  :company_id, :null => false
      t.string   :entity_id,:limit=>30
      t.string   "language",          :limit => 30,  :null => false
      t.string   "name",              :limit => 150, :null => false
      t.string   "description",       :limit => 240
      t.string   "source_lang",       :limit => 30,  :null => false
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at

      add_index "irm_mt_entities_tl", ["entity_id","source_lang"], :name => "IRM_MT_ENTITIES_N1"

      execute('CREATE OR REPLACE VIEW irm_mt_entities_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_mt_entities  t,irm_mt_entities_tl tl
                                             WHERE t.id = tl.entity_id')
    end



    create_table "irm_mt_entity_fields",:force=>true do |t|
      t.integer  :company_id, :null => false
      t.string   :entity_code,:limit=>30
      t.string   :field_key,:limit=>30
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at

      add_index "irm_mt_entity_fields", ["entity_code","entity_field"], :name => "IRM_MT_ENTITY_FIELDS_N1"
    end

    create_table "irm_mt_entity_fields_tl",:force=>true do |t|
      t.integer  :company_id, :null => false
      t.string   :entity_field_id,:limit=>30
      t.string   "language",          :limit => 30,  :null => false
      t.string   "name",              :limit => 150, :null => false
      t.string   "description",       :limit => 240
      t.string   "source_lang",       :limit => 30,  :null => false
      t.string   :status_code, :limit => 30, :null => false, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at

      add_index "irm_mt_entity_fields_tl", ["entity_field_id","language"], :name => "IRM_MT_ENTITY_FIELDS_TL_N1"


      execute('CREATE OR REPLACE VIEW irm_mt_entity_fields_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_mt_entity_fields  t,irm_mt_entity_fields_tl tl
                                             WHERE t.id = tl.entity_field_id')
    end
  end

  def self.down
    drop_table "irm_mail_template_placeholders"
    drop_table "irm_mt_entities"
    drop_table "irm_mt_entities_tl"
    drop_table "irm_mt_entity_fields"
    drop_table "irm_mt_entity_fields_tl"
    execute("drop view irm_mt_entities_vl")
    execute("drop view irm_mt_entity_fields_vl")
  end
end
