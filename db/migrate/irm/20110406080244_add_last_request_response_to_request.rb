class AddLastRequestResponseToRequest < ActiveRecord::Migration
  def self.up
    add_column(:icm_incident_requests,:last_response_date,:datetime,:after=>:submitted_date)
    add_column(:icm_incident_requests,:last_request_date,:datetime,:after=>:submitted_date)
  end

  def self.down
    remove_column(:icm_incident_requests,:last_response_date)
    remove_column(:icm_incident_requests,:last_request_date)
  end
end
