module Irm::GlobalSettingsHelper
  def available_timezone
    Irm::LookupValue.query_by_lookup_type("TIMEZONE").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
  end
  def available_themes
    [["default", "default"], ["salesforce", "salesforce"]]
  end
end
