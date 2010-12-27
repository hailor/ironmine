# -*- coding: utf-8 -*-
module Irm::OperationalCatalogsHelper
  def available_oper_cata_segment_set(segment, catalog_type)
    set_name = Irm::IdFlexSegment.query_by_structure_code(catalog_type).segment(segment.to_s).first().flex_value_set_name
    Irm::FlexValue.query_by_value_set_name(set_name).multilingual.collect{|m| [m[:flex_value_meaning], m.flex_value]}
  end

  def available_catalog_types
    Irm::IdFlexStructure.query_by_flex_code("OPERATIONAL_CATALOG").multilingual.collect{|m| [m[:id_flex_structure_name], m.id_flex_structure_code]}
  end
end
