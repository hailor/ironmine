class Irm::DelayedJobRecord < ActiveRecord::Base
  set_table_name :irm_delayed_jobs_records
  has_many :items,:class_name => "irm_delayed_jobs_record_items"
  query_extend

  scope :query_wrap_info,lambda{
         select("#{table_name}.id,#{table_name}.priority,#{table_name}.handler,#{table_name}.run_by,"+
           "#{table_name}.run_at,#{table_name}.end_at,#{table_name}.status,#{table_name}.delayed_job_id")
  }
end