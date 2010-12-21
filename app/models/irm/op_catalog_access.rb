class Irm::OpCatalogAccess < ActiveRecord::Base
  set_table_name :irm_op_catalog_accesses

  scope :list_all, lambda{ |operational_catalog_id|
    select("#{table_name}.*, #{Irm::CompaniesTl.table_name}.name company_name").
    join("#{Irm::CompaniesTl.table_name}").
    where("#{table_name}.company_id = #{Irm::CompaniesTl.table_name}.company_id").
    where("#{Irm::CompaniesTl.table_name}.language = ?", I18n::locale).
    where("#{table_name}.catalog_id = ?", operational_catalog_id)
  }
  
end