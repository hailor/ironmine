class Irm::IdFlexSegment < ActiveRecord::Base
  set_table_name :irm_id_flex_segments
  
  #多语言关系
  attr_accessor :form_left_prompt,:description
  has_many :id_flex_segments_tls,:dependent => :destroy, :foreign_key => :segment_name, :primary_key => :segment_name
  acts_as_multilingual(:columns =>[:form_left_prompt,:description], :required=>[:form_left_prompt])
  query_extend
  validates_uniqueness_of :segment_name
  validates_presence_of :segment_name
  
  scope :query_by_flex_code_num, lambda{|id_flex_code, id_flex_num| where("#{table_name}.id_flex_code = ? AND #{table_name}.id_flex_num = ?", id_flex_code, id_flex_num)}
  scope :segment, lambda{|segment| where("#{table_name}.segment_name = ?", segment)}

  scope :query_by_structure_code, lambda{|id_flex_structure_code| select("#{table_name}.*, #{Irm::IdFlexSegmentsTl.table_name}.form_left_prompt, #{Irm::IdFlexSegmentsTl.table_name}.description").
                                          joins(",#{Irm::IdFlexSegmentsTl.table_name}").
                                          joins(",#{Irm::IdFlexStructure.table_name}").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.segment_name = #{table_name}.segment_name").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.language = ?", I18n.locale).
                                          where("#{Irm::IdFlexStructure.table_name}.id_flex_structure_code = ?", id_flex_structure_code).
                                          where("#{Irm::IdFlexStructure.table_name}.id_flex_code = #{table_name}.id_flex_code AND #{Irm::IdFlexStructure.table_name}.id_flex_num = #{table_name}.id_flex_num")}

  scope :list_all, lambda{|id_flex_structure_id| select("#{table_name}.*, #{Irm::IdFlexSegmentsTl.table_name}.form_left_prompt, #{Irm::IdFlexSegmentsTl.table_name}.description, fvs.flex_value_set_name value_set_name").
                                          joins("LEFT OUTER JOIN #{Irm::FlexValueSet.table_name} fvs ON fvs.flex_value_set_name = #{table_name}.flex_value_set_name").
                                          joins(",#{Irm::IdFlexSegmentsTl.table_name}").
                                          joins(",#{Irm::IdFlexStructure.table_name}").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.segment_name = #{table_name}.segment_name").
                                          where("#{Irm::IdFlexSegmentsTl.table_name}.language = ?", I18n.locale).
                                          where("#{Irm::IdFlexStructure.table_name}.id = ?", id_flex_structure_id).
                                          where("#{Irm::IdFlexStructure.table_name}.id_flex_code = #{table_name}.id_flex_code AND #{Irm::IdFlexStructure.table_name}.id_flex_num = #{table_name}.id_flex_num")}

end
