class DelayedJobRecord < ActiveRecord::Base
  set_table_name :delayed_jobs_record
  has_many :items,:class_name => "delayed_jobs_record_item"
end