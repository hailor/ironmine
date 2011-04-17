class ChangePriorityToStringInWfTask < ActiveRecord::Migration
  def self.up
    change_column(:irm_wf_tasks, :priority, :string, :limit => 30)
  end

  def self.down
    change_column(:irm_wf_tasks, :priority, :integer)
  end
end
