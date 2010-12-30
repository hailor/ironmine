class Irm::OperationalCatalog < ActiveRecord::Base
  set_table_name :irm_operational_catalogs
  validates_presence_of :company_id

  validate:unique_segment?
  query_extend
  #查找运营分类列表
    scope :list_all, lambda{
    select("#{table_name}.*, cpt.name company_name, ifstl.id_flex_structure_name catalog_type_name, fvt1.flex_value_meaning segment1_name, fvt2.flex_value_meaning segment2_name, fvt3.flex_value_meaning segment3_name").
    select("CONCAT_WS(ifst.concatenated_segment_delimiter, fvt1.flex_value_meaning, fvt2.flex_value_meaning, fvt3.flex_value_meaning) concat_segment_name").
    joins("LEFT OUTER JOIN #{Irm::IdFlexStructure.table_name} ifst ON ifst.id_flex_structure_code = 'OPERATIONAL_CATALOG'").
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
    joins(",#{Irm::Company.table_name} cp, #{Irm::CompaniesTl.table_name} cpt").
    where("cp.id = cpt.company_id").
    where("cpt.language = ?", I18n.locale).
    where("cp.id = #{table_name}.company_id")
  }
  private
    def unique_segment?
      if Irm::OperationalCatalog.where("segment1 = ? AND segment2 = ? AND segment3 = ? AND company_id = ?", segment1, segment2, segment3, company_id).size != 0
       errors.add(:company_id, I18n.t(:error_segment_combination_existed))
      end
    end
  
end
