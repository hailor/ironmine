class Irm::ReportsTl < ActiveRecord::Base
  set_table_name :irm_reports_tl

  belongs_to :report

  validates_presence_of :name

  scope :query_by_report_id ,lambda{|report_id| where(:report_id=>report_id)}
  scope :query_by_language ,lambda{|language| where(:language=>language)}
end
