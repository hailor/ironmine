class AddRruleToWfTasks < ActiveRecord::Migration
  def self.up
    add_column :irm_wf_tasks, :rrule, :text, :after => :source_id
  end

  def self.down
    remove_column :irm_wf_tasks, :rrule
  end
end
