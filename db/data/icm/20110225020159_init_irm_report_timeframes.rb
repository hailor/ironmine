class InitIrmReportTimeframes < ActiveRecord::Migration
  def self.up
    rpt_timeframes_0001=Irm::ReportTimeframes.new(:report_code=>'ICM_ALL_URGENCY',
                                              :table_name=>'icm_incident_requests',
                                              :column_code =>"created_at",
                                              :status_code=>'ENABLED',
                                              :not_auto_mult=>true)
    rpt_timeframes_0001.report_timeframes_tls.build(:timeframe_id=>rpt_timeframes_0001.id,
                                            :name=>"Incident Create Date",
                                            :description=>"Incident Create Date",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    rpt_timeframes_0001.report_timeframes_tls.build(:timeframe_id=>rpt_timeframes_0001.id,
                                            :name=>"事故单创建日期",
                                            :description=>"事故单创建日期",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    rpt_timeframes_0001.save
  end

  def self.down
    #删除reporttimeframes
    select_rpt_timeframes = Irm::ReportTimeframes.query_by_report_code("ICM_ALL_URGENCY").
                               query_by_table_name("icm_incident_requests").
                               query_by_column_code("created_at")
    Irm::ReportTimeframesTl.query_by_timeframe_id(select_rpt_timeframes.id).destroy
    select_rpt_timeframes.destroy
  end
end
