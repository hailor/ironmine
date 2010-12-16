module Irm::OrganizationsHelper
  def available_organization
    Irm::Organization.query_by_status_code("ENABLED").multilingual
  end
end
