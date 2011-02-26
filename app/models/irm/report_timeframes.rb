class Irm::ReportTimeframes < ActiveRecord::Base
  set_table_name :irm_report_timeframes

  #多语言关系
  attr_accessor :name,:description
  has_many :report_timeframes_tls,:dependent => :destroy,:foreign_key=>"timeframe_id"
  acts_as_multilingual

  scope :query_by_report_code,lambda{|report_code|where(:report_code =>report_code)}
  scope :query_by_table_name,lambda{|table_name|where(:table_name =>table_name)}
  scope :query_by_column_code,lambda{|column_code|where(:column_code=>column_code)}


  scope :query_by_timeframes,select("concat(#{table_name}.table_name,'.',#{table_name}.column_code) table_column,"+
                                    "#{Irm::ReportTimeframesTl.table_name}.name column_name")

  def wrap_table_column
    self[:table_column]
  end

  def wrap_column_name
    self[:column_name]
  end

end