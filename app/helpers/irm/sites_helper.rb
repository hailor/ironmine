module Irm::SitesHelper
  def available_site(site_group_code=nil)
    if(site_group_code)
      sites = Irm::Site.query_by_site_group_code(site_group_code).multilingual.enabled
    else
      sites = Irm::Site.multilingual.enabled
    end
    sites.collect{|i| [i[:name],i.id]}
  end
end
