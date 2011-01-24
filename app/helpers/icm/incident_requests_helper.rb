module Icm::IncidentRequestsHelper
  def available_service
    Irm::LookupValue.query_by_lookup_type("ICM_SERVICE_CODE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

  def available_person
    Irm::Person.query_by_support_staff_flag(Irm::Constant::SYS_NO).order_id.all.collect{|p|[p.name,p[:id]]}
  end

  def available_supporter
    Irm::Person.query_by_support_staff_flag(Irm::Constant::SYS_YES).order_id.all.collect{|p|[p.name,p[:id]]}
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

  def available_request_report_source
    Irm::LookupValue.query_by_lookup_type("ICM_REQUEST_REPORT_SOURCE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
  end

end
