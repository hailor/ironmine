class AlterBusinessObjectAndAttribute < ActiveRecord::Migration
  def self.up
    add_column :irm_business_objects,:workflow_flag,:string,:limit=>1,:default=>'N',:before=>:auto_generate_flag
    add_column :irm_object_attributes,:update_flag,:string,:limit=>1,:default=>'N',:after=>:filter_flag
    add_column :irm_object_attributes,:person_flag,:string,:limit=>1,:default=>'N',:after=>:filter_flag
    execute('CREATE OR REPLACE VIEW irm_business_objects_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_business_objects  t,irm_business_objects_tl tl
                                             WHERE t.id = tl.business_object_id')
    execute('CREATE OR REPLACE VIEW irm_object_attributes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_object_attributes  t,irm_object_attributes_tl tl
                                             WHERE t.id = tl.object_attribute_id')
  end

  def self.down
    remove_column :irm_business_objects,:workflow_flag
    remove_column :irm_object_attributes,:update_flag
    remove_column :irm_object_attributes,:person_flag
    execute('CREATE OR REPLACE VIEW irm_business_objects_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_business_objects  t,irm_business_objects_tl tl
                                             WHERE t.id = tl.business_object_id')
    execute('CREATE OR REPLACE VIEW irm_object_attributes_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_object_attributes  t,irm_object_attributes_tl tl
                                             WHERE t.id = tl.object_attribute_id')
  end
end
