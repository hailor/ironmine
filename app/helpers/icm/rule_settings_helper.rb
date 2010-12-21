module Icm::RuleSettingsHelper
  def available_processes
    Irm::LookupValue.query_by_lookup_type("ICM_PROCESS_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def selectable_companies
    available_company.collect{|c| [c[:name],c[:id]]}
  end
end
