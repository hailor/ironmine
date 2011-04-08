class AddWithIncidentRequestToSurvey < ActiveRecord::Migration
  def self.up
    add_column :csi_surveys, :with_incident_request, :string, :limit=>1, :default=>"N", :after => :same_ip_allow_flag
  end

  def self.down
    remove_column :csi_surveys, :with_incident_request
  end
end
