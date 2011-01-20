class AddPriorityCodeToIncidentRequest < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_requests,:priority_code,:string,:limit=>30,:null=>false,:after=>:urgence_code

  end

  def self.down
    remove_column :icm_incident_requests,:priority_code
  end
end
