class Irm::OperationalCatalog < ActiveRecord::Base
  set_table_name :irm_operational_catalogs

  #多语言关系
  attr_accessor :name,:description
  has_many :operational_catalogs_tls,:dependent => :destroy
  acts_as_multilingual

  #查找运营分类列表
  scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::OperationalCatalogsTl.table_name}.name, #{Irm::OperationalCatalogsTl.table_name}.description, lvct.meaning catalog_type_name, fvse1.").
    joins(",#{Irm::OperationalCatalogsTl.table_name}, #{Irm::LookupValue.table_name} lvct").
    joins(",#{Irm::FlexValue.table_name} fvse1").
    joins(",#{Irm::FlexValue.table_name} fvse2").
    joins(",#{Irm::FlexValue.table_name} fvse3").
    joins(",#{Irm::FlexValuesTl.table_name} fvse1").
    joins(",#{Irm::FlexValuesTl.table_name} fvse2").
    joins(",#{Irm::FlexValuesTl.table_name} fvse3").        
    where("#{Irm::OperationalCatalogsTl.table_name}.operational_catalog_id = #{table_name}.id").
    where("#{Irm::OperationalCatalogsTl.table_name}.language = ?", I18n.locale).
    where("lvct.lookup_type = ?", "OPERATIONAL_CATALOG_TYPE").
    where("lvct.language = ?", I18n.locale).
    where("lvct.lookup_code = #{table_name}.catalog_type").
    where("fvse1.value_code = #{table_name}.segment1").
    where("fvse2.value_code = #{table_name}.segment2").
    where("fvse3.value_code = #{table_name}.segment3").
    where("fvse1.language = ?", I18n.locale).
    where("fvse2.language = ?", I18n.locale).
    where("fvse3.language = ?", I18n.locale)
  }  
end
