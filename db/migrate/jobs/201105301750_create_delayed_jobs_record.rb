class CreateDelayedJobsRecord < ActiveRecord::Migration
  def self.up
    create_table :delayed_jobs_record, :force => true do |table|
      table.integer  :priority, :default => 0      # 记录delayed_jobs表里面记录的优先级
      table.text     :handler                       # 保存对象的yaml格式数据
      table.text     :run_by                        # 执行者
      table.datetime :run_at                        # 执行时间
      table.datetime :end_at                        # 结束时间
      table.integer   :status                        # 状态
      table.integer   :delayed_job_id
      table.timestamps
    end


  end

  def self.down
    drop_table :delayed_jobs_record
  end
end