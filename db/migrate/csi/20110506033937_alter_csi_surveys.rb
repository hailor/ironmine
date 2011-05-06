class AlterCsiSurveys < ActiveRecord::Migration
  def self.up
    remove_column :csi_surveys,:with_incident_request_from
    remove_column :csi_surveys,:with_incident_request_to
    add_column :csi_surveys,:due_dates,:integer,:after=>:with_incident_request
  end

  def self.down
    add_column :csi_surveys,:with_incident_request_from,:datetime
    add_column :csi_surveys,:with_incident_request_to,:datetime
    remove_column :csi_surveys,:due_dates
  end
end
