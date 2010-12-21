module Irm::DepartmentsHelper
  def available_department
    Irm::Department.query_by_status_code("ENABLED").multilingual
  end
end
