module Irm::FlexValuesHelper
  def available_flex_value_sets
    Irm::FlexValueSet.query_by_status_code("ENABLED")
  end
end
