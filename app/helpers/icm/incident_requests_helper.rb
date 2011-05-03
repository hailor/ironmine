module Icm::IncidentRequestsHelper
  def available_service(external_system_code=nil)
    services = []
    if external_system_code && !external_system_code.blank?
      services_scope = Slm::ServiceCatalog.multilingual.enabled.where("external_system_code = ?", params[:external_system_code])
      services = services_scope.collect{|i| [i[:name], i.catalog_code]}
    end
    services
  end

  def available_person
    people = Irm::Person.real.query_by_support_staff_flag(Irm::Constant::SYS_NO).order_id.all.collect{|p|[p.name,p[:id]]}
    needed_to_replace = people.detect{|person| Irm::Person.current.id.eql?(person[1])}
    if needed_to_replace
      people.delete_if{|person| Irm::Person.current.id.eql?(person[1])}
      people.unshift([Irm::Person.current.name,Irm::Person.current.id])
    end
    people
  end

  def available_contact
    people = Irm::Person.query_by_support_staff_flag(Irm::Constant::SYS_NO).order_id.all.collect{|p|[p.name,p[:id],{:phone=>p.bussiness_phone}]}
    needed_to_replace = people.detect{|person| Irm::Person.current.id.eql?(person[1])}
    if needed_to_replace
      people.delete_if{|person| Irm::Person.current.id.eql?(person[1])}
      people.unshift([Irm::Person.current.name,Irm::Person.current.id,{:phone=>Irm::Person.current.mobile_phone}])
    end
    people
  end

  def available_supporter(group_id=nil)
    if(group_id)
      people =  Irm::SupportGroupMember.with_person.with_support_group(I18n.locale).query_by_support_group(group_id).order_id.collect{|p|[p[:person_name],p[:person_id]]}
    else
      people =  Irm::SupportGroupMember.with_person.with_support_group(I18n.locale).order_id.collect{|p|[p[:person_name],p[:person_id]]}
    end
    needed_to_replace = people.detect{|person| Irm::Person.current.id.eql?(person[1])}
    if needed_to_replace
      people.delete_if{|person| Irm::Person.current.id.eql?(person[1])}
      people.unshift([Irm::Person.current.name,Irm::Person.current.id])
    end
    people
  end

  def available_support_group
    Irm::SupportGroup.multilingual.collect{|s| [s[:name],s.id]}
  end

  def available_urgence_code
    Icm::UrgenceCode.multilingual.order_display.collect{|p|[p[:name],p[:urgency_code]]}
  end

  def available_impact_range
    Icm::ImpactRange.multilingual.order_display.collect{|p|[p[:name],p[:impact_code]]}
  end

  def available_priority_code
    Icm::PriorityCode.multilingual.order(" low_weight_value").collect{|p|[p[:name],p[:priority_code]]}
  end

  def available_request_type
    Irm::LookupValue.query_by_lookup_type("ICM_REQUEST_TYPE_CODE").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def available_request_status_code
    Icm::IncidentStatus.multilingual.query_by_close_flag(Irm::Constant::SYS_NO).order_display.collect{|i|[i[:name],i[:incident_status_code]]}
  end

  def available_all_request_status_code
    Icm::IncidentStatus.multilingual.order_display.collect{|i|[i[:name],i[:incident_status_code]]}
  end

  def available_request_report_source
    Irm::LookupValue.query_by_lookup_type("ICM_REQUEST_REPORT_SOURCE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def wait_for_me_request_count
    Icm::IncidentRequest.query_by_support_person(Irm::Person.current.id).size()
  end

  def reply_today_count
    Icm::IncidentJournal.where("replied_by = ?", Irm::Person.current.id).where("date_format(created_at,'%Y%m%d') = ?", Time.now.strftime('%Y%m%d')).group_by{|t| t.incident_request_id}.size()
  end

  def request_submitted_today_count
    Icm::IncidentRequest.where("date_format(submitted_date,'%Y%m%d')  = ?", Time.now.strftime('%Y%m%d')).where("submitted_by = ?", Irm::Person.current.id).size()
  end

  def my_un_solved_request
    Icm::IncidentRequest.where("incident_status_code <> ? AND incident_status_code <> ?", "SOLVE_RECOVER", "CLOSE_INCIDENT").where("submitted_by = ?", Irm::Person.current.id).size()
  end

  def my_solved_request
    Icm::IncidentRequest.where("incident_status_code = ? OR incident_status_code = ?", "SOLVE_RECOVER", "CLOSE_INCIDENT").where("submitted_by = ?", Irm::Person.current.id).size()
  end

  def over_view_list
    html = ""
    @filters = Irm::RuleFilter.where("bo_code = ?", "ICM_INCIDENT_REQUESTS").hold.enabled
    @filters.each do |f|
      td1 = content_tag(:td, content_tag(:a, f[:filter_name], :href => url_for(:controller => "icm/incident_requests", :action => "index", :filter_id => f.id)))

      incident_requests_scope = f.generate_scope.query_by_company_ids(session[:accessable_companies])

      if !allow_to_function?(:view_all_incident_request)
        incident_requests_scope = incident_requests_scope.relate_person(Irm::Person.current.id)
      end

      td2 = content_tag(:td, incident_requests_scope.count.to_s, :class => "tdRight")
      html << content_tag(:tr, td1 + td2)
    end

    raw(html)
  end
end
