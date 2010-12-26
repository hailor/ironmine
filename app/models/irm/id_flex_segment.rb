class Irm::IdFlexSegment < ActiveRecord::Base
  set_table_name :irm_id_flex_segments
  
  #多语言关系
  attr_accessor :form_left_prompt,:description
  has_many :id_flex_segments_tls,:dependent => :destroy, :foreign_key => :segment_name
  
  acts_as_multilingual(:columns =>[:form_left_prompt,:description], :required=>[:form_left_prompt])

  scope :list_all, lambda{|id_flex_structure_id| select("#{table_name}.*, #{Irm::IdFlexSegmentsTl.table_name}.form_left_prompt, #{Irm::IdFlexSegmentsTl.table_name}.description").
                                          joins(",#{Irm::IdFlexSegmentsTl.table_name}").
                                          joins(",#{Irm::IdFlexStructure.table_name}").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.segment_name = #{table_name}.segment_name").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.language = ?", I18n.locale).
                                          where("#{Irm::IdFlexStructure.table_name}.id = ?", id_flex_structure_id).
                                          where("#{Irm::IdFlexStructure.table_name}.id_flex_code = #{table_name}.id_flex_code AND #{Irm::IdFlexStructure.table_name}.id_flex_num = #{table_name}.id_flex_num")}

end
