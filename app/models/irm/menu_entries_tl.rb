class Irm::MenuEntriesTl < ActiveRecord::Base
  set_table_name :irm_menu_entries_tl
  belongs_to :menu_entry

  validates_presence_of :name

  scope :query_by_menu_entry_id,lambda{|menu_entry_id| where(:menu_entry_id=>menu_entry_id)}
  scope :query_by_language,lambda{|language| where(:language=>language)}

end
