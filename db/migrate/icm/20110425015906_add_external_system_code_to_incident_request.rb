class AddExternalSystemCodeToIncidentRequest < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_requests, :external_system_code, :string, :limit => 30
  end

  def self.down
    remove_column :icm_incident_requests, :external_system_code
  end
end
