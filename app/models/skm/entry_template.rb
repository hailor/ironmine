class Skm::EntryTemplate < ActiveRecord::Base
  set_table_name :skm_entry_templates
  validates_presence_of :entry_template_code
  validates_uniqueness_of :entry_template_code
  validates_presence_of :name

  query_extend
end