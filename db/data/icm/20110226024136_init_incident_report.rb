class InitIncidentReport < ActiveRecord::Migration
  def self.up
    #定义 报表:所有请求-紧急度 的 permission_code
    icm_incident_urgency_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REPORT_URGENCY',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_urgency_summary',:not_auto_mult=>true)
    icm_incident_urgency_index.permissions_tls.build(:language=>'zh',:name=>'所有请求-紧急度',
                                                 :description=>'所有请求-紧急度',:source_lang=>'en')
    icm_incident_urgency_index.permissions_tls.build(:language=>'en',:name=>'ALL_URGENCY',
                                                 :description=>'ALL_URGENCY',:source_lang=>'en')
    icm_incident_urgency_index.save

    #定义 报表:所有请求-来源类型 的 permission_code
    icm_incident_source_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REPORT_SOURCE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_report_source_summary',:not_auto_mult=>true)
    icm_incident_source_index.permissions_tls.build(:language=>'zh',:name=>'所有请求-来源类型',
                                                 :description=>'所有请求-来源类型',:source_lang=>'en')
    icm_incident_source_index.permissions_tls.build(:language=>'en',:name=>'ALL_REPORT_SOURCE',
                                                 :description=>'ALL_REPORT_SOURCE',:source_lang=>'en')
    icm_incident_source_index.save

    #定义 报表:所有请求-请求类型 的 permission_code
    icm_incident_type_index= Irm::Permission.new(:permission_code=>'ICM_INCIDENT_REPORT_TYPE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_report_type_summary',:not_auto_mult=>true)
    icm_incident_type_index.permissions_tls.build(:language=>'zh',:name=>'所有请求-请求类型',
                                                 :description=>'所有请求-请求类型',:source_lang=>'en')
    icm_incident_type_index.permissions_tls.build(:language=>'en',:name=>'ALL_REPORT_TYPE',
                                                 :description=>'ALL_REPORT_TYPE',:source_lang=>'en')
    icm_incident_type_index.save

    #定义 报表:所有请求-影响度 的 permission_code
    icm_incident_impact_range_index= Irm::Permission.new(:permission_code=>'ICM_REPORT_IMPACT_RANGE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_impact_range_summary',:not_auto_mult=>true)
    icm_incident_impact_range_index.permissions_tls.build(:language=>'zh',:name=>'所有请求-影响度',
                                                 :description=>'所有请求-影响度',:source_lang=>'en')
    icm_incident_impact_range_index.permissions_tls.build(:language=>'en',:name=>'ALL_IMPACT_RANGE',
                                                 :description=>'ALL_IMPACT_RANGE',:source_lang=>'en')
    icm_incident_impact_range_index.save

    #定义 报表:所有请求-优先级 的 permission_code
    icm_incident_priority_index= Irm::Permission.new(:permission_code=>'ICM_REPORT_PRIORITY_CODE',
                                                :page_controller=>'icm/incident_reports',
                                                :page_action=>'rpt_priority_code_summary',:not_auto_mult=>true)
    icm_incident_priority_index.permissions_tls.build(:language=>'zh',:name=>'所有请求-优先级',
                                                 :description=>'所有请求-优先级',:source_lang=>'en')
    icm_incident_priority_index.permissions_tls.build(:language=>'en',:name=>'ALL_PRIORITY_CODE',
                                                 :description=>'ALL_PRIORITY_CODE',:source_lang=>'en')
    icm_incident_priority_index.save



    #定义 某时间段所有请求-紧急度 的报表
    rpt_all_urgency_report = Irm::Report.new(:report_code=>"ICM_ALL_URGENCY",
                                             :permission_code=>"ICM_INCIDENT_REPORT_URGENCY",
                                             :category_code =>"INCIDENT")
    rpt_all_urgency_report.reports_tls.build(:language=>'en',:name=>'All Incident - Urgency',
                                             :description=>'All Incident - Urgency',:source_lang=>'en')
    rpt_all_urgency_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-紧急度',
                                             :description=>'某时间段所有请求-紧急度',:source_lang=>'en')
    rpt_all_urgency_report.save

    #定义 某时间段所有请求-来源类型 的报表
    rpt_all_report_source_report = Irm::Report.new(:report_code=>"ICM_ALL_SOURCE_TYPE",
                                             :permission_code=>"ICM_INCIDENT_REPORT_SOURCE",
                                             :category_code =>"INCIDENT")
    rpt_all_report_source_report.reports_tls.build(:language=>'en',:name=>'All Incident - Report Source',
                                             :description=>'All Incident - Report Source',:source_lang=>'en')
    rpt_all_report_source_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-来源类型',
                                             :description=>'某时间段所有请求-来源类型',:source_lang=>'en')
    rpt_all_report_source_report.save

    #定义 某时间段所有请求-请求类型 的报表
    rpt_all_report_type_report = Irm::Report.new(:report_code=>"ICM_ALL_REQUEST_TYPE",
                                             :permission_code=>"ICM_INCIDENT_REPORT_TYPE",
                                             :category_code =>"incident")
    rpt_all_report_type_report.reports_tls.build(:language=>'en',:name=>'All Incident - Report Type',
                                             :description=>'All Incident - Report Type',:source_lang=>'en')
    rpt_all_report_type_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-请求类型',
                                             :description=>'某时间段所有请求-请求类型',:source_lang=>'en')
    rpt_all_report_type_report.save

    #定义 某时间段所有请求-影响度 的报表
    rpt_all_impact_report = Irm::Report.new(:report_code=>"ICM_ALL_IMPACT_RANGE",
                                             :permission_code=>"ICM_REPORT_IMPACT_RANGE",
                                             :category_code =>"incident")
    rpt_all_impact_report.reports_tls.build(:language=>'en',:name=>'All Incident - Impact',
                                             :description=>'All Incident - Impact',:source_lang=>'en')
    rpt_all_impact_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-影响度',
                                             :description=>'某时间段所有请求-影响度',:source_lang=>'en')
    rpt_all_impact_report.save

    #定义 某时间段所有请求-优先级 的报表
    rpt_all_priority_report = Irm::Report.new(:report_code=>"ICM_ALL_PRIORITY_CODE",
                                             :permission_code=>"ICM_REPORT_PRIORITY_CODE",
                                             :category_code =>"incident")
    rpt_all_priority_report.reports_tls.build(:language=>'en',:name=>'All Incident - Priority',
                                             :description=>'All Incident - Priority',:source_lang=>'en')
    rpt_all_priority_report.reports_tls.build(:language=>'zh',:name=>'某时间段所有请求-优先级',
                                             :description=>'某时间段所有请求-优先级',:source_lang=>'en')
    rpt_all_priority_report.save

    #定义报表组
    admin_report_groups = Irm::ReportGroup.new(:group_code=>"ADMIN_REPORT_GROUP")
    admin_report_groups.report_groups_tls.build(:language=>'zh',:name=>'管理员报表组',
                                              :description=>'管理员报表组',:source_lang=>'en')
    admin_report_groups.report_groups_tls.build(:language=>'en',:name=>'Admin Report Group',
                                              :description=>'Admin Report Group',:source_lang=>'en')
    admin_report_groups.save


    #将报表赋值给report group
    report_group_member10 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_ALL_URGENCY",
                                                     :display_sequence=>10)
    report_group_member10.save
    report_group_member20 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_ALL_SOURCE_TYPE",
                                                     :display_sequence=>20)
    report_group_member20.save
    report_group_member30 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_ALL_REQUEST_TYPE",
                                                     :display_sequence=>30)
    report_group_member30.save
    report_group_member40 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_ALL_IMPACT_RANGE",
                                                     :display_sequence=>40)
    report_group_member40.save
    report_group_member50 = Irm::ReportGroupMember.new(:group_code => "ADMIN_REPORT_GROUP",
                                                     :report_code => "ICM_ALL_PRIORITY_CODE",
                                                     :display_sequence=>50)
    report_group_member50.save

  end

  def self.down
  end
end
