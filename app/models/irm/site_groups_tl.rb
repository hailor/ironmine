class Irm::SiteGroupsTl < ActiveRecord::Base
  set_table_name :irm_site_groups_tl

  belongs_to :site_group

  validates_presence_of :name
end