class Slm::ServiceCategoriesTl < ActiveRecord::Base
  set_table_name :slm_service_categories_tl
  query_extend

  belongs_to :service_category

  validates_presence_of :name

end