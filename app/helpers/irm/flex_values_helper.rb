module Irm::FlexValuesHelper
  def available_flex_value_sets
    Irm::FlexValueSet.query_by_status_code("ENABLED").collect{|p| [p.flex_value_set_name, p.id]}
  end
end
