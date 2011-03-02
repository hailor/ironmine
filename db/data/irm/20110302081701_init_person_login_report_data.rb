# -*- coding: utf-8 -*-
class InitPersonLoginReportData < ActiveRecord::Migration
  def self.up
    #定义 报表:事故单统计报表-按月统计 的 permission_code
    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'IRM_PERSON_LOGIN_SUMMARY',
                                                :page_controller=>'irm/common_reports',
                                                :page_action=>'rpt_person_login_summary',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'人员登录统计-按天计算',
                                                 :description=>'人员登录统计-按天计算',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Person Login Summary - Day',
                                                 :description=>'Person Login Summary - Day',:source_lang=>'en')
    icm_incident_urgency_index.save

    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'IRM_PERSON_LOGIN_INDEX',
                                                :page_controller=>'irm/common_reports',
                                                :page_action=>'index',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'首页',
                                                 :description=>'首页',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Index',
                                                 :description=>'Index',:source_lang=>'en')
    icm_incident_urgency_index.save

    #定义 事故单统计报表-按月统计 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"IRM_PERSON_LOGIN_SUMMARY",
                                             :permission_code=>"IRM_PERSON_LOGIN_SUMMARY",
                                             :category_code =>"SYSTEM_GLOBAL",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'rpt_person_login_summary Report',
                                             :description=>'rpt_person_login_summary Report',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'人员登录统计-按天计算',
                                             :description=>'人员登录统计-按天计算',:source_lang=>'en')
    rpt_all_priority_report.save


    #将报表赋值给report group
    report_group_member210 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "IRM_PERSON_LOGIN_SUMMARY",
                                                     :display_sequence=>220)
    report_group_member210.save

    #将所有的事故单模块的报表都挂在报表的菜单下
    report_menu_list_88= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_LISTS_MENU',:sub_menu_code=>nil,
                                            :permission_code=>'IRM_PERSON_LOGIN_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    report_menu_list_88.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统报表',:description=>'系统报表')
    report_menu_list_88.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'SystemReport',:description=>'SystemReport')
    report_menu_list_88.save
  end

  def self.down
  end
end
