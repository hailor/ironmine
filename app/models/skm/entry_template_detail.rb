class Skm::EntryTemplateDetail < ActiveRecord::Base
  set_table_name :skm_entry_template_details
  
  scope :owned_elements, lambda{|template_id|
  select("#{table_name}.*, td.name element_name, td.description element_description, td.required_flag required_flag").
  joins(",#{Skm::EntryTemplateElement.table_name} te").
  where("#{table_name}.entry_element_id = td.id").
  where("#{table_name}.entry_template_id = ?", template_id).
  order("#{table_name}.line_num DESC")
  }
end