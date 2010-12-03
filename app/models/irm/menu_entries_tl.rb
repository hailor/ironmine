class Irm::MenuEntriesTl < ActiveRecord::Base
  set_table_name :irm_menu_entries_tl
  belongs_to :menu_entry

  validates_presence_of :name
end
