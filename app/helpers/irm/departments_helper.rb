module Irm::DepartmentsHelper
  def available_department(organization_id=nil)
    if(organization_id)
      departments = Irm::Department.query_by_organization(organization_id).multilingual.enabled
    else
      departments = Irm::Department.multilingual.enabled
    end
    departments.collect{|i| [i[:name],i.id]}
  end

  def current_department(company_id,organization_id)
    Irm::Department.query_all_department(company_id,organization_id).query_by_status_code("ENABLED").multilingual
  end
end
