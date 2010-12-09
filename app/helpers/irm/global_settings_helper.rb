module Irm::GlobalSettingsHelper
  def available_timezone
    [["GTM-12", "GTM-12"],["GTM-11", "GTM-11"],["GTM-10", "GTM-10"],["GTM-9", "GTM-9"],
     ["GTM-8", "GTM-8"],["GTM-7", "GTM-7"],["GTM-6", "GTM-6"],["GTM-5", "GTM-5"],
    ["GTM-4", "GTM-4"],["GTM-3", "GTM-3"],["GTM-2", "GTM-2"],["GTM-1", "GTM-1"],
    ["GTM", "GTM"],["GTM+1", "GTM+1"],["GTM+2", "GTM+2"],["GTM+3", "GTM+3"],
    ["GTM+4", "GTM+4"],["GTM+5", "GTM+5"],["GTM+6", "GTM+6"],["GTM+7", "GTM+7"],
    ["GTM+8", "GTM+8"],["GTM+9", "GTM+9"],["GTM+10", "GTM+10"],["GTM+11", "GTM+11"],
    ["GTM+12", "GTM+12"],["GTM+13", "GTM+13"]]
  end
  def available_themes
    [["default", "default"]]
  end      
end
