# -*- coding: utf-8 -*-
class InitPersonLoginTimeframesData < ActiveRecord::Migration
  def self.up
    rpt_timeframes_0001=Irm::ReportTimeframes.new(:report_code=>'IRM_PERSON_LOGIN_SUMMARY',
                                              :table_name=>'irm_login_records',
                                              :column_code =>"created_at",
                                              :status_code=>'ENABLED',
                                              :not_auto_mult=>true)
    rpt_timeframes_0001.report_timeframes_tls.build(:timeframe_id=>rpt_timeframes_0001.id,
                                            :name=>"Person Login Date",
                                            :description=>"Person Login Date",
                                            :language=>"en",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")
    rpt_timeframes_0001.report_timeframes_tls.build(:timeframe_id=>rpt_timeframes_0001.id,
                                            :name=>"人员登录日期",
                                            :description=>"人员登录日期",
                                            :language=>"zh",
                                            :status_code=>'ENABLED',
                                            :source_lang=>"en")

    rpt_timeframes_0001.save
  end

  def self.down
    #删除reporttimeframes
    select_rpt_timeframes = Irm::ReportTimeframes.query_by_report_code("IRM_PERSON_LOGIN_SUMMARY").
                               query_by_table_name("irm_login_records").
                               query_by_column_code("created_at")
    Irm::ReportTimeframesTl.query_by_timeframe_id(select_rpt_timeframes.id).destroy
    select_rpt_timeframes.destroy
  end
end
