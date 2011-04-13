class AddParentIdToWfTask < ActiveRecord::Migration
  def self.up
    add_column :irm_wf_tasks, :parent_id, :integer, :after => :source_id
  end

  def self.down
    remove_column :irm_wf_tasks, :parent_id
  end
end
