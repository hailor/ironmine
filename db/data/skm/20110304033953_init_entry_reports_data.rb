# -*- coding: utf-8 -*-
class InitEntryReportsData < ActiveRecord::Migration
  def self.up
    ##定义 报表:事故单统计报表-按月统计 的 permission_code
    #icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_SUBMIT_SUMMARY',
    #                                            :page_controller=>'skm/entry_reports',
    #                                            :page_action=>'rpt_entry_submit_summary',:not_auto_mult=>true)
    #icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'知识库文档统计-按天统计',
    #                                             :description=>'知识库文档统计-按天统计',:source_lang=>'en')
    #icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Entry Submit Summary - Day',
    #                                             :description=>'Entry Submit Summary - Day',:source_lang=>'en')
    #icm_incident_urgency_index.save
    #
    #icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'SKM_ENTRY_SUBMIT_INDEX',
    #                                            :page_controller=>'skm/entry_reports',
    #                                            :page_action=>'index',:not_auto_mult=>true)
    #icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'首页',
    #                                             :description=>'首页',:source_lang=>'en')
    #icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'Index',
    #                                             :description=>'Index',:source_lang=>'en')
    #icm_incident_urgency_index.save

    #定义 事故单统计报表-按月统计 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"SKM_ENTRY_SUBMIT_SUMMARY",
                                             :permission_code=>"SKM_ENTRY_SUBMIT_SUMMARY",
                                             :category_code =>"SERVICE_KNOWLEDGE_MANAGE",
                                             :not_auto_mult=>true)
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'rpt_entry_submit_summary Report',
                                             :description=>'rpt_entry_submit_summary Report',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'知识库文档统计-按天统计',
                                             :description=>'知识库文档统计-按天统计',:source_lang=>'en')
    rpt_all_priority_report.save


    #将报表赋值给report group
    report_group_member210 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "SKM_ENTRY_SUBMIT_SUMMARY",
                                                     :display_sequence=>230)
    report_group_member210.save

    ##将所有的事故单模块的报表都挂在报表的菜单下
    #report_menu_list_88= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_LISTS_MENU',:sub_menu_code=>nil,
    #                                        :permission_code=>'SKM_ENTRY_SUBMIT_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    #report_menu_list_88.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库报表',:description=>'知识库报表')
    #report_menu_list_88.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'ServiceKnowledgeReport',:description=>'ServiceKnowledgeReport')
    #report_menu_list_88.save
  end

  def self.down
  end
end
