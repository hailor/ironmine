class Irm::ReportGroupsTl < ActiveRecord::Base
  set_table_name :irm_report_groups_tl

  belongs_to :report_group

  validates_presence_of :name
end
