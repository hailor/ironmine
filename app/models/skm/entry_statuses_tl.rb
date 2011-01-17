class Skm::EntryStatusesTl < ActiveRecord::Base
  set_table_name :skm_entry_statuses_tl
  belongs_to :entry_status
  validates_presence_of :name  
end