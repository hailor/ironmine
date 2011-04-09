class AddIncidentAssignColumn < ActiveRecord::Migration
  def self.up
    add_column(:irm_people,:last_assigned_date,:datetime,:after=>:open_tasks,:null=>true)
    add_column(:irm_companies,:support_manager,:int,:after=>:home_page,:null=>true)
  end

  def self.down
    remove_column(:irm_people,:last_assigned_date)
    remove_column(:irm_companies,:support_manager)
  end
end
