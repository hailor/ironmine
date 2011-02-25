class Irm::ReportsTl < ActiveRecord::Base
  set_table_name :irm_reports_tl

  belongs_to :report

  validates_presence_of :name
end
