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


  end

  def self.down
  end
end
