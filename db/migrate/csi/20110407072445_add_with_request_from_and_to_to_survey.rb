class AddWithRequestFromAndToToSurvey < ActiveRecord::Migration
  def self.up
    add_column :csi_surveys, :with_incident_request_to, :datetime, :after => :same_ip_allow_flag
    add_column :csi_surveys, :with_incident_request_from, :datetime, :after => :same_ip_allow_flag
  end

  def self.down
    remove_column :csi_surveys, :with_incident_request_to
    remove_column :csi_surveys, :with_incident_request_from
  end
end
