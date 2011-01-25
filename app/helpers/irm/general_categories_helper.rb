# -*- coding: utf-8 -*-
module Irm::GeneralCategoriesHelper
  def available_category_segment_set(segment, type)
    set_name = Irm::IdFlexSegment.query_by_structure_code(type).segment(segment.to_s).first().flex_value_set_name
    Irm::FlexValue.query_by_value_set_name(set_name).multilingual.collect{|m| [m[:flex_value_meaning], m.flex_value]}
  end

  def available_category_types
    Irm::IdFlexStructure.query_by_flex_code("CATALOGS").multilingual.collect{|m| [m[:id_flex_structure_name], m.id_flex_structure_code]}
  end

  def available_general_categories
    Irm::GeneralCategory.list_all.enable
  end
end
