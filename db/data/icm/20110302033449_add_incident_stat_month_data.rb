# -*- coding: utf-8 -*-
class AddIncidentStatMonthData < ActiveRecord::Migration
  def self.up
    ##定义 报表:事故单统计报表-按月统计 的 permission_code
    #icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_STAT_MONTH',
    #                                            :page_controller=>'icm/incident_reports',
    #                                            :page_action=>'rpt_incident_stat_month',:not_auto_mult=>true)
    #icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'事故单统计报表-按月统计',
    #                                             :description=>'事故单统计报表-按月统计',:source_lang=>'en')
    #icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Incident Summary Report - Month',
    #                                             :description=>'Incident Summary Report - Month',:source_lang=>'en')
    #icm_incident_urgency_index.save

    #定义 事故单统计报表-按月统计 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_INCIDENT_STAT_MONTH",
                                             :permission_code=>"ICM_INCIDENT_STAT_MONTH",
                                             :category_code =>"INCIDENT_REQUEST",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'Incident Summary Report',
                                             :description=>'Incident Summary Report',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'事故单统计报表-按月统计',
                                             :description=>'事故单统计报表-按月统计',:source_lang=>'en')
    rpt_all_priority_report.save


    #将报表赋值给report group
    report_group_member210 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_INCIDENT_STAT_MONTH",
                                                     :display_sequence=>210)
    report_group_member210.save
  end

  def self.down
  end
end
