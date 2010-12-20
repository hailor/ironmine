class Irm::OperationalCatalog < ActiveRecord::Base
  set_table_name :irm_operational_catalogs

  #多语言关系
  attr_accessor :name,:description
  has_many :operational_catalogs_tls,:dependent => :destroy
  acts_as_multilingual

  query_extend
  #查找运营分类列表
    scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::OperationalCatalogsTl.table_name}.name, #{Irm::OperationalCatalogsTl.table_name}.description, lvtct.meaning catalog_type_name, fvtse1.name segment1_name, fvtse2.name segment2_name, fvtse3.name segment3_name").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fvse1 ON fvse1.value_code = #{table_name}.segment1").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fvse2 ON fvse2.value_code = #{table_name}.segment2").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fvse3 ON fvse3.value_code = #{table_name}.segment3").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvtse1 ON fvtse1.flex_value_id = fvse1.id AND fvtse1.language = '#{I18n.locale}'").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvtse2 ON fvtse2.flex_value_id = fvse2.id AND fvtse2.language = '#{I18n.locale}'").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvtse3 ON fvtse3.flex_value_id = fvse3.id AND fvtse3.language = '#{I18n.locale}'").
    joins(",#{Irm::OperationalCatalogsTl.table_name}, #{Irm::LookupValuesTl.table_name} lvtct, #{Irm::LookupValue.table_name} lvct").
#    joins(",#{Irm::FlexValue.table_name} fvse1").
#    joins(",#{Irm::FlexValue.table_name} fvse2").
#    joins(",#{Irm::FlexValue.table_name} fvse3").
#    joins(",#{Irm::FlexValuesTl.table_name} fvtse1").
#    joins(",#{Irm::FlexValuesTl.table_name} fvtse2").
#    joins(",#{Irm::FlexValuesTl.table_name} fvtse3").
    where("#{Irm::OperationalCatalogsTl.table_name}.operational_catalog_id = #{table_name}.id").
    where("#{Irm::OperationalCatalogsTl.table_name}.language = ?", I18n.locale).
    where("lvct.lookup_type = ?", "OPERATIONAL_CATALOG_TYPE").
    where("lvtct.language = ?", I18n.locale).
    where("lvct.id = lvtct.lookup_value_id").
    where("lvct.lookup_code = #{table_name}.catalog_type")
#    where("fvse1.value_code = #{table_name}.segment1").
#    where("fvse2.value_code = #{table_name}.segment2").
#    where("fvse3.value_code = #{table_name}.segment3").
#    where("fvtse1.language = ?", I18n.locale).
#    where("fvtse1.language = ?", I18n.locale).
#    where("fvtse1.language = ?", I18n.locale).
#    where("fvtse1.flex_value_id = fvse1.id").
#    where("fvtse2.flex_value_id = fvse2.id").
#    where("fvtse3.flex_value_id = fvse3.id")
  }  
end
