# -*- coding: utf-8 -*-
module Irm::GeneralCategoriesHelper
  def available_category_segment_set(segment, type)
    rt = ""
    rc = Irm::IdFlexSegment.query_by_structure_code(type).segment(segment.to_s).first()
    if rc && rc.flex_value_set_name
      set_name = rc.flex_value_set_name
      rt = Irm::FlexValue.query_by_value_set_name(set_name).multilingual.collect{|m| [m[:flex_value_meaning], m.flex_value]}
    end
    rt
  end

  def available_category_types
    Irm::IdFlexStructure.query_by_flex_code("CATALOGS").multilingual.collect{|m| [m[:id_flex_structure_name], m.id_flex_structure_code]}
  end

  def available_general_categories
    Irm::GeneralCategory.list_all.enable
  end
end
