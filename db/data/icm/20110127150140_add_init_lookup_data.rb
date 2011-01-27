class AddInitLookupData < ActiveRecord::Migration
  def self.up
    icm_process_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_PROCESS_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_process_type.lookup_types_tls.build(:lookup_type_id=>icm_process_type.id,:meaning=>'ICM分配流程',:description=>'ICM分配流程',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_process_type.lookup_types_tls.build(:lookup_type_id=>icm_process_type.id,:meaning=>'ICM dispatch process',:description=>'ICM dispatch process',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_process_type.save
    icm_priority_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_PRIORITY_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_priority_type.lookup_types_tls.build(:lookup_type_id=>icm_priority_type.id,:meaning=>'ICM优先级分类',:description=>'ICM优先级分类',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_type.lookup_types_tls.build(:lookup_type_id=>icm_priority_type.id,:meaning=>'ICM priority type',:description=>'ICM priority type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_type.save
    icm_close_reason_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_CLOSE_REASON_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_close_reason_type.lookup_types_tls.build(:lookup_type_id=>icm_close_reason_type.id,:meaning=>'ICM关闭事件类型',:description=>'ICM关闭事件类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_close_reason_type.lookup_types_tls.build(:lookup_type_id=>icm_close_reason_type.id,:meaning=>'ICM close reason type',:description=>'ICM close reason type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_close_reason_type.save
    icm_service_code=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_SERVICE_CODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_service_code.lookup_types_tls.build(:lookup_type_id=>icm_service_code.id,:meaning=>'事故单服务类型',:description=>'事故单服务类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_service_code.lookup_types_tls.build(:lookup_type_id=>icm_service_code.id,:meaning=>'Incident request service codes',:description=>'Incident request service codes',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_service_code.save
    icm_request_type_code=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_REQUEST_TYPE_CODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_type_code.lookup_types_tls.build(:lookup_type_id=>icm_request_type_code.id,:meaning=>'事故单请求类型',:description=>'事故单请求类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_code.lookup_types_tls.build(:lookup_type_id=>icm_request_type_code.id,:meaning=>'Incident request type',:description=>'Incident request type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_code.save
    icm_request_report_source=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ICM_REQUEST_REPORT_SOURCE',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_report_source.lookup_types_tls.build(:lookup_type_id=>icm_request_report_source.id,:meaning=>'事故单来源类型',:description=>'事故单来源类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_source.lookup_types_tls.build(:lookup_type_id=>icm_request_report_source.id,:meaning=>'Incident report source',:description=>'Incident report source',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_source.save

    icm_process_typenormal_process= Irm::LookupValue.new(:lookup_type=>'ICM_PROCESS_TYPE',:lookup_code=>'NORMAL_PROCESS',:start_date_active=>'2010-12-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_process_typenormal_process.lookup_values_tls.build(:lookup_value_id=>icm_process_typenormal_process.id,:meaning=>'普通流程',:description=>'普通流程',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_process_typenormal_process.lookup_values_tls.build(:lookup_value_id=>icm_process_typenormal_process.id,:meaning=>'Normal process',:description=>'Normal process',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_process_typenormal_process.save
    icm_priority_typecritical= Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',:lookup_code=>'CRITICAL',:start_date_active=>'2010-12-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_priority_typecritical.lookup_values_tls.build(:lookup_value_id=>icm_priority_typecritical.id,:meaning=>'关键',:description=>'关键',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typecritical.lookup_values_tls.build(:lookup_value_id=>icm_priority_typecritical.id,:meaning=>'Critical',:description=>'Critical',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typecritical.save
    icm_priority_typehigh= Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',:lookup_code=>'HIGH',:start_date_active=>'2010-12-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_priority_typehigh.lookup_values_tls.build(:lookup_value_id=>icm_priority_typehigh.id,:meaning=>'高级',:description=>'高级',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typehigh.lookup_values_tls.build(:lookup_value_id=>icm_priority_typehigh.id,:meaning=>'High',:description=>'High',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typehigh.save
    icm_priority_typemedium= Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',:lookup_code=>'MEDIUM',:start_date_active=>'2010-12-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_priority_typemedium.lookup_values_tls.build(:lookup_value_id=>icm_priority_typemedium.id,:meaning=>'中等',:description=>'中等',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typemedium.lookup_values_tls.build(:lookup_value_id=>icm_priority_typemedium.id,:meaning=>'Medium',:description=>'Medium',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typemedium.save
    icm_priority_typelow= Irm::LookupValue.new(:lookup_type=>'ICM_PRIORITY_TYPE',:lookup_code=>'LOW',:start_date_active=>'2010-12-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_priority_typelow.lookup_values_tls.build(:lookup_value_id=>icm_priority_typelow.id,:meaning=>'低级别',:description=>'低级别',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typelow.lookup_values_tls.build(:lookup_value_id=>icm_priority_typelow.id,:meaning=>'Low',:description=>'Low',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_priority_typelow.save
    icm_close_reason_typeproblem_report= Irm::LookupValue.new(:lookup_type=>'ICM_CLOSE_REASON_TYPE',:lookup_code=>'PROBLEM_REPORT',:start_date_active=>'2010-12-24',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_close_reason_typeproblem_report.lookup_values_tls.build(:lookup_value_id=>icm_close_reason_typeproblem_report.id,:meaning=>'错误报告',:description=>'错误报告',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_close_reason_typeproblem_report.lookup_values_tls.build(:lookup_value_id=>icm_close_reason_typeproblem_report.id,:meaning=>'Problem Report',:description=>'Problem Report',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_close_reason_typeproblem_report.save

    icm_service_codeoral_ebs_inv= Irm::LookupValue.new(:lookup_type=>'ICM_SERVICE_CODE',:lookup_code=>'ORAL_EBS_INV',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_service_codeoral_ebs_inv.lookup_values_tls.build(:lookup_value_id=>icm_service_codeoral_ebs_inv.id,:meaning=>'Oracle ebs 库存',:description=>'Oracle ebs 库存',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_service_codeoral_ebs_inv.lookup_values_tls.build(:lookup_value_id=>icm_service_codeoral_ebs_inv.id,:meaning=>'Oracle ebs inventory',:description=>'Oracle ebs inventory',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_service_codeoral_ebs_inv.save
    icm_request_type_coderequested_to_perform= Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_TYPE_CODE',:lookup_code=>'REQUESTED_TO_PERFORM',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_type_coderequested_to_perform.lookup_values_tls.build(:lookup_value_id=>icm_request_type_coderequested_to_perform.id,:meaning=>'请求履行',:description=>'请求履行',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_coderequested_to_perform.lookup_values_tls.build(:lookup_value_id=>icm_request_type_coderequested_to_perform.id,:meaning=>'Request to perform',:description=>'Request to perform',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_coderequested_to_perform.save
    icm_request_type_coderequested_to_change= Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_TYPE_CODE',:lookup_code=>'REQUESTED_TO_CHANGE',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_type_coderequested_to_change.lookup_values_tls.build(:lookup_value_id=>icm_request_type_coderequested_to_change.id,:meaning=>'请求变更',:description=>'请求变更',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_coderequested_to_change.lookup_values_tls.build(:lookup_value_id=>icm_request_type_coderequested_to_change.id,:meaning=>'Request to change',:description=>'Request to change',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_type_coderequested_to_change.save
    icm_request_report_sourcecustomer_submit= Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_REPORT_SOURCE',:lookup_code=>'CUSTOMER_SUBMIT',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_report_sourcecustomer_submit.lookup_values_tls.build(:lookup_value_id=>icm_request_report_sourcecustomer_submit.id,:meaning=>'客户提交',:description=>'客户提交',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_sourcecustomer_submit.lookup_values_tls.build(:lookup_value_id=>icm_request_report_sourcecustomer_submit.id,:meaning=>'Customer submit',:description=>'Customer submit',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_sourcecustomer_submit.save
    icm_request_report_sourcecustomer_phone_call= Irm::LookupValue.new(:lookup_type=>'ICM_REQUEST_REPORT_SOURCE',:lookup_code=>'CUSTOMER_PHONE_CALL',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    icm_request_report_sourcecustomer_phone_call.lookup_values_tls.build(:lookup_value_id=>icm_request_report_sourcecustomer_phone_call.id,:meaning=>'客户电话',:description=>'客户电话',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_sourcecustomer_phone_call.lookup_values_tls.build(:lookup_value_id=>icm_request_report_sourcecustomer_phone_call.id,:meaning=>'Customer phone call',:description=>'Customer phone call',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    icm_request_report_sourcecustomer_phone_call.save    
  end

  def self.down
  end
end
