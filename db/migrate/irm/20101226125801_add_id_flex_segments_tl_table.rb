class AddIdFlexSegmentsTlTable < ActiveRecord::Migration
  def self.up
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
    execute("drop view irm_flex_segments_vl")
    drop_table :irm_id_flex_segments_tl
  end
end
