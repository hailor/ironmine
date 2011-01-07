module Irm::SiteGroupsHelper
  def available_site_group
    Irm::SiteGroup.query_by_status_code("ENABLED").multilingual
  end  
  def available_site
    Irm::Site.query_by_status_code("ENABLED").multilingual
  end

  def current_site(site_group_code)
    Irm::Site.query_by_site_group_code(site_group_code).query_by_status_code("ENABLED").multilingual
  end

  def available_site_group_collect
    Irm::SiteGroup.query_by_status_code("ENABLED").multilingual.collect{|p| [p.name, p.site_group_code]}
  end
end
