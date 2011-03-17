class Skm::EntryFavorite < ActiveRecord::Base
  set_table_name :skm_entry_favorites
  validates_uniqueness_of :entry_header_id,:scope => :person_id
end