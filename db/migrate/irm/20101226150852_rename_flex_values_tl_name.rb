class RenameFlexValuesTlName < ActiveRecord::Migration
  def self.up
    execute('drop view irm_flex_values_vl')
    rename_column :irm_flex_values_tl, :name, :flex_value_meaning
    change_column :irm_id_flex_segments_tl, :description, :string, :limit => 240, :null => true
    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.flex_value_meaning,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')
  end

  def self.down
    execute('drop view irm_flex_values_vl')   
    rename_column :irm_flex_values_tl, :flex_value_meaning, :name
    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')    
  end
end
