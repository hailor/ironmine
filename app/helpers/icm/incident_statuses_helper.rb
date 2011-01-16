module Icm::IncidentStatusesHelper
  def available_incident_phase()
    Icm::IncidentPhase.multilingual.enabled.collect{|v| [v[:name],v[:phase_code]]}
  end
end
