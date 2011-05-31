class DelayedJobRecordItem  < ActiveRecord::Base
  set_table_name :delayed_jobs_record_item
  belongs_to :record,:class_name => "delayed_jobs_record",:foreign_key => "pid"
end