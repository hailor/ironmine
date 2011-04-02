# -*- coding: utf-8 -*-
class ReworkReports < ActiveRecord::Migration
  def self.up
    Irm::Report.delete_all
    Irm::ReportsTl.delete_all
    Irm::ReportGroupMember.delete_all
    #定义 事故单统计报表-按月统计 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"IRM_PERSON_LOGIN_SUMMARY",
                                             :page_controller=>"irm/common_reports",
                                             :page_action=>"rpt_person_login_summary",
                                             :category_code =>"SYSTEM_GLOBAL",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'rpt_person_login_summary Report',
                                             :description=>'rpt_person_login_summary Report',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'人员登录统计-按天计算',
                                             :description=>'人员登录统计-按天计算',:source_lang=>'en')
    rpt_all_priority_report.save


    #定义 某时间段所有请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_ALL_URGENCY",
                                             :page_controller=>"icm/incident_reports",
                                             :page_action=>"rpt_urgency_summary",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'All Incident - Urgency',
                                             :description=>'All Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-紧急度',
                                             :description=>'某时间段所有请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段所有请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_ALL_SOURCE_TYPE",
                                             :page_controller=>"icm/incident_reports",
                                             :page_action=>"rpt_report_source_summary",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'All Incident - Report Source',
                                             :description=>'All Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-来源类型',
                                             :description=>'某时间段所有请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段所有请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_ALL_REQUEST_TYPE",
                                             :page_controller=>"icm/incident_reports",
                                             :page_action=>"rpt_report_type_summary",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'All Incident - Report Type',
                                             :description=>'All Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-请求类型',
                                             :description=>'某时间段所有请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段所有请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_ALL_IMPACT_RANGE",
                                             :page_controller=>"icm/incident_reports",
                                             :page_action=>"rpt_impact_range_summary",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'All Incident - Impact',
                                             :description=>'All Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-影响度',
                                             :description=>'某时间段所有请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段所有请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_ALL_PRIORITY_CODE",
                                             :page_controller=>"icm/incident_reports",
                                             :page_action=>"rpt_priority_code_summary",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'All Incident - Priority',
                                             :description=>'All Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-优先级',
                                             :description=>'某时间段所有请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save



    #定义 某时间段已完成请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_URGENCY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_completed_urgency_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Urgency',
                                             :description=>'Completed Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-紧急度',
                                             :description=>'已完成的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段已完成请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_REPORT_SOURCE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_completed_source_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Report Source',
                                             :description=>'Completed Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-来源类型',
                                             :description=>'已完成的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段已完成请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_REPORT_TYPE",
                                              :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_completed_type_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Report Type',
                                             :description=>'Completed Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-请求类型',
                                             :description=>'已完成的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段已完成请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_IMPACT_RANGE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_completed_impact_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Impact',
                                             :description=>'Completed Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-影响度',
                                             :description=>'已完成的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段已完成请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_COMPLETED_PRIORITY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_completed_priority_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Completed Incident - Priority',
                                             :description=>'Completed Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'已完成的请求-优先级',
                                             :description=>'已完成的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save

    #定义 某时间段未解决请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_URGENCY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unsolved_urgency_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Urgency',
                                             :description=>'Unsolved Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-紧急度',
                                             :description=>'未解决的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段未解决请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_REPORT_SOURCE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unsolved_source_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Source',
                                             :description=>'Unsolved Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-来源类型',
                                             :description=>'未解决的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段未解决请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_REPORT_TYPE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unsolved_type_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Report Type',
                                             :description=>'Unsolved Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-请求类型',
                                             :description=>'未解决的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段未解决请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_IMPACT_RANGE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unsolved_impact_summary',
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Impact',
                                             :description=>'Unsolved Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-影响度',
                                             :description=>'未解决的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段未解决请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_UNSOLVED_PRIORITY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unsolved_priority_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Unsolved Incident - Priority',
                                             :description=>'Unsolved Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'未解决的请求-优先级',
                                             :description=>'未解决的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save

    #定义 某时间段未分配请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_URGENCY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unalloca_urgency_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Urgency',
                                             :description=>'Unallocated Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-紧急度',
                                             :description=>'未分配的请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段未分配请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_REPORT_SOURCE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unalloca_source_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Source',
                                             :description=>'Unallocated Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-来源类型',
                                             :description=>'未分配的请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段未分配请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_REPORT_TYPE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unalloca_type_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Report Type',
                                             :description=>'Unallocated Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-请求类型',
                                             :description=>'未分配的请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段未分配请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_IMPACT_RANGE",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unalloca_impact_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Impact',
                                             :description=>'Unallocated Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-影响度',
                                             :description=>'未分配的请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段未分配请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_UNALLOCATED_PRIORITY",
                                             :page_controller=>'icm/incident_reports',
                                             :page_action=>'rpt_unalloca_priority_summary',
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Unallocated Incident - Priority',
                                             :description=>'Unallocated Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'未分配的请求-优先级',
                                             :description=>'未分配的请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save

  end

  def self.down
  end
end
