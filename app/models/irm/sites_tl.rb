class Irm::SitesTl < ActiveRecord::Base
  set_table_name :irm_sites_tl

  belongs_to :site

  validates_presence_of :name
end