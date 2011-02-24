module Irm::RolesHelper
  def available_role_types
    Irm::LookupValue.query_by_lookup_type("IRM_ROLE_TYPE").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end
end