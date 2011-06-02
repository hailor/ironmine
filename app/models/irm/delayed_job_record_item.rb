class Irm::DelayedJobRecordItem  < ActiveRecord::Base
  set_table_name :irm_delayed_jobs_record_items
  belongs_to :record,:class_name => "irm_delayed_jobs_records",:foreign_key => "pid"

  scope :query_wrap_info, lambda{|id|
      select(
         "#{table_name}.id,#{table_name}.attempt,#{table_name}.error_info,#{table_name}.record_at"
      ).
      where("#{table_name}.pid = #{id}")
  }
end