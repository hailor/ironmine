class Irm::ProductModulesTl < ActiveRecord::Base
  set_table_name :irm_product_modules_tl
  belongs_to :product_module
  query_extend  
end
