module Irm::OrganizationsHelper
  def available_organization
    Irm::Organization.query_by_status_code("ENABLED").multilingual
  end

  def current_organization(company_id)
    Irm::Organization.query_by_company_id(company_id).
                      query_by_status_code("ENABLED").multilingual
  end
end
