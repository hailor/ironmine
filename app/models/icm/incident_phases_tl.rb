class Icm::IncidentPhasesTl < ActiveRecord::Base
  set_table_name :icm_incident_phases_tl

  belongs_to :incident_phase

  validates_presence_of :name
end
