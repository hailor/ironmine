class Irm::DelayedJobRecord < ActiveRecord::Base
  set_table_name :irm_delayed_jobs_records
  has_many :items,:class_name => "irm_delayed_jobs_record_items"
end