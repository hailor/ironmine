class Irm::DelayedJobRecordItem  < ActiveRecord::Base
  set_table_name :irm_delayed_jobs_record_items
  belongs_to :record,:class_name => "irm_delayed_jobs_records",:foreign_key => "pid"
end