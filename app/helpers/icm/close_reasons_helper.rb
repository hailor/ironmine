module Icm::CloseReasonsHelper
  def available_close_reason_types
    Irm::LookupValue.query_by_lookup_type("ICM_CLOSE_REASON_TYPE").multilingual.collect{|p|[p[:meaning],p[:id]]}
  end
end
