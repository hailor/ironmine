class ModifyIdFlexValueSetId < ActiveRecord::Migration
  def self.up
    execute("drop view irm_flex_segments_vl")
    remove_column :irm_id_flex_segments, :flex_value_set_id
    add_column :irm_id_flex_segments, :flex_value_set_name, :string, :limit => 30, :after => :default_value
    execute('CREATE OR REPLACE VIEW irm_flex_segments_vl AS SELECT t.*,tl.id lang_id, tl.form_left_prompt, tl.form_above_prompt,tl.description,tl.language,tl.source_lang
                                             FROM irm_id_flex_segments  t,irm_id_flex_segments_tl tl
                                             WHERE t.segment_name = tl.segment_name')      
  end

  def self.down
    execute("drop view irm_flex_segments_vl")
    remove_column :irm_id_flex_segments, :flex_value_set_name
    add_column :irm_id_flex_segments, :flex_value_set_id, :integer, :after => :default_value
    execute('CREATE OR REPLACE VIEW irm_flex_segments_vl AS SELECT t.*,tl.id lang_id, tl.form_left_prompt, tl.form_above_prompt,tl.description,tl.language,tl.source_lang
                                             FROM irm_id_flex_segments  t,irm_id_flex_segments_tl tl
                                             WHERE t.segment_name = tl.segment_name')
  end
end
