class Irm::OperationalCatalogsTl < ActiveRecord::Base
  set_table_name :irm_operational_catalogs_tl

  belongs_to :operational_catalog

  validates_presence_of :name

end
