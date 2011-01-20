module Icm::IncidentJournalsHelper
  def list_journals(incident_request)
    journals = Icm::IncidentJournal.list_all(incident_request.id)
    render :partial=>"icm/incident_journals/list_journals",:locals=>{:journals=>journals}
  end
end
