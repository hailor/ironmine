class AddDisplaySequenceDefaultFlagToIcms < ActiveRecord::Migration
  def self.up
    add_column :icm_incident_statuses,:default_flag,:string,:limit=>1,:default=>'N',:after=>:display_sequence
    add_column :icm_impact_ranges,:display_sequence,:integer,:default=>10,:after=>:impact_code
    add_column :icm_impact_ranges,:default_flag,:string,:limit=>1,:default=>"N",:after=>:display_sequence
    add_column :icm_urgence_codes,:display_sequence,:integer,:default=>10,:after=>:urgency_code
    add_column :icm_urgence_codes,:default_flag,:string,:limit=>1,:default=>"N",:after=>:urgency_code

  end

  def self.down
    remove_column :icm_incident_statuses,:default_flag
    remove_column :icm_impact_ranges,:display_sequence
    remove_column :icm_impact_ranges,:default_flag
    remove_column :icm_urgence_codes,:display_sequence
    remove_column :icm_urgence_codes,:default_flag

  end
end
