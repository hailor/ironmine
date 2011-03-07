module Irm::ReportsHelper
  def available_report_categories
    Irm::LookupValue.query_by_lookup_type("IRM_REPORT_CATEGORY").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end

  def available_permissions
    Irm::Permission.multilingual.collect{|p| ["#{p[:name]}(#{p.page_controller})", p.permission_code]}
  end

  def available_report_purpose
    Irm::LookupValue.query_by_lookup_type("IRM_REPORT_PURPOSE").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end
end
