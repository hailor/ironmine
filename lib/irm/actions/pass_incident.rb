# on pass incident request recalculate person open_tasks
class Irm::Actions::PassIncident
  def perform(event,script)
    return unless "INCIDENT_REQUEST_PASS".eql?(event.event_code)
    params = event.params.dup
    params.symbolize_keys!
    journal = Icm::IncidentJournal.find(params[:journal][:id])
    pass_history = journal.incident_histories.where(:property_key=>"support_person_id").first
    return unless pass_history
    calculate_tasks_to(pass_history.new_value,journal.created_at) if pass_history.new_value
    calculate_tasks_from(pass_history.old_value,journal.created_at) if pass_history.old_value
  end

  def calculate_tasks_to(person_id,created_date)
    open_tasks = Icm::IncidentRequest.query_by_support_person(person_id).
                                      with_incident_status(I18n.locale).
                                      where("incident_status.close_flag = ?",Irm::Constant::SYS_NO).count
    person = Irm::Person.find(person_id)
    person.update_attributes({:open_tasks=>open_tasks,:last_assigned_date=>created_date})
  end

  def calculate_tasks_from(person_id,created_date)
    open_tasks = Icm::IncidentRequest.query_by_support_person(person_id).
                                      with_incident_status(I18n.locale).
                                      where("incident_status.close_flag = ?",Irm::Constant::SYS_NO).count
    person = Irm::Person.find(person_id)
    person.update_attributes({:open_tasks=>open_tasks})
  end
end