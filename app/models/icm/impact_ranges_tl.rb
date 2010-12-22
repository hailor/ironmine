class Icm::ImpactRangesTl < ActiveRecord::Base
  set_table_name :icm_impact_ranges_tl

  belongs_to :impact_range

  validates_presence_of :name
end
