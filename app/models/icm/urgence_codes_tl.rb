class Icm::UrgenceCodesTl < ActiveRecord::Base
  set_table_name :icm_urgence_codes_tl

  belongs_to :action

  validates_presence_of :name
end
