module Irm::CompaniesHelper
  def available_company
    Irm::Company.query_by_status_code("ENABLED").multilingual
  end
end