class ModifyPositionInFlexValue < ActiveRecord::Migration
  def self.up
    #execute('drop view irm_flex_values_vl')
    #rename_column :irm_flex_values, :position, :display_sequence
    #change_column :irm_flex_values, :display_sequence, :integer, :null => false, :default => 0
    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')    
  end

  def self.down
    execute('drop view irm_flex_values_vl')
    rename_column :irm_flex_values, :display_sequence, :position
    execute('CREATE OR REPLACE VIEW irm_flex_values_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_flex_values  t,irm_flex_values_tl tl
                                             WHERE t.id = tl.flex_value_id')    
  end
end
