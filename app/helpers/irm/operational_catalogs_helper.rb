# -*- coding: utf-8 -*-
module Irm::OperationalCatalogsHelper
  def available_segment1
    code = Irm::LookupValue.query_by_lookup_code("OPERATIONAL_CATALOG_SEG_1").multilingual.first()[:meaning]
    Irm::FlexValue.query_by_value_set_code(code).multilingual.collect{|m| [m[:name], m.value_code]}
  end

  def available_segment2
    code = Irm::LookupValue.query_by_lookup_code("OPERATIONAL_CATALOG_SEG_2").multilingual.first()[:meaning]
    Irm::FlexValue.query_by_value_set_code(code).multilingual.collect{|m| [m[:name], m.value_code]}
  end

  def available_segment3
    code = Irm::LookupValue.query_by_lookup_code("OPERATIONAL_CATALOG_SEG_3").multilingual.first()[:meaning]
    Irm::FlexValue.query_by_value_set_code(code).multilingual.collect{|m| [m[:name], m.value_code]}
  end

  def available_catalog_types
    Irm::LookupValue.query_by_lookup_type("OPERATIONAL_CATALOG_TYPE").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end
end
