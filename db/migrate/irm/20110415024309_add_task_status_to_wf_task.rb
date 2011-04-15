class AddTaskStatusToWfTask < ActiveRecord::Migration
  def self.up
    add_column :irm_wf_tasks, :task_status, :string, :limit => 30, :after => :source_id
  end

  def self.down
    remove_column :irm_wf_tasks, :task_status
  end
end
