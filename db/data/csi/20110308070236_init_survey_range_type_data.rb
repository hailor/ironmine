# -*- coding: utf-8 -*-
class InitSurveyRangeTypeData < ActiveRecord::Migration
  def self.up
    csi_survey_range=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'CSI_SURVEY_RANGE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    csi_survey_range.lookup_types_tls.build(:lookup_type_id=>csi_survey_range.id,:meaning=>'调查范围类型',:description=>'调查范围类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range.lookup_types_tls.build(:lookup_type_id=>csi_survey_range.id,:meaning=>'Survey Range Type',:description=>'Survey Range Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range.save

    csi_survey_range_organization= Irm::LookupValue.new(:lookup_type=>'CSI_SURVEY_RANGE_TYPE',:lookup_code=>'ORGANIZATION',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    csi_survey_range_organization.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_organization.id,:meaning=>'组织维度',:description=>'组织维度',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_organization.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_organization.id,:meaning=>'Organization',:description=>'Organization',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_organization.save
    csi_survey_range_role= Irm::LookupValue.new(:lookup_type=>'CSI_SURVEY_RANGE_TYPE',:lookup_code=>'ROLE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    csi_survey_range_role.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_role.id,:meaning=>'角色维度',:description=>'角色维度',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_role.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_role.id,:meaning=>'Role',:description=>'Role',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_role.save
    csi_survey_range_site= Irm::LookupValue.new(:lookup_type=>'CSI_SURVEY_RANGE_TYPE',:lookup_code=>'SITE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    csi_survey_range_site.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_role.id,:meaning=>'地点维度',:description=>'地点维度',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_site.lookup_values_tls.build(:lookup_value_id=>csi_survey_range_role.id,:meaning=>'Site',:description=>'Site',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    csi_survey_range_site.save
  end

  def self.down

  end
end
