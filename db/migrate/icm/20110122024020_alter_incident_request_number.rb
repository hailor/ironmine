class AlterIncidentRequestNumber < ActiveRecord::Migration
  def self.up
    remove_column :icm_incident_requests,:request_number
    add_column :icm_incident_requests,:request_number,:string,:limit=>30,:after=>:company_id

  end

  def self.down
    remove_column :icm_incident_requests,:request_number
    add_column :icm_incident_requests,:request_number,:string,:limit=>30,:null=>false,:after=>:company_id
  end
end
