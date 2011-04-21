class Slm::ServiceCatalogsTl < ActiveRecord::Base
  set_table_name :slm_service_catalogs_tl

  query_extend

  belongs_to :service_catalog

  validates_presence_of :name
end