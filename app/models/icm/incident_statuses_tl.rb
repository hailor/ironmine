class Icm::IncidentStatusesTl < ActiveRecord::Base
  set_table_name :icm_incident_statuses_tl

  belongs_to :incident_status

  validates_presence_of :name
end
