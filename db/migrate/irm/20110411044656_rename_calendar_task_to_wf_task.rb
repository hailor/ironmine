class RenameCalendarTaskToWfTask < ActiveRecord::Migration
  def self.up
    rename_table :irm_calendar_tasks, :irm_wf_tasks
  end

  def self.down
    rename_table :irm_wf_tasks, :irm_calendar_tasks
  end
end
