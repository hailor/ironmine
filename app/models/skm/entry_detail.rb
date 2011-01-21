class Skm::EntryDetail < ActiveRecord::Base
  set_table_name :skm_entry_details
  belongs_to :entry_header
  
  validate :validate_content
  def validate_content
    errors.add(:entry_content, "can not be none") if required_flag == "Y" && entry_content.blank? 
  end
end