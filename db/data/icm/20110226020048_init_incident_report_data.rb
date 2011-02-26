# -*- coding: utf-8 -*-
class InitIncidentReportData < ActiveRecord::Migration
  def self.up

    #初始化事故模块所有报表的permission
    icm_incident_report_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REPORTS_INDEX',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'index',:not_auto_mult=>true)
    icm_incident_report_index.permissions_tls.build(:language=>'zh',:name=>'首页',
                                                 :description=>'首页',:source_lang=>'en')
    icm_incident_report_index.permissions_tls.build(:language=>'en',:name=>'Index',
                                                 :description=>'Index',:source_lang=>'en')
    icm_incident_report_index.save

    #将所有的事故单模块的报表都挂在报表的菜单下
    report_menu_list_87= Irm::MenuEntry.new(:menu_code=>'IRM_REPORT_LISTS_MENU',:sub_menu_code=>nil,
                                            :permission_code=>'ICM_INCIDENT_REPORTS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    report_menu_list_87.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单报表',:description=>'事故单报表')
    report_menu_list_87.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'IncidentReport',:description=>'IncidentReport')
    report_menu_list_87.save


  end

  def self.down
  end
end
