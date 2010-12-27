class Icm::PriorityCodesTl < ActiveRecord::Base
  set_table_name :icm_priority_codes_tl

  belongs_to :priority_code

  validates_presence_of :name
end
