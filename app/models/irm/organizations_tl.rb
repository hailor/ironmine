class Irm::OrganizationsTl < ActiveRecord::Base
  set_table_name :irm_organizations_tl

  belongs_to :organization

  validates_presence_of :name
end
