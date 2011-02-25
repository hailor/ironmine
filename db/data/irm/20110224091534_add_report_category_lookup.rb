class AddReportCategoryLookup < ActiveRecord::Migration
  def self.up
    irm_report_category=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_REPORT_CATEGORY',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_category.lookup_types_tls.build(:lookup_type_id=>irm_report_category.id,:meaning=>'报表类型',:description=>'报表类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_category.lookup_types_tls.build(:lookup_type_id=>irm_report_category.id,:meaning=>'Report Category',:description=>'Report Category',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_category.save

    irm_report_categoryincident_request= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_CATEGORY',:lookup_code=>'INCIDENT_REQUEST',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_categoryincident_request.lookup_values_tls.build(:lookup_value_id=>irm_report_categoryincident_request.id,:meaning=>'事故单报表',:description=>'事故单报表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categoryincident_request.lookup_values_tls.build(:lookup_value_id=>irm_report_categoryincident_request.id,:meaning=>'Incident request report',:description=>'Incident request report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categoryincident_request.save
    irm_report_categoryservice_knowledge_manage= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_CATEGORY',:lookup_code=>'SERVICE_KNOWLEDGE_MANAGE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_categoryservice_knowledge_manage.lookup_values_tls.build(:lookup_value_id=>irm_report_categoryservice_knowledge_manage.id,:meaning=>'知识库报表',:description=>'知识库报表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categoryservice_knowledge_manage.lookup_values_tls.build(:lookup_value_id=>irm_report_categoryservice_knowledge_manage.id,:meaning=>'Service knowledge report',:description=>'Service knowledge report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categoryservice_knowledge_manage.save
    irm_report_categorysurvey= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_CATEGORY',:lookup_code=>'SURVEY',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_categorysurvey.lookup_values_tls.build(:lookup_value_id=>irm_report_categorysurvey.id,:meaning=>'调查问卷报表',:description=>'调查问卷报表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categorysurvey.lookup_values_tls.build(:lookup_value_id=>irm_report_categorysurvey.id,:meaning=>'Survey report',:description=>'Survey report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categorysurvey.save
    irm_report_categorysystem_global= Irm::LookupValue.new(:lookup_type=>'IRM_REPORT_CATEGORY',:lookup_code=>'SYSTEM_GLOBAL',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_report_categorysystem_global.lookup_values_tls.build(:lookup_value_id=>irm_report_categorysystem_global.id,:meaning=>'系统报表',:description=>'系统报表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categorysystem_global.lookup_values_tls.build(:lookup_value_id=>irm_report_categorysystem_global.id,:meaning=>'Incident request report',:description=>'Incident request report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_report_categorysystem_global.save

  end

  def self.down
  end
end
