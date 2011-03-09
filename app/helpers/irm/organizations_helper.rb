module Irm::OrganizationsHelper
  def available_organization(company_id=nil)
    if company_id
      Irm::Organization.enabled.multilingual.query_by_company_id(company_id)
    else
      Irm::Organization.enabled.multilingual
    end
  end

  def current_organization(company_id)
    Irm::Organization.query_by_company_id(company_id).
                      query_by_status_code("ENABLED").multilingual
  end
end
