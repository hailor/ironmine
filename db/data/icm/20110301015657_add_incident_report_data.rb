# -*- coding: utf-8 -*-
class AddIncidentReportData < ActiveRecord::Migration
  def self.up
    #定义 报表:已完成请求-紧急度 的 permission_code
    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'ICM_COMPLETED_URGENCY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_completed_urgency_summary',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'已完成的请求-紧急度',
                                                 :description=>'已完成的请求-紧急度',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Completed Incident - Urgency',
                                                 :description=>'Completed Incident - Urgency',:source_lang=>'en')
    icm_incident_urgency_index.save

    #定义 报表:已完成请求-来源类型 的 permission_code
    icm_incident_source_index= Irm::Permission.new(:permission_code=>'ICM_COMPLETED_REPORT_SOURCE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_completed_source_summary',:not_auto_mult=>true)
    icm_incident_source_index.permissions_tls.build(:language=>'zh',:name=>'已完成的请求-来源类型',
                                                 :description=>'已完成的请求-来源类型',:source_lang=>'en')
    icm_incident_source_index.permissions_tls.build(:language=>'en',:name=>'Completed Incident - Report Source',
                                                 :description=>'Completed Incident - Report Source',:source_lang=>'en')
    icm_incident_source_index.save

    #定义 报表:已完成请求-请求类型 的 permission_code
    icm_incident_type_index= Irm::Permission.new(:permission_code=>'ICM_COMPLETED_REPORT_TYPE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_completed_type_summary',:not_auto_mult=>true)
    icm_incident_type_index.permissions_tls.build(:language=>'zh',:name=>'已完成的请求-请求类型',
                                                 :description=>'已完成的请求-请求类型',:source_lang=>'en')
    icm_incident_type_index.permissions_tls.build(:language=>'en',:name=>'Completed Incident - Report Type',
                                                 :description=>'Completed Incident - Report Type',:source_lang=>'en')
    icm_incident_type_index.save

    #定义 报表:已完成请求-影响度 的 permission_code
    icm_incident_impact_range_index= Irm::Permission.new(:permission_code=>'ICM_COMPLETED_IMPACT_RANGE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_completed_impact_summary',:not_auto_mult=>true)
    icm_incident_impact_range_index.permissions_tls.build(:language=>'zh',:name=>'已完成的请求-影响度',
                                                 :description=>'已完成的请求-影响度',:source_lang=>'en')
    icm_incident_impact_range_index.permissions_tls.build(:language=>'en',:name=>'Completed Incident - Impact Range',
                                                 :description=>'Completed Incident - Impact Range',:source_lang=>'en')
    icm_incident_impact_range_index.save

    #定义 报表:已完成请求-优先级 的 permission_code
    icm_incident_priority_index= Irm::Permission.new(:permission_code=>'ICM_COMPLETED_PRIORITY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_completed_priority_summary',:not_auto_mult=>true)
    icm_incident_priority_index.permissions_tls.build(:language=>'zh',:name=>'已完成的请求-优先级',
                                                 :description=>'已完成的请求-优先级',:source_lang=>'en')
    icm_incident_priority_index.permissions_tls.build(:language=>'en',:name=>'Completed Incident - Priority',
                                                 :description=>'Completed Incident - Priority',:source_lang=>'en')
    icm_incident_priority_index.save



    #定义 某时间段已完成请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_URGENCY",
                                             :permission_code=>"ICM_COMPLETED_URGENCY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Urgency',
                                             :description=>'Completed Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-紧急度',
                                             :description=>'已完成的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段已完成请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_REPORT_SOURCE",
                                             :permission_code=>"ICM_COMPLETED_REPORT_SOURCE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Report Source',
                                             :description=>'Completed Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-来源类型',
                                             :description=>'已完成的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段已完成请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_REPORT_TYPE",
                                             :permission_code=>"ICM_COMPLETED_REPORT_TYPE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Report Type',
                                             :description=>'Completed Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-请求类型',
                                             :description=>'已完成的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段已完成请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_IMPACT_RANGE",
                                             :permission_code=>"ICM_COMPLETED_IMPACT_RANGE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Impact',
                                             :description=>'Completed Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-影响度',
                                             :description=>'已完成的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段已完成请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_PRIORITY",
                                             :permission_code=>"ICM_COMPLETED_PRIORITY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Priority',
                                             :description=>'Completed Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-优先级',
                                             :description=>'已完成的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save

    #将报表赋值给report group
    report_group_member60 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_COMPLETED_URGENCY",
                                                     :display_sequence=>60)
    report_group_member60.save
    report_group_member70 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_COMPLETED_REPORT_SOURCE",
                                                     :display_sequence=>70)
    report_group_member70.save
    report_group_member80 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_COMPLETED_REPORT_TYPE",
                                                     :display_sequence=>80)
    report_group_member80.save
    report_group_member90 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_COMPLETED_IMPACT_RANGE",
                                                     :display_sequence=>90)
    report_group_member90.save
    report_group_member100 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_COMPLETED_PRIORITY",
                                                     :display_sequence=>100)
    report_group_member100.save


    #定义 报表:未解决请求-紧急度 的 permission_code
    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'ICM_UNSOLVED_URGENCY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unsolved_urgency_summary',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'未解决的请求-紧急度',
                                                 :description=>'未解决的请求-紧急度',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Unsolved Incident - Urgency',
                                                 :description=>'Unsolved Incident - Urgency',:source_lang=>'en')
    icm_incident_urgency_index.save

    #定义 报表:未解决请求-来源类型 的 permission_code
    icm_incident_source_index= Irm::Permission.new(:permission_code=>'ICM_UNSOLVED_REPORT_SOURCE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unsolved_source_summary',:not_auto_mult=>true)
    icm_incident_source_index.permissions_tls.build(:language=>'zh',:name=>'未解决的请求-来源类型',
                                                 :description=>'未解决的请求-来源类型',:source_lang=>'en')
    icm_incident_source_index.permissions_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Source',
                                                 :description=>'Unsolved Incident - Report Source',:source_lang=>'en')
    icm_incident_source_index.save

    #定义 报表:未解决请求-请求类型 的 permission_code
    icm_incident_type_index= Irm::Permission.new(:permission_code=>'ICM_UNSOLVED_REPORT_TYPE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unsolved_type_summary',:not_auto_mult=>true)
    icm_incident_type_index.permissions_tls.build(:language=>'zh',:name=>'未解决的请求-请求类型',
                                                 :description=>'未解决的请求-请求类型',:source_lang=>'en')
    icm_incident_type_index.permissions_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Type',
                                                 :description=>'Unsolved Incident - Report Type',:source_lang=>'en')
    icm_incident_type_index.save

    #定义 报表:未解决请求-影响度 的 permission_code
    icm_incident_impact_range_index= Irm::Permission.new(:permission_code=>'ICM_UNSOLVED_IMPACT_RANGE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unsolved_impact_summary',:not_auto_mult=>true)
    icm_incident_impact_range_index.permissions_tls.build(:language=>'zh',:name=>'未解决的请求-影响度',
                                                 :description=>'未解决的请求-影响度',:source_lang=>'en')
    icm_incident_impact_range_index.permissions_tls.build(:language=>'en',:name=>'Unsolved Incident - Impact Range',
                                                 :description=>'Unsolved Incident - Impact Range',:source_lang=>'en')
    icm_incident_impact_range_index.save

    #定义 报表:未解决请求-优先级 的 permission_code
    icm_incident_priority_index= Irm::Permission.new(:permission_code=>'ICM_UNSOLVED_PRIORITY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unsolved_priority_summary',:not_auto_mult=>true)
    icm_incident_priority_index.permissions_tls.build(:language=>'zh',:name=>'未解决的请求-优先级',
                                                 :description=>'未解决的请求-优先级',:source_lang=>'en')
    icm_incident_priority_index.permissions_tls.build(:language=>'en',:name=>'Unsolved Incident - Priority',
                                                 :description=>'Unsolved Incident - Priority',:source_lang=>'en')
    icm_incident_priority_index.save
    

    #定义 某时间段未解决请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_URGENCY",
                                             :permission_code=>"ICM_UNSOLVED_URGENCY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Urgency',
                                             :description=>'Unsolved Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-紧急度',
                                             :description=>'未解决的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段未解决请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_REPORT_SOURCE",
                                             :permission_code=>"ICM_UNSOLVED_REPORT_SOURCE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Source',
                                             :description=>'Unsolved Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-来源类型',
                                             :description=>'未解决的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段未解决请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_REPORT_TYPE",
                                             :permission_code=>"ICM_UNSOLVED_REPORT_TYPE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Type',
                                             :description=>'Unsolved Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-请求类型',
                                             :description=>'未解决的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段未解决请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_IMPACT_RANGE",
                                             :permission_code=>"ICM_UNSOLVED_IMPACT_RANGE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Impact',
                                             :description=>'Unsolved Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-影响度',
                                             :description=>'未解决的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段未解决请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_PRIORITY",
                                             :permission_code=>"ICM_UNSOLVED_PRIORITY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Priority',
                                             :description=>'Unsolved Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-优先级',
                                             :description=>'未解决的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save


    #将报表赋值给report group
    report_group_member110 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNSOLVED_URGENCY",
                                                     :display_sequence=>110)
    report_group_member110.save
    report_group_member120 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNSOLVED_REPORT_SOURCE",
                                                     :display_sequence=>120)
    report_group_member120.save
    report_group_member130 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNSOLVED_REPORT_TYPE",
                                                     :display_sequence=>130)
    report_group_member130.save
    report_group_member140 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNSOLVED_IMPACT_RANGE",
                                                     :display_sequence=>140)
    report_group_member140.save
    report_group_member150 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNSOLVED_PRIORITY",
                                                     :display_sequence=>150)
    report_group_member150.save


    #定义 报表:未分配请求-紧急度 的 permission_code
    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'ICM_UNALLOCATED_URGENCY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unalloca_urgency_summary',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'未分配的请求-紧急度',
                                                 :description=>'未分配的请求-紧急度',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Unallocated Incident - Urgency',
                                                 :description=>'Unallocated Incident - Urgency',:source_lang=>'en')
    icm_incident_urgency_index.save

    #定义 报表:未分配请求-来源类型 的 permission_code
    icm_incident_source_index= Irm::Permission.new(:permission_code=>'ICM_UNALLOCATED_REPORT_SOURCE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unalloca_source_summary',:not_auto_mult=>true)
    icm_incident_source_index.permissions_tls.build(:language=>'zh',:name=>'未分配的请求-来源类型',
                                                 :description=>'未分配的请求-来源类型',:source_lang=>'en')
    icm_incident_source_index.permissions_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Source',
                                                 :description=>'Unallocated Incident - Report Source',:source_lang=>'en')
    icm_incident_source_index.save

    #定义 报表:未分配请求-请求类型 的 permission_code
    icm_incident_type_index= Irm::Permission.new(:permission_code=>'ICM_UNALLOCATED_REPORT_TYPE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unalloca_type_summary',:not_auto_mult=>true)
    icm_incident_type_index.permissions_tls.build(:language=>'zh',:name=>'未分配的请求-请求类型',
                                                 :description=>'未分配的请求-请求类型',:source_lang=>'en')
    icm_incident_type_index.permissions_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Type',
                                                 :description=>'Unallocated Incident - Report Type',:source_lang=>'en')
    icm_incident_type_index.save

    #定义 报表:未分配请求-影响度 的 permission_code
    icm_incident_impact_range_index= Irm::Permission.new(:permission_code=>'ICM_UNALLOCATED_IMPACT_RANGE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unalloca_impact_summary',:not_auto_mult=>true)
    icm_incident_impact_range_index.permissions_tls.build(:language=>'zh',:name=>'未分配的请求-影响度',
                                                 :description=>'未分配的请求-影响度',:source_lang=>'en')
    icm_incident_impact_range_index.permissions_tls.build(:language=>'en',:name=>'Unallocated Incident - Impact Range',
                                                 :description=>'Unallocated Incident - Impact Range',:source_lang=>'en')
    icm_incident_impact_range_index.save

    #定义 报表:未分配请求-优先级 的 permission_code
    icm_incident_priority_index= Irm::Permission.new(:permission_code=>'ICM_UNALLOCATED_PRIORITY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_unalloca_priority_summary',:not_auto_mult=>true)
    icm_incident_priority_index.permissions_tls.build(:language=>'zh',:name=>'未分配的请求-优先级',
                                                 :description=>'未分配的请求-优先级',:source_lang=>'en')
    icm_incident_priority_index.permissions_tls.build(:language=>'en',:name=>'Unallocated Incident - Priority',
                                                 :description=>'Unallocated Incident - Priority',:source_lang=>'en')
    icm_incident_priority_index.save



    #定义 某时间段未分配请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_URGENCY",
                                             :permission_code=>"ICM_UNALLOCATED_URGENCY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Urgency',
                                             :description=>'Unallocated Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-紧急度',
                                             :description=>'未分配的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段未分配请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_REPORT_SOURCE",
                                             :permission_code=>"ICM_UNALLOCATED_REPORT_SOURCE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Source',
                                             :description=>'Unallocated Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-来源类型',
                                             :description=>'未分配的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段未分配请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_REPORT_TYPE",
                                             :permission_code=>"ICM_UNALLOCATED_REPORT_TYPE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Type',
                                             :description=>'Unallocated Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-请求类型',
                                             :description=>'未分配的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段未分配请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_IMPACT_RANGE",
                                             :permission_code=>"ICM_UNALLOCATED_IMPACT_RANGE",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Impact',
                                             :description=>'Unallocated Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-影响度',
                                             :description=>'未分配的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段未分配请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_PRIORITY",
                                             :permission_code=>"ICM_UNALLOCATED_PRIORITY",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Priority',
                                             :description=>'Unallocated Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-优先级',
                                             :description=>'未分配的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save


    #将报表赋值给report group
    report_group_member160 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNALLOCATED_URGENCY",
                                                     :display_sequence=>160)
    report_group_member160.save
    report_group_member170 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNALLOCATED_REPORT_SOURCE",
                                                     :display_sequence=>170)
    report_group_member170.save
    report_group_member180 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNALLOCATED_REPORT_TYPE",
                                                     :display_sequence=>180)
    report_group_member180.save
    report_group_member190 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNALLOCATED_IMPACT_RANGE",
                                                     :display_sequence=>190)
    report_group_member190.save
    report_group_member200 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_UNALLOCATED_PRIORITY",
                                                     :display_sequence=>200)
    report_group_member200.save
  end

  def self.down
  end
end
