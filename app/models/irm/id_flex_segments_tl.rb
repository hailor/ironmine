class Irm::IdFlexSegmentsTl < ActiveRecord::Base
  set_table_name :irm_id_flex_segments_tl
  belongs_to :id_flex_segment, :foreign_key => :segment_name
  validates_presence_of :form_left_prompt
end
