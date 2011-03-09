# -*- coding: utf-8 -*-
class AddReportPurposeLookup < ActiveRecord::Migration
  def self.up
    irm_report_purpose=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_REPORT_PURPOSE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_purpose.lookup_types_tls.build(:lookup_type_id=>irm_report_purpose.id,:meaning=>'报表用途',:description=>'报表用途',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose.lookup_types_tls.build(:lookup_type_id=>irm_report_purpose.id,:meaning=>'Report Purpose',:description=>'Report Purpose',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose.save

    irm_report_purpose_report= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_PURPOSE',:lookup_code=>'REPORT',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_purpose_report.lookup_values_tls.build(:lookup_value_id=>irm_report_purpose_report.id,:meaning=>'报表',:description=>'报表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose_report.lookup_values_tls.build(:lookup_value_id=>irm_report_purpose_report.id,:meaning=>'Report',:description=>'Report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose_report.save
    irm_report_purpose_import= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_PURPOSE',:lookup_code=>'IMPORT',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_purpose_import.lookup_values_tls.build(:lookup_value_id=>irm_report_purpose_import.id,:meaning=>'导出文件',:description=>'导出文件',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose_import.lookup_values_tls.build(:lookup_value_id=>irm_report_purpose_import.id,:meaning=>'Import File',:description=>'Import File',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_purpose_import.save
  end

  def self.down
  end
end
