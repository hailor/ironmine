class AddCloseFlagToIncidentStatus < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_statuses,:close_flag,:string,:limit=>1,:default=>"N",:null=>false,:after=>:default_flag
  end

  def self.down
    remove_column :icm_incident_statuses,:close_flag
  end
end
