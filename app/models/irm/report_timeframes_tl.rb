class Irm::ReportTimeframesTl < ActiveRecord::Base
  set_table_name :irm_report_timeframes_tl

  belongs_to :report_timeframes

  validates_presence_of :name

  scope :query_by_timeframe_id,lambda{|timeframe_id| where(:timeframe_id=>timeframe_id)}
end