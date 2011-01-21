class AddSnWeightValueToIcmRequest < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_requests,:request_number,:string,:limit=>30,:null=>false,:after=>:company_id
    add_column :icm_incident_requests,:weight_value,:integer,:null=>false,:after=>:urgence_code

  end

  def self.down
    remove_column :icm_incident_requests,:request_number
    remove_column :icm_incident_requests,:weight_value
  end
end
