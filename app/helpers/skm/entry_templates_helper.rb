module Skm::EntryTemplatesHelper
  def available_entry_templates
    Skm::EntryTemplate.enabled
  end  
end