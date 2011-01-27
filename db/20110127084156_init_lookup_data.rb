class InitLookupData < ActiveRecord::Migration
  def self.up
    Irm::LookupValue.find(:all).each do |f|
      f.destroy
    end
    Irm::LookupType.find(:all).each do |f|
      f.destroy
    end
    entity_code=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ENTITY_CODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    entity_code.lookup_types_tls.build(:lookup_type_id=>entity_code.id,:meaning=>'ENTITY_CODE',:description=>'ENTITY_CODE',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    entity_code.lookup_types_tls.build(:lookup_type_id=>entity_code.id,:meaning=>'ENTITY_CODE',:description=>'ENTITY_CODE',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    entity_code.save
    system_status_code=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SYSTEM_STATUS_CODE',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_code.lookup_types_tls.build(:lookup_type_id=>system_status_code.id,:meaning=>'记录状态',:description=>'记录状态',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_code.lookup_types_tls.build(:lookup_type_id=>system_status_code.id,:meaning=>'Status Code',:description=>'Status Code',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_code.save
    timezone=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'TIMEZONE',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezone.lookup_types_tls.build(:lookup_type_id=>timezone.id,:meaning=>'时区',:description=>'时区',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezone.lookup_types_tls.build(:lookup_type_id=>timezone.id,:meaning=>'Timezone',:description=>'Timezone',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezone.save
    active_status=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'ACTIVE_STATUS',:status_code=>'ENABLED',:not_auto_mult=>true)
    active_status.lookup_types_tls.build(:lookup_type_id=>active_status.id,:meaning=>'可用',:description=>'可用',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    active_status.lookup_types_tls.build(:lookup_type_id=>active_status.id,:meaning=>'Active',:description=>'Active',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    active_status.save
    company_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'COMPANY_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    company_type.lookup_types_tls.build(:lookup_type_id=>company_type.id,:meaning=>'公司类型',:description=>'公司类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    company_type.lookup_types_tls.build(:lookup_type_id=>company_type.id,:meaning=>'Company Type',:description=>'Company Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    company_type.save
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
    system_yes_no=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SYSTEM_YES_NO',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_yes_no.lookup_types_tls.build(:lookup_type_id=>system_yes_no.id,:meaning=>'系统初始化YES_NO',:description=>'系统初始化YES_NO',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_no.lookup_types_tls.build(:lookup_type_id=>system_yes_no.id,:meaning=>'Init SYSTEM_YES_NO',:description=>'Init SYSTEM_YES_NO',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_no.save
    irm_support_role=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_SUPPORT_ROLE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_role.lookup_types_tls.build(:lookup_type_id=>irm_support_role.id,:meaning=>'支持组所在的角色',:description=>'支持组所在的角色',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_role.lookup_types_tls.build(:lookup_type_id=>irm_support_role.id,:meaning=>'support role of support_group',:description=>'support role of support_group',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_role.save
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

    system_status_codeenabled= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'ENABLED',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codeenabled.lookup_values_tls.build(:lookup_value_id=>system_status_codeenabled.id,:meaning=>'可用',:description=>'可用',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeenabled.lookup_values_tls.build(:lookup_value_id=>system_status_codeenabled.id,:meaning=>'Enabled',:description=>'Enabled',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeenabled.save
    system_status_codearchive= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'ARCHIVE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codearchive.lookup_values_tls.build(:lookup_value_id=>system_status_codearchive.id,:meaning=>'归档',:description=>'归档',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codearchive.lookup_values_tls.build(:lookup_value_id=>system_status_codearchive.id,:meaning=>'Archive',:description=>'Archive',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codearchive.save
    system_status_codedelete= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'DELETE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codedelete.lookup_values_tls.build(:lookup_value_id=>system_status_codedelete.id,:meaning=>'删除',:description=>'删除',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codedelete.lookup_values_tls.build(:lookup_value_id=>system_status_codedelete.id,:meaning=>'Delete',:description=>'Delete',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codedelete.save
    system_status_codeobsolete= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'OBSOLETE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codeobsolete.lookup_values_tls.build(:lookup_value_id=>system_status_codeobsolete.id,:meaning=>'已过时',:description=>'已过时',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeobsolete.lookup_values_tls.build(:lookup_value_id=>system_status_codeobsolete.id,:meaning=>'Obsolete',:description=>'Obsolete',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeobsolete.save
    system_status_codeoffline= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'OFFLINE',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codeoffline.lookup_values_tls.build(:lookup_value_id=>system_status_codeoffline.id,:meaning=>'离线',:description=>'离线',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeoffline.lookup_values_tls.build(:lookup_value_id=>system_status_codeoffline.id,:meaning=>'Offline',:description=>'Offline',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeoffline.save
    system_status_codeproposed= Irm::LookupValue.new(:lookup_type=>'SYSTEM_STATUS_CODE',:lookup_code=>'PROPOSED',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_status_codeproposed.lookup_values_tls.build(:lookup_value_id=>system_status_codeproposed.id,:meaning=>'建议',:description=>'建议',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeproposed.lookup_values_tls.build(:lookup_value_id=>system_status_codeproposed.id,:meaning=>'Proposed',:description=>'Proposed',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_status_codeproposed.save
    entity_codeuser= Irm::LookupValue.new(:lookup_type=>'ENTITY_CODE',:lookup_code=>'USER',:start_date_active=>'2010-12-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    entity_codeuser.lookup_values_tls.build(:lookup_value_id=>entity_codeuser.id,:meaning=>'用户',:description=>'用户',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    entity_codeuser.lookup_values_tls.build(:lookup_value_id=>entity_codeuser.id,:meaning=>'User',:description=>'User',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    entity_codeuser.save
    active_statusenabled= Irm::LookupValue.new(:lookup_type=>'ACTIVE_STATUS',:lookup_code=>'ENABLED',:start_date_active=>'2010-12-14',:status_code=>'ENABLED',:not_auto_mult=>true)
    active_statusenabled.lookup_values_tls.build(:lookup_value_id=>active_statusenabled.id,:meaning=>'启用',:description=>'启用',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    active_statusenabled.lookup_values_tls.build(:lookup_value_id=>active_statusenabled.id,:meaning=>'Enabled',:description=>'Enabled',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    active_statusenabled.save
    active_statusoffline= Irm::LookupValue.new(:lookup_type=>'ACTIVE_STATUS',:lookup_code=>'OFFLINE',:start_date_active=>'2010-12-14',:status_code=>'ENABLED',:not_auto_mult=>true)
    active_statusoffline.lookup_values_tls.build(:lookup_value_id=>active_statusoffline.id,:meaning=>'失效',:description=>'失效',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    active_statusoffline.lookup_values_tls.build(:lookup_value_id=>active_statusoffline.id,:meaning=>'Offline',:description=>'Offline',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    active_statusoffline.save
    company_typecustomer= Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',:lookup_code=>'CUSTOMER',:start_date_active=>'2010-12-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    company_typecustomer.lookup_values_tls.build(:lookup_value_id=>company_typecustomer.id,:meaning=>'客户公司',:description=>'客户公司',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    company_typecustomer.lookup_values_tls.build(:lookup_value_id=>company_typecustomer.id,:meaning=>'Customer Company',:description=>'Customer Company',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    company_typecustomer.save
    company_typeoperation= Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',:lookup_code=>'OPERATION',:start_date_active=>'2010-12-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    company_typeoperation.lookup_values_tls.build(:lookup_value_id=>company_typeoperation.id,:meaning=>'运营公司',:description=>'运营公司',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    company_typeoperation.lookup_values_tls.build(:lookup_value_id=>company_typeoperation.id,:meaning=>'Operation Company',:description=>'Operation Company',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    company_typeoperation.save
    company_typesupplier= Irm::LookupValue.new(:lookup_type=>'COMPANY_TYPE',:lookup_code=>'SUPPLIER',:start_date_active=>'2010-12-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    company_typesupplier.lookup_values_tls.build(:lookup_value_id=>company_typesupplier.id,:meaning=>'供应商公司',:description=>'供应商公司',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    company_typesupplier.lookup_values_tls.build(:lookup_value_id=>company_typesupplier.id,:meaning=>'Supplier Company',:description=>'Supplier Company',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    company_typesupplier.save
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
    system_yes_noy= Irm::LookupValue.new(:lookup_type=>'SYSTEM_YES_NO',:lookup_code=>'Y',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_yes_noy.lookup_values_tls.build(:lookup_value_id=>system_yes_noy.id,:meaning=>'是',:description=>'是',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_noy.lookup_values_tls.build(:lookup_value_id=>system_yes_noy.id,:meaning=>'Y',:description=>'Y',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_noy.save
    system_yes_non= Irm::LookupValue.new(:lookup_type=>'SYSTEM_YES_NO',:lookup_code=>'N',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    system_yes_non.lookup_values_tls.build(:lookup_value_id=>system_yes_non.id,:meaning=>'否',:description=>'否',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_non.lookup_values_tls.build(:lookup_value_id=>system_yes_non.id,:meaning=>'N',:description=>'N',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    system_yes_non.save
    irm_support_roleservice_desk= Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',:lookup_code=>'SERVICE_DESK',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_roleservice_desk.lookup_values_tls.build(:lookup_value_id=>irm_support_roleservice_desk.id,:meaning=>'服务台',:description=>'服务台',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleservice_desk.lookup_values_tls.build(:lookup_value_id=>irm_support_roleservice_desk.id,:meaning=>'Service Desk',:description=>'Service Desk',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleservice_desk.save
    irm_support_roleone_line= Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',:lookup_code=>'ONE_LINE',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_roleone_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roleone_line.id,:meaning=>'一线',:description=>'一线',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleone_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roleone_line.id,:meaning=>'One Line',:description=>'One Line',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleone_line.save
    irm_support_roletwo_line= Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',:lookup_code=>'TWO_LINE',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_roletwo_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roletwo_line.id,:meaning=>'二线',:description=>'二线',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roletwo_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roletwo_line.id,:meaning=>'Two Line',:description=>'Two Line',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roletwo_line.save
    irm_support_rolethree_line= Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',:lookup_code=>'THREE_LINE',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_rolethree_line.lookup_values_tls.build(:lookup_value_id=>irm_support_rolethree_line.id,:meaning=>'三线',:description=>'三线',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_rolethree_line.lookup_values_tls.build(:lookup_value_id=>irm_support_rolethree_line.id,:meaning=>'Three Line',:description=>'Three Line',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_rolethree_line.save
    irm_support_roleprofession_line= Irm::LookupValue.new(:lookup_type=>'IRM_SUPPORT_ROLE',:lookup_code=>'PROFESSION_LINE',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_support_roleprofession_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roleprofession_line.id,:meaning=>'行业',:description=>'行业',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleprofession_line.lookup_values_tls.build(:lookup_value_id=>irm_support_roleprofession_line.id,:meaning=>'Profession Line',:description=>'Profession Line',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_support_roleprofession_line.save
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
    timezonegmt_p1400= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1400',:start_date_active=>'2010-12-14',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1400.id,:meaning=>'(格林威治标准时间+14：00) Line 岛时间 (Pacific/Kiritimati)',:description=>'(格林威治标准时间+14：00) Line 岛时间 (Pacific/Kiritimati)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1400.id,:meaning=>'(GMT+14:00) Line Is. Time (Pacific/Kiritimati)',:description=>'(GMT+14:00) Line Is. Time (Pacific/Kiritimati)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1400.save
    timezonegmt_p1300= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1300',:start_date_active=>'2010-12-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1300.id,:meaning=>'(格林威治标准时间+13：00) 菲尼克斯群岛时间 (Pacific/Enderbury)',:description=>'(格林威治标准时间+13：00) 菲尼克斯群岛时间 (Pacific/Enderbury)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1300.id,:meaning=>'(GMT+13:00) Phoenix Is. Time (Pacific/Enderbury)',:description=>'(GMT+13:00) Phoenix Is. Time (Pacific/Enderbury)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1300.save
    timezonegmt_p1300_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1300_2',:start_date_active=>'2010-12-16',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1300_2.id,:meaning=>'(格林威治标准时间+13：00) 东加时间 (Pacific/Tongatapu)',:description=>'(格林威治标准时间+13：00) 东加时间 (Pacific/Tongatapu)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1300_2.id,:meaning=>'(GMT+13:00) Tonga Time (Pacific/Tongatapu)',:description=>'(GMT+13:00) Tonga Time (Pacific/Tongatapu)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1300_2.save
    timezonegmt_p1245= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1245',:start_date_active=>'2010-12-17',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1245.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1245.id,:meaning=>'(格林威治标准时间+12：45) 查萨姆夏令时 (Pacific/Chatham)',:description=>'(格林威治标准时间+12：45) 查萨姆夏令时 (Pacific/Chatham)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1245.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1245.id,:meaning=>'(GMT+12:45) Chatham Daylight Time (Pacific/Chatham)',:description=>'(GMT+12:45) Chatham Daylight Time (Pacific/Chatham)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1245.save
    timezonegmt_p1200= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1200',:start_date_active=>'2010-12-18',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200.id,:meaning=>'(格林威治标准时间+12：00) 彼得罗巴甫洛夫斯克时间 (Asia/Kamchatka)',:description=>'(格林威治标准时间+12：00) 彼得罗巴甫洛夫斯克时间 (Asia/Kamchatka)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200.id,:meaning=>'(GMT+12:00) Petropavlovsk-Kamchatski Time (Asia/Kamchatka)',:description=>'(GMT+12:00) Petropavlovsk-Kamchatski Time (Asia/Kamchatka)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200.save
    timezonegmt_p1200_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1200_2',:start_date_active=>'2010-12-19',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1200_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200_2.id,:meaning=>'(格林威治标准时间+12：00) 新西兰夏令时 (Pacific/Auckland)',:description=>'(格林威治标准时间+12：00) 新西兰夏令时 (Pacific/Auckland)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200_2.id,:meaning=>'(GMT+12:00) New Zealand Daylight Time (Pacific/Auckland)',:description=>'(GMT+12:00) New Zealand Daylight Time (Pacific/Auckland)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200_2.save
    timezonegmt_p1200_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1200_3',:start_date_active=>'2010-12-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1200_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200_3.id,:meaning=>'(格林威治标准时间+12：00) 斐济时间 (Pacific/Fiji)',:description=>'(格林威治标准时间+12：00) 斐济时间 (Pacific/Fiji)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1200_3.id,:meaning=>'(GMT+12:00) Fiji Time (Pacific/Fiji)',:description=>'(GMT+12:00) Fiji Time (Pacific/Fiji)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1200_3.save
    timezonegmt_p1130= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1130',:start_date_active=>'2010-12-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1130.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1130.id,:meaning=>'(格林威治标准时间+11：30) 诺福克时间 (Pacific/Norfolk)',:description=>'(格林威治标准时间+11：30) 诺福克时间 (Pacific/Norfolk)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1130.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1130.id,:meaning=>'(GMT+11:30) Norfolk Time (Pacific/Norfolk)',:description=>'(GMT+11:30) Norfolk Time (Pacific/Norfolk)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1130.save
    timezonegmt_p1100= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1100',:start_date_active=>'2010-12-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1100.id,:meaning=>'(格林威治标准时间+11：00) 所罗门群岛时间 (Pacific/Guadalcanal)',:description=>'(格林威治标准时间+11：00) 所罗门群岛时间 (Pacific/Guadalcanal)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1100.id,:meaning=>'(GMT+11:00) Solomon Is. Time (Pacific/Guadalcanal)',:description=>'(GMT+11:00) Solomon Is. Time (Pacific/Guadalcanal)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1100.save
    timezonegmt_p1030= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1030',:start_date_active=>'2010-12-23',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1030.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1030.id,:meaning=>'(格林威治标准时间+10：30) 豪公夏令时 (Australia/Lord_Howe)',:description=>'(格林威治标准时间+10：30) 豪公夏令时 (Australia/Lord_Howe)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1030.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1030.id,:meaning=>'(GMT+10:30) Lord Howe Summer Time (Australia/Lord_Howe)',:description=>'(GMT+10:30) Lord Howe Summer Time (Australia/Lord_Howe)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1030.save
    timezonegmt_p1000= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1000',:start_date_active=>'2010-12-24',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1000.id,:meaning=>'(格林威治标准时间+10：00) 东部标准时间（昆士兰） (Australia/Brisbane)',:description=>'(格林威治标准时间+10：00) 东部标准时间（昆士兰） (Australia/Brisbane)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1000.id,:meaning=>'(GMT+10:00) Eastern Standard Time (Queensland)',:description=>'(GMT+10:00) Eastern Standard Time (Queensland)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1000.save
    timezonegmt_p1000_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P1000_2',:start_date_active=>'2010-12-25',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p1000_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1000_2.id,:meaning=>'(格林威治标准时间+10：00) 东部夏令时（新南威尔斯） (Australia/Sydney)',:description=>'(格林威治标准时间+10：00) 东部夏令时（新南威尔斯） (Australia/Sydney)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1000_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p1000_2.id,:meaning=>'(GMT+10:00) Eastern Summer Time (New South Wales)',:description=>'(GMT+10:00) Eastern Summer Time (New South Wales)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p1000_2.save
    timezonegmt_p0930= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0930',:start_date_active=>'2010-12-26',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0930.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0930.id,:meaning=>'(格林威治标准时间+09：30) 中央夏令时（南澳大利亚） (Australia/Adelaide)',:description=>'(格林威治标准时间+09：30) 中央夏令时（南澳大利亚） (Australia/Adelaide)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0930.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0930.id,:meaning=>'(GMT+09:30) Central Summer Time (South Australia)',:description=>'(GMT+09:30) Central Summer Time (South Australia)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0930.save
    timezonegmt_p0930_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0930_2',:start_date_active=>'2010-12-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0930_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0930_2.id,:meaning=>'(格林威治标准时间+09：30) 中央标准时间（北领地） (Australia/Darwin)',:description=>'(格林威治标准时间+09：30) 中央标准时间（北领地） (Australia/Darwin)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0930_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0930_2.id,:meaning=>'(GMT+09:30) Central Standard Time (Northern Territory)',:description=>'(GMT+09:30) Central Standard Time (Northern Territory)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0930_2.save
    timezonegmt_p0900= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0900',:start_date_active=>'2010-12-28',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0900.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0900.id,:meaning=>'(格林威治标准时间+09：00) 韩国标准时间 (Asia/Seoul)',:description=>'(格林威治标准时间+09：00) 韩国标准时间 (Asia/Seoul)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0900.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0900.id,:meaning=>'(GMT+09:00) Korea Standard Time (Asia/Seoul)',:description=>'(GMT+09:00) Korea Standard Time (Asia/Seoul)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0900.save
    timezonegmt_p0900_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0900_2',:start_date_active=>'2010-12-29',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0900_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0900_2.id,:meaning=>'(格林威治标准时间+09：00) 日本标准时间 (Asia/Tokyo)',:description=>'(格林威治标准时间+09：00) 日本标准时间 (Asia/Tokyo)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0900_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0900_2.id,:meaning=>'(GMT+09:00) Japan Standard Time (Asia/Tokyo)',:description=>'(GMT+09:00) Japan Standard Time (Asia/Tokyo)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0900_2.save
    timezonegmt_p0800= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800',:start_date_active=>'2010-12-30',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800.id,:meaning=>'(格林威治标准时间+08：00) 香港时间 (Asia/Hong_Kong)',:description=>'(格林威治标准时间+08：00) 香港时间 (Asia/Hong_Kong)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800.id,:meaning=>'(GMT+08:00) Hong Kong Time (Asia/Hong_Kong)',:description=>'(GMT+08:00) Hong Kong Time (Asia/Hong_Kong)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800.save
    timezonegmt_p0800_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_2',:start_date_active=>'2010-12-31',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_2.id,:meaning=>'(格林威治标准时间+08：00) 马来西亚时间 (Asia/Kuala_Lumpur)',:description=>'(格林威治标准时间+08：00) 马来西亚时间 (Asia/Kuala_Lumpur)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_2.id,:meaning=>'(GMT+08:00) Malaysia Time (Asia/Kuala_Lumpur)',:description=>'(GMT+08:00) Malaysia Time (Asia/Kuala_Lumpur)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_2.save
    timezonegmt_p0800_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_3',:start_date_active=>'2011-01-01',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_3.id,:meaning=>'(格林威治标准时间+08：00) 菲律宾时间 (Asia/Manila)',:description=>'(格林威治标准时间+08：00) 菲律宾时间 (Asia/Manila)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_3.id,:meaning=>'(GMT+08:00) Philippines Time (Asia/Manila)',:description=>'(GMT+08:00) Philippines Time (Asia/Manila)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_3.save
    timezonegmt_p0800_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_4',:start_date_active=>'2011-01-02',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_4.id,:meaning=>'(格林威治标准时间+08：00) 中国标准时间 (Asia/Shanghai)',:description=>'(格林威治标准时间+08：00) 中国标准时间 (Asia/Shanghai)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_4.id,:meaning=>'(GMT+08:00) China Standard Time (Asia/Shanghai)',:description=>'(GMT+08:00) China Standard Time (Asia/Shanghai)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_4.save
    timezonegmt_p0800_5= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_5',:start_date_active=>'2011-01-03',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_5.id,:meaning=>'(格林威治标准时间+08：00) 新加坡时间 (Asia/Singapore)',:description=>'(格林威治标准时间+08：00) 新加坡时间 (Asia/Singapore)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_5.id,:meaning=>'(GMT+08:00) Singapore Time (Asia/Singapore)',:description=>'(GMT+08:00) Singapore Time (Asia/Singapore)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_5.save
    timezonegmt_p0800_6= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_6',:start_date_active=>'2011-01-04',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_6.id,:meaning=>'(格林威治标准时间+08：00) 中国标准时间 (Asia/Taipei)',:description=>'(格林威治标准时间+08：00) 中国标准时间 (Asia/Taipei)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_6.id,:meaning=>'(GMT+08:00) China Standard Time (Asia/Taipei)',:description=>'(GMT+08:00) China Standard Time (Asia/Taipei)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_6.save
    timezonegmt_p0800_7= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0800_7',:start_date_active=>'2011-01-05',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0800_7.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_7.id,:meaning=>'(格林威治标准时间+08：00) 西部标准时间（澳大利亚） (Australia/Perth)',:description=>'(格林威治标准时间+08：00) 西部标准时间（澳大利亚） (Australia/Perth)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_7.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0800_7.id,:meaning=>'(GMT+08:00) Western Standard Time (Australia)',:description=>'(GMT+08:00) Western Standard Time (Australia)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0800_7.save
    timezonegmt_p0700= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0700',:start_date_active=>'2011-01-06',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0700.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700.id,:meaning=>'(格林威治标准时间+07：00) 印度支那时间 (Asia/Bangkok)',:description=>'(格林威治标准时间+07：00) 印度支那时间 (Asia/Bangkok)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700.id,:meaning=>'(GMT+07:00) Indochina Time (Asia/Bangkok)',:description=>'(GMT+07:00) Indochina Time (Asia/Bangkok)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700.save
    timezonegmt_p0700_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0700_2',:start_date_active=>'2011-01-07',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0700_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700_2.id,:meaning=>'(格林威治标准时间+07：00) 西印度尼西亚时间 (Asia/Jakarta)',:description=>'(格林威治标准时间+07：00) 西印度尼西亚时间 (Asia/Jakarta)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700_2.id,:meaning=>'(GMT+07:00) West Indonesia Time (Asia/Jakarta)',:description=>'(GMT+07:00) West Indonesia Time (Asia/Jakarta)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700_2.save
    timezonegmt_p0700_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0700_3',:start_date_active=>'2011-01-08',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0700_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700_3.id,:meaning=>'(格林威治标准时间+07：00) 印度支那时间 (Asia/Saigon)',:description=>'(格林威治标准时间+07：00) 印度支那时间 (Asia/Saigon)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0700_3.id,:meaning=>'(GMT+07:00) Indochina Time (Asia/Saigon)',:description=>'(GMT+07:00) Indochina Time (Asia/Saigon)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0700_3.save
    timezonegmt_p0630= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0630',:start_date_active=>'2011-01-09',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0630.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0630.id,:meaning=>'(格林威治标准时间+06：30) 缅甸时间 (Asia/Rangoon)',:description=>'(格林威治标准时间+06：30) 缅甸时间 (Asia/Rangoon)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0630.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0630.id,:meaning=>'(GMT+06:30) Myanmar Time (Asia/Rangoon)',:description=>'(GMT+06:30) Myanmar Time (Asia/Rangoon)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0630.save
    timezonegmt_p0600= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0600',:start_date_active=>'2011-01-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0600.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0600.id,:meaning=>'(格林威治标准时间+06：00) 孟加拉夏令时 (Asia/Dacca)',:description=>'(格林威治标准时间+06：00) 孟加拉夏令时 (Asia/Dacca)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0600.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0600.id,:meaning=>'(GMT+06:00) Bangladesh Summer Time (Asia/Dacca)',:description=>'(GMT+06:00) Bangladesh Summer Time (Asia/Dacca)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0600.save
    timezonegmt_p0545= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0545',:start_date_active=>'2011-01-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0545.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0545.id,:meaning=>'(格林威治标准时间+05：45) 尼泊尔时间 (Asia/Katmandu)',:description=>'(格林威治标准时间+05：45) 尼泊尔时间 (Asia/Katmandu)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0545.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0545.id,:meaning=>'(GMT+05:45) Nepal Time (Asia/Katmandu)',:description=>'(GMT+05:45) Nepal Time (Asia/Katmandu)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0545.save
    timezonegmt_p0530= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0530',:start_date_active=>'2011-01-12',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0530.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0530.id,:meaning=>'(格林威治标准时间+05：30) 印度标准时间 (Asia/Calcutta)',:description=>'(格林威治标准时间+05：30) 印度标准时间 (Asia/Calcutta)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0530.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0530.id,:meaning=>'(GMT+05:30) India Standard Time (Asia/Calcutta)',:description=>'(GMT+05:30) India Standard Time (Asia/Calcutta)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0530.save
    timezonegmt_p0530_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0530_2',:start_date_active=>'2011-01-13',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0530_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0530_2.id,:meaning=>'(格林威治标准时间+05：30) 印度标准时间 (Asia/Colombo)',:description=>'(格林威治标准时间+05：30) 印度标准时间 (Asia/Colombo)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0530_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0530_2.id,:meaning=>'(GMT+05:30) India Standard Time (Asia/Colombo)',:description=>'(GMT+05:30) India Standard Time (Asia/Colombo)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0530_2.save
    timezonegmt_p0500= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0500',:start_date_active=>'2011-01-14',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0500.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500.id,:meaning=>'(格林威治标准时间+05：00) 巴基斯坦时间 (Asia/Karachi)',:description=>'(格林威治标准时间+05：00) 巴基斯坦时间 (Asia/Karachi)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500.id,:meaning=>'(GMT+05:00) Pakistan Time (Asia/Karachi)',:description=>'(GMT+05:00) Pakistan Time (Asia/Karachi)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500.save
    timezonegmt_p0500_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0500_2',:start_date_active=>'2011-01-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0500_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500_2.id,:meaning=>'(格林威治标准时间+05：00) 乌兹别克斯坦时间 (Asia/Tashkent)',:description=>'(格林威治标准时间+05：00) 乌兹别克斯坦时间 (Asia/Tashkent)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500_2.id,:meaning=>'(GMT+05:00) Uzbekistan Time (Asia/Tashkent)',:description=>'(GMT+05:00) Uzbekistan Time (Asia/Tashkent)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500_2.save
    timezonegmt_p0500_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0500_3',:start_date_active=>'2011-01-16',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0500_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500_3.id,:meaning=>'(格林威治标准时间+05：00) Yekaterinburg 时间 (Asia/Yekaterinburg)',:description=>'(格林威治标准时间+05：00) Yekaterinburg 时间 (Asia/Yekaterinburg)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0500_3.id,:meaning=>'(GMT+05:00) Yekaterinburg Time (Asia/Yekaterinburg)',:description=>'(GMT+05:00) Yekaterinburg Time (Asia/Yekaterinburg)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0500_3.save
    timezonegmt_p0430= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0430',:start_date_active=>'2011-01-17',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0430.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0430.id,:meaning=>'(格林威治标准时间+04：30) 阿富汗时间 (Asia/Kabul)',:description=>'(格林威治标准时间+04：30) 阿富汗时间 (Asia/Kabul)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0430.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0430.id,:meaning=>'(GMT+04:30) Afghanistan Time (Asia/Kabul)',:description=>'(GMT+04:30) Afghanistan Time (Asia/Kabul)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0430.save
    timezonegmt_p0400= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0400',:start_date_active=>'2011-01-18',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0400.id,:meaning=>'(格林威治标准时间+04：00) 波斯湾标准时间 (Asia/Dubai)',:description=>'(格林威治标准时间+04：00) 波斯湾标准时间 (Asia/Dubai)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0400.id,:meaning=>'(GMT+04:00) Gulf Standard Time (Asia/Dubai)',:description=>'(GMT+04:00) Gulf Standard Time (Asia/Dubai)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0400.save
    timezonegmt_p0400_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0400_2',:start_date_active=>'2011-01-19',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0400_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0400_2.id,:meaning=>'(格林威治标准时间+04：00) 乔治亚时间 (Asia/Tbilisi)',:description=>'(格林威治标准时间+04：00) 乔治亚时间 (Asia/Tbilisi)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0400_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0400_2.id,:meaning=>'(GMT+04:00) Georgia Time (Asia/Tbilisi)',:description=>'(GMT+04:00) Georgia Time (Asia/Tbilisi)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0400_2.save
    timezonegmt_p0330= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0330',:start_date_active=>'2011-01-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0330.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0330.id,:meaning=>'(格林威治标准时间+03：30) 伊朗标准时间 (Asia/Tehran)',:description=>'(格林威治标准时间+03：30) 伊朗标准时间 (Asia/Tehran)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0330.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0330.id,:meaning=>'(GMT+03:30) Iran Standard Time (Asia/Tehran)',:description=>'(GMT+03:30) Iran Standard Time (Asia/Tehran)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0330.save
    timezonegmt_p0300= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0300',:start_date_active=>'2011-01-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300.id,:meaning=>'(格林威治标准时间+03：00) 东非时间 (Africa/Nairobi)',:description=>'(格林威治标准时间+03：00) 东非时间 (Africa/Nairobi)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300.id,:meaning=>'(GMT+03:00) Eastern African Time (Africa/Nairobi)',:description=>'(GMT+03:00) Eastern African Time (Africa/Nairobi)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300.save
    timezonegmt_p0300_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0300_2',:start_date_active=>'2011-01-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_2.id,:meaning=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Baghdad)',:description=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Baghdad)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_2.id,:meaning=>'(GMT+03:00) Arabia Standard Time (Asia/Baghdad)',:description=>'(GMT+03:00) Arabia Standard Time (Asia/Baghdad)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_2.save
    timezonegmt_p0300_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0300_3',:start_date_active=>'2011-01-23',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0300_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_3.id,:meaning=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Kuwait)',:description=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Kuwait)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_3.id,:meaning=>'(GMT+03:00) Arabia Standard Time (Asia/Kuwait)',:description=>'(GMT+03:00) Arabia Standard Time (Asia/Kuwait)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_3.save
    timezonegmt_p0300_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0300_4',:start_date_active=>'2011-01-24',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0300_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_4.id,:meaning=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Riyadh)',:description=>'(格林威治标准时间+03：00) 阿拉伯标准时间 (Asia/Riyadh)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_4.id,:meaning=>'(GMT+03:00) Arabia Standard Time (Asia/Riyadh)',:description=>'(GMT+03:00) Arabia Standard Time (Asia/Riyadh)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_4.save
    timezonegmt_p0300_5= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0300_5',:start_date_active=>'2011-01-25',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0300_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_5.id,:meaning=>'(格林威治标准时间+03：00) 莫斯科标准时间 (Europe/Moscow)',:description=>'(格林威治标准时间+03：00) 莫斯科标准时间 (Europe/Moscow)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0300_5.id,:meaning=>'(GMT+03:00) Moscow Standard Time (Europe/Moscow)',:description=>'(GMT+03:00) Moscow Standard Time (Europe/Moscow)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0300_5.save
    timezonegmt_p0200= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200',:start_date_active=>'2011-01-26',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Africa/Cairo)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Africa/Cairo)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200.id,:meaning=>'(GMT+02:00) Eastern European Time (Africa/Cairo)',:description=>'(GMT+02:00) Eastern European Time (Africa/Cairo)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200.save
    timezonegmt_p0200_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_2',:start_date_active=>'2011-01-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_2.id,:meaning=>'(格林威治标准时间+02：00) 南非标准时间 (Africa/Johannesburg)',:description=>'(格林威治标准时间+02：00) 南非标准时间 (Africa/Johannesburg)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_2.id,:meaning=>'(GMT+02:00) South Africa Standard Time (Africa/Johannesburg)',:description=>'(GMT+02:00) South Africa Standard Time (Africa/Johannesburg)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_2.save
    timezonegmt_p0200_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_3',:start_date_active=>'2011-01-28',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_3.id,:meaning=>'(格林威治标准时间+02：00) 以色列标准时间 (Asia/Jerusalem)',:description=>'(格林威治标准时间+02：00) 以色列标准时间 (Asia/Jerusalem)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_3.id,:meaning=>'(GMT+02:00) Israel Standard Time (Asia/Jerusalem)',:description=>'(GMT+02:00) Israel Standard Time (Asia/Jerusalem)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_3.save
    timezonegmt_p0200_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_4',:start_date_active=>'2011-01-29',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_4.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Athens)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Athens)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_4.id,:meaning=>'(GMT+02:00) Eastern European Time (Europe/Athens)',:description=>'(GMT+02:00) Eastern European Time (Europe/Athens)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_4.save
    timezonegmt_p0200_5= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_5',:start_date_active=>'2011-01-30',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_5.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Bucharest)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Bucharest)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_5.id,:meaning=>'(GMT+02:00) Eastern European Time (Europe/Bucharest)',:description=>'(GMT+02:00) Eastern European Time (Europe/Bucharest)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_5.save
    timezonegmt_p0200_6= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_6',:start_date_active=>'2011-01-31',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_6.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Helsinki)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Helsinki)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_6.id,:meaning=>'(GMT+02:00) Eastern European Time (Europe/Helsinki)',:description=>'(GMT+02:00) Eastern European Time (Europe/Helsinki)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_6.save
    timezonegmt_p0200_7= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_7',:start_date_active=>'2011-02-01',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_7.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_7.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Istanbul)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Istanbul)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_7.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_7.id,:meaning=>'(GMT+02:00) Eastern European Time (Europe/Istanbul)',:description=>'(GMT+02:00) Eastern European Time (Europe/Istanbul)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_7.save
    timezonegmt_p0200_8= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0200_8',:start_date_active=>'2011-02-02',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0200_8.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_8.id,:meaning=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Minsk)',:description=>'(格林威治标准时间+02：00) 东欧时间 (Europe/Minsk)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_8.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0200_8.id,:meaning=>'(GMT+02:00) Eastern European Time (Europe/Minsk)',:description=>'(GMT+02:00) Eastern European Time (Europe/Minsk)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0200_8.save
    timezonegmt_p0100= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100',:start_date_active=>'2011-02-03',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Amsterdam)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Amsterdam)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Amsterdam)',:description=>'(GMT+01:00) Central European Time (Europe/Amsterdam)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100.save
    timezonegmt_p0100_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100_2',:start_date_active=>'2011-02-04',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_2.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Berlin)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Berlin)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_2.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Berlin)',:description=>'(GMT+01:00) Central European Time (Europe/Berlin)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_2.save
    timezonegmt_p0100_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100_3',:start_date_active=>'2011-02-05',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_3.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Brussels)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Brussels)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_3.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Brussels)',:description=>'(GMT+01:00) Central European Time (Europe/Brussels)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_3.save
    timezonegmt_p0100_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100_4',:start_date_active=>'2011-02-06',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_4.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Paris)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Paris)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_4.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Paris)',:description=>'(GMT+01:00) Central European Time (Europe/Paris)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_4.save
    timezonegmt_p0100_5= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100_5',:start_date_active=>'2011-02-07',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_5.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Prague)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Prague)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_5.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Prague)',:description=>'(GMT+01:00) Central European Time (Europe/Prague)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_5.save
    timezonegmt_p0100_6= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0100_6',:start_date_active=>'2011-02-08',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0100_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_6.id,:meaning=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Rome)',:description=>'(格林威治标准时间+01：00) 中欧时间 (Europe/Rome)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_6.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0100_6.id,:meaning=>'(GMT+01:00) Central European Time (Europe/Rome)',:description=>'(GMT+01:00) Central European Time (Europe/Rome)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0100_6.save
    timezonegmt_p0000= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0000',:start_date_active=>'2011-02-09',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000.id,:meaning=>'(格林威治标准时间+00：00) 格林威治时间 (Europe/Dublin)',:description=>'(格林威治标准时间+00：00) 格林威治时间 (Europe/Dublin)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000.id,:meaning=>'(GMT+00:00) Greenwich Mean Time (Europe/Dublin)',:description=>'(GMT+00:00) Greenwich Mean Time (Europe/Dublin)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000.save
    timezonegmt_p0000_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0000_2',:start_date_active=>'2011-02-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0000_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_2.id,:meaning=>'(格林威治标准时间+00：00) 西欧时间 (Europe/Lisbon)',:description=>'(格林威治标准时间+00：00) 西欧时间 (Europe/Lisbon)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_2.id,:meaning=>'(GMT+00:00) Western European Time (Europe/Lisbon)',:description=>'(GMT+00:00) Western European Time (Europe/Lisbon)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_2.save
    timezonegmt_p0000_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0000_3',:start_date_active=>'2011-02-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0000_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_3.id,:meaning=>'(格林威治标准时间+00：00) 格林威治时间 (Europe/London)',:description=>'(格林威治标准时间+00：00) 格林威治时间 (Europe/London)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_3.id,:meaning=>'(GMT+00:00) Greenwich Mean Time (Europe/London)',:description=>'(GMT+00:00) Greenwich Mean Time (Europe/London)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_3.save
    timezonegmt_p0000_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_P0000_4',:start_date_active=>'2011-02-12',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_p0000_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_4.id,:meaning=>'(格林威治标准时间+00：00) 格林威治时间 (GMT)',:description=>'(格林威治标准时间+00：00) 格林威治时间 (GMT)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_p0000_4.id,:meaning=>'(GMT+00:00) Greenwich Mean Time (GMT)',:description=>'(GMT+00:00) Greenwich Mean Time (GMT)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_p0000_4.save
    timezonegmt_m0100= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0100',:start_date_active=>'2011-02-13',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0100.id,:meaning=>'(格林威治标准时间-01：00) 佛德角时间 (Atlantic/Cape_Verde)',:description=>'(格林威治标准时间-01：00) 佛德角时间 (Atlantic/Cape_Verde)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0100.id,:meaning=>'(GMT-01:00) Cape Verde Time (Atlantic/Cape_Verde)',:description=>'(GMT-01:00) Cape Verde Time (Atlantic/Cape_Verde)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0100.save
    timezonegmt_m0200= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0200',:start_date_active=>'2011-02-14',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0200.id,:meaning=>'(格林威治标准时间-02：00) 南乔治亚标准时间 (Atlantic/South_Georgia)',:description=>'(格林威治标准时间-02：00) 南乔治亚标准时间 (Atlantic/South_Georgia)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0200.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0200.id,:meaning=>'(GMT-02:00) South Georgia Time (Atlantic/South_Georgia)',:description=>'(GMT-02:00) South Georgia Standard Time (Atlantic/South_Georgia)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0200.save
    timezonegmt_m0300= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0300',:start_date_active=>'2011-02-15',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0300.id,:meaning=>'(格林威治标准时间-03：00) 阿根廷时间 (America/Buenos_Aires)',:description=>'(格林威治标准时间-03：00) 阿根廷时间 (America/Buenos_Aires)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0300.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0300.id,:meaning=>'(GMT-03:00) Argentine Time (America/Buenos_Aires)',:description=>'(GMT-03:00) Argentine Time (America/Buenos_Aires)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0300.save
    timezonegmt_m0300_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0300_2',:start_date_active=>'2011-02-16',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0300_2.id,:meaning=>'(格林威治标准时间-03：00) 巴西利亚夏令时 (America/Sao_Paulo)',:description=>'(格林威治标准时间-03：00) 巴西利亚夏令时 (America/Sao_Paulo)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0300_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0300_2.id,:meaning=>'(GMT-03:00) Brasilia Summer Time (America/Sao_Paulo)',:description=>'(GMT-03:00) Brasilia Summer Time (America/Sao_Paulo)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0300_2.save
    timezonegmt_m0330= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0330',:start_date_active=>'2011-02-17',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0330.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0330.id,:meaning=>'(格林威治标准时间-03：30) 纽芬兰标准时间 (America/St_Johns)',:description=>'(格林威治标准时间-03：30) 纽芬兰标准时间 (America/St_Johns)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0330.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0330.id,:meaning=>'(GMT-03:30) Newfoundland Standard Time (America/St_Johns)',:description=>'(GMT-03:30) Newfoundland Standard Time (America/St_Johns)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0330.save
    timezonegmt_m0400= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0400',:start_date_active=>'2011-02-18',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400.id,:meaning=>'(格林威治标准时间-04：00) 大西洋标准时间 (America/Halifax)',:description=>'(格林威治标准时间-04：00) 大西洋标准时间 (America/Halifax)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400.id,:meaning=>'(GMT-04:00) Atlantic Standard Time (America/Halifax)',:description=>'(GMT-04:00) Atlantic Standard Time (America/Halifax)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400.save
    timezonegmt_m0400_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0400_2',:start_date_active=>'2011-02-19',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0400_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_2.id,:meaning=>'(格林威治标准时间-04：00) 大西洋标准时间 (America/Puerto_Rico)',:description=>'(格林威治标准时间-04：00) 大西洋标准时间 (America/Puerto_Rico)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_2.id,:meaning=>'(GMT-04:00) Atlantic Standard Time (America/Puerto_Rico)',:description=>'(GMT-04:00) Atlantic Standard Time (America/Puerto_Rico)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_2.save
    timezonegmt_m0400_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0400_3',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0400_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_3.id,:meaning=>'(格林威治标准时间-04：00) 智利夏令时 (America/Santiago)',:description=>'(格林威治标准时间-04：00) 智利夏令时 (America/Santiago)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_3.id,:meaning=>'(GMT-04:00) Chile Summer Time (America/Santiago)',:description=>'(GMT-04:00) Chile Summer Time (America/Santiago)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_3.save
    timezonegmt_m0400_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0400_4',:start_date_active=>'2011-02-21',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0400_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_4.id,:meaning=>'(格林威治标准时间-04：00) 大西洋标准时间 (Atlantic/Bermuda)',:description=>'(格林威治标准时间-04：00) 大西洋标准时间 (Atlantic/Bermuda)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0400_4.id,:meaning=>'(GMT-04:00) Atlantic Standard Time (Atlantic/Bermuda)',:description=>'(GMT-04:00) Atlantic Standard Time (Atlantic/Bermuda)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0400_4.save
    timezonegmt_m0430= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0430',:start_date_active=>'2011-02-22',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0430.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0430.id,:meaning=>'(格林威治标准时间-04：30) 委内瑞拉时间 (America/Caracas)',:description=>'(格林威治标准时间-04：30) 委内瑞拉时间 (America/Caracas)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0430.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0430.id,:meaning=>'(GMT-04:30) Venezuela Time (America/Caracas)',:description=>'(GMT-04:30) Venezuela Time (America/Caracas)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0430.save
    timezonegmt_m0500= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0500',:start_date_active=>'2011-02-23',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0500.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500.id,:meaning=>'(格林威治标准时间-05：00) 哥伦比亚时间 (America/Bogota)',:description=>'(格林威治标准时间-05：00) 哥伦比亚时间 (America/Bogota)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500.id,:meaning=>'(GMT-05:00) Colombia Time (America/Bogota)',:description=>'(GMT-05:00) Colombia Time (America/Bogota)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500.save
    timezonegmt_m0500_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0500_2',:start_date_active=>'2011-02-24',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0500_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_2.id,:meaning=>'(格林威治标准时间-05：00) 东部标准时间 (America/Indianapolis)',:description=>'(格林威治标准时间-05：00) 东部标准时间 (America/Indianapolis)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_2.id,:meaning=>'(GMT-05:00) Eastern Standard Time (America/Indianapolis)',:description=>'(GMT-05:00) Eastern Standard Time (America/Indianapolis)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_2.save
    timezonegmt_m0500_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0500_3',:start_date_active=>'2011-02-25',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0500_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_3.id,:meaning=>'(格林威治标准时间-05：00) 秘鲁时间 (America/Lima)',:description=>'(格林威治标准时间-05：00) 秘鲁时间 (America/Lima)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_3.id,:meaning=>'(GMT-05:00) Peru Time (America/Lima)',:description=>'(GMT-05:00) Peru Time (America/Lima)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_3.save
    timezonegmt_m0500_4= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0500_4',:start_date_active=>'2011-02-26',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0500_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_4.id,:meaning=>'(格林威治标准时间-05：00) 东部标准时间 (America/New_York)',:description=>'(格林威治标准时间-05：00) 东部标准时间 (America/New_York)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_4.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_4.id,:meaning=>'(GMT-05:00) Eastern Standard Time (America/New_York)',:description=>'(GMT-05:00) Eastern Standard Time (America/New_York)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_4.save
    timezonegmt_m0500_5= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0500_5',:start_date_active=>'2011-02-27',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0500_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_5.id,:meaning=>'(格林威治标准时间-05：00) 东部标准时间 (America/Panama)',:description=>'(格林威治标准时间-05：00) 东部标准时间 (America/Panama)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_5.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0500_5.id,:meaning=>'(GMT-05:00) Eastern Standard Time (America/Panama)',:description=>'(GMT-05:00) Eastern Standard Time (America/Panama)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0500_5.save
    timezonegmt_m0600= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0600',:start_date_active=>'2011-02-28',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0600.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600.id,:meaning=>'(格林威治标准时间-06：00) 中央标准时间 (America/Chicago)',:description=>'(格林威治标准时间-06：00) 中央标准时间 (America/Chicago)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600.id,:meaning=>'(GMT-06:00) Central Standard Time (America/Chicago)',:description=>'(GMT-06:00) Central Standard Time (America/Chicago)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600.save
    timezonegmt_m0600_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0600_2',:start_date_active=>'2011-03-01',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0600_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600_2.id,:meaning=>'(格林威治标准时间-06：00) 中央标准时间 (America/El_Salvador)',:description=>'(格林威治标准时间-06：00) 中央标准时间 (America/El_Salvador)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600_2.id,:meaning=>'(GMT-06:00) Central Standard Time (America/El_Salvador)',:description=>'(GMT-06:00) Central Standard Time (America/El_Salvador)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600_2.save
    timezonegmt_m0600_3= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0600_3',:start_date_active=>'2011-03-02',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0600_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600_3.id,:meaning=>'(格林威治标准时间-06：00) 中央标准时间 (America/Mexico_City)',:description=>'(格林威治标准时间-06：00) 中央标准时间 (America/Mexico_City)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600_3.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0600_3.id,:meaning=>'(GMT-06:00) Central Standard Time (America/Mexico_City)',:description=>'(GMT-06:00) Central Standard Time (America/Mexico_City)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0600_3.save
    timezonegmt_m0700= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0700',:start_date_active=>'2011-03-03',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0700.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0700.id,:meaning=>'(格林威治标准时间-07：00) Mountain 标准时间 (America/Denver)',:description=>'(格林威治标准时间-07：00) Mountain 标准时间 (America/Denver)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0700.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0700.id,:meaning=>'(GMT-07:00) Mountain Standard Time (America/Denver)',:description=>'(GMT-07:00) Mountain Standard Time (America/Denver)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0700.save
    timezonegmt_m0700_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0700_2',:start_date_active=>'2011-03-04',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0700_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0700_2.id,:meaning=>'(格林威治标准时间-07：00) Mountain 标准时间 (America/Phoenix)',:description=>'(格林威治标准时间-07：00) Mountain 标准时间 (America/Phoenix)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0700_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0700_2.id,:meaning=>'(GMT-07:00) Mountain Standard Time (America/Phoenix)',:description=>'(GMT-07:00) Mountain Standard Time (America/Phoenix)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0700_2.save
    timezonegmt_m0800= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0800',:start_date_active=>'2011-03-05',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0800.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0800.id,:meaning=>'(格林威治标准时间-08：00) 太平洋标准时间 (America/Los_Angeles)',:description=>'(格林威治标准时间-08：00) 太平洋标准时间 (America/Los_Angeles)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0800.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0800.id,:meaning=>'(GMT-08:00) Pacific Standard Time (America/Los_Angeles)',:description=>'(GMT-08:00) Pacific Standard Time (America/Los_Angeles)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0800.save
    timezonegmt_m0800_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0800_2',:start_date_active=>'2011-03-06',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0800_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0800_2.id,:meaning=>'(格林威治标准时间-08：00) 太平洋标准时间 (America/Tijuana)',:description=>'(格林威治标准时间-08：00) 太平洋标准时间 (America/Tijuana)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0800_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0800_2.id,:meaning=>'(GMT-08:00) Pacific Standard Time (America/Tijuana)',:description=>'(GMT-08:00) Pacific Standard Time (America/Tijuana)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0800_2.save
    timezonegmt_m0900= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M0900',:start_date_active=>'2011-03-07',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m0900.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0900.id,:meaning=>'(格林威治标准时间-09：00) 阿拉斯加标准时间 (America/Anchorage)',:description=>'(格林威治标准时间-09：00) 阿拉斯加标准时间 (America/Anchorage)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0900.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m0900.id,:meaning=>'(GMT-09:00) Alaska Standard Time (America/Anchorage)',:description=>'(GMT-09:00) Alaska Standard Time (America/Anchorage)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m0900.save
    timezonegmt_m1000= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M1000',:start_date_active=>'2011-03-08',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m1000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1000.id,:meaning=>'(格林威治标准时间-10：00) 夏威夷标准时间 (Pacific/Honolulu)',:description=>'(格林威治标准时间-10：00) 夏威夷标准时间 (Pacific/Honolulu)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1000.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1000.id,:meaning=>'(GMT-10:00) Hawaii Standard Time (Pacific/Honolulu)',:description=>'(GMT-10:00) Hawaii Standard Time (Pacific/Honolulu)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1000.save
    timezonegmt_m1100= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M1100',:start_date_active=>'2011-03-09',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m1100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1100.id,:meaning=>'(格林威治标准时间-11：00) 纽威岛时间 (Pacific/Niue)',:description=>'(格林威治标准时间-11：00) 纽威岛时间 (Pacific/Niue)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1100.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1100.id,:meaning=>'(GMT-11:00) Niue Time (Pacific/Niue)',:description=>'(GMT-11:00) Niue Time (Pacific/Niue)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1100.save
    timezonegmt_m1100_2= Irm::LookupValue.new(:lookup_type=>'TIMEZONE',:lookup_code=>'GMT_M1100_2',:start_date_active=>'2011-03-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    timezonegmt_m1100_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1100_2.id,:meaning=>'(格林威治标准时间-11：00) 萨摩亚群岛标准时间 (Pacific/Pago_Pago)',:description=>'(格林威治标准时间-11：00) 萨摩亚群岛标准时间 (Pacific/Pago_Pago)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1100_2.lookup_values_tls.build(:lookup_value_id=>timezonegmt_m1100_2.id,:meaning=>'(GMT-11:00) Samoa Standard Time (Pacific/Pago_Pago)',:description=>'(GMT-11:00) Samoa Standard Time (Pacific/Pago_Pago)',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    timezonegmt_m1100_2.save
  end

  def self.down
  end
end
