class Irm::OperationalCatalog < ActiveRecord::Base
  set_table_name :irm_operational_catalogs

  #多语言关系
  attr_accessor :name,:description
  has_many :operational_catalogs_tls,:dependent => :destroy
  acts_as_multilingual

  query_extend
  #查找运营分类列表
    scope :list_all, lambda{
    select("#{table_name}.*, #{Irm::OperationalCatalogsTl.table_name}.name, ifstl.id_flex_structure_name catalog_type_name, #{Irm::OperationalCatalogsTl.table_name}.description, fvt1.flex_value_meaning segment1_name, fvt2.flex_value_meaning segment2_name, fvt3.flex_value_meaning segment3_name").
    joins("LEFT OUTER JOIN #{Irm::IdFlexStructure.table_name} ifst ON ifst.id_flex_structure_code = #{table_name}.catalog_type").
    joins("LEFT OUTER JOIN #{Irm::IdFlexSegment.table_name} ifs1 ON ifs1.segment_name = 'segment1' AND ifs1.id_flex_code = ifst.id_flex_code AND ifs1.id_flex_num = ifst.id_flex_num").
    joins("LEFT OUTER JOIN #{Irm::IdFlexSegment.table_name} ifs2 ON ifs2.segment_name = 'segment2' AND ifs2.id_flex_code = ifst.id_flex_code AND ifs2.id_flex_num = ifst.id_flex_num").
    joins("LEFT OUTER JOIN #{Irm::IdFlexSegment.table_name} ifs3 ON ifs3.segment_name = 'segment3' AND ifs3.id_flex_code = ifst.id_flex_code AND ifs3.id_flex_num = ifst.id_flex_num").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fv1 ON fv1.flex_value = #{table_name}.segment1").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fv2 ON fv2.flex_value = #{table_name}.segment2").
    joins("LEFT OUTER JOIN #{Irm::FlexValue.table_name} fv3 ON fv3.flex_value = #{table_name}.segment3").
    joins("LEFT OUTER JOIN #{Irm::IdFlexStructuresTl.table_name} ifstl ON ifstl.id_flex_structure_id = ifst.id AND ifstl.language = '#{I18n.locale}'").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvt1 ON fvt1.flex_value_id = fv1.id AND fvt1.language = '#{I18n.locale}'").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvt2 ON fvt2.flex_value_id = fv2.id AND fvt2.language = '#{I18n.locale}'").
    joins("LEFT OUTER JOIN #{Irm::FlexValuesTl.table_name} fvt3 ON fvt3.flex_value_id = fv3.id AND fvt3.language = '#{I18n.locale}'").
    joins(",#{Irm::OperationalCatalogsTl.table_name}").
    where("#{Irm::OperationalCatalogsTl.table_name}.operational_catalog_id = #{table_name}.id").
    where("#{Irm::OperationalCatalogsTl.table_name}.language = ?", I18n.locale)
  }  
end
