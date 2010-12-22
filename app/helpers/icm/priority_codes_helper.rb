module Icm::PriorityCodesHelper
  def available_priority_codes
    Irm::LookupValue.query_by_lookup_type("ICM_PRIORITY_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
  end
end
