class AddPhaseCodeToIrmIncidentStatus < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_statuses,:phase_code,:string,:limit=>30,:after=>:incident_status_code
  end

  def self.down
    remove_column :icm_incident_statuses,:phase_code
  end
end
