class ModifyIdFlexStructureView < ActiveRecord::Migration
  def self.up
    execute('CREATE OR REPLACE VIEW irm_id_flex_structures_vl AS SELECT t.*,tl.id lang_id,tl.id_flex_structure_name,
                                             tl.description,tl.language,tl.source_lang
                                             FROM irm_id_flex_structures  t,irm_id_flex_structures_tl tl
                                             WHERE t.id = tl.id_flex_structure_id')    
  end

  def self.down
  end
end
