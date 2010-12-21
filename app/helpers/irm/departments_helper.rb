module Irm::DepartmentsHelper
  def available_department
    Irm::Department.query_by_status_code("ENABLED").multilingual
  end

  def current_department(company_id,organization_id)
    Irm::Department.query_all_department(company_id,organization_id).query_by_status_code("ENABLED").multilingual
  end
end
