module Irm::SiteGroupsHelper
  def available_site_group
    Irm::SiteGroup.query_by_status_code("ENABLED").multilingual
  end  
  def available_site
    Irm::Site.query_by_status_code("ENABLED").multilingual
  end
end
