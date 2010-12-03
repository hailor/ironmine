class Irm::ProductModulesTl < ActiveRecord::Base
  set_table_name :irm_product_modules_tl
  belongs_to :product_module
  validates_presence_of :name  
  query_extend  
end
