class AddDisplaySequenceToStatusPhase < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_statuses,:display_sequence,:integer,:after=>:incident_status_code
    add_column :icm_incident_phases,:display_sequence,:integer,:after=>:phase_code
  end

  def self.down
    remove_column :icm_incident_statuses,:display_sequence
    remove_column :icm_incident_phases,:display_sequence
  end
end
