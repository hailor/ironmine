class Irm::RegionsTl < ActiveRecord::Base
  set_table_name :irm_regions_tl

  belongs_to :region

  validates_presence_of :name
end