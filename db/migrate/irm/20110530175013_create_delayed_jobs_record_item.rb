class CreateDelayedJobsRecordItem < ActiveRecord::Migration
  def self.up
      create_table :irm_delayed_jobs_record_items, :force => true do |table|
        table.text     :error_info                    # 错误信息记录
        table.integer  :attempt                       # 第几次尝试
        table.datetime :record_at                     # 记录错误的时间
        table.integer   :pid                           # 外键
        table.timestamps
      end
  end

  def self.down
      drop_table :delayed_jobs_record_item
  end
end