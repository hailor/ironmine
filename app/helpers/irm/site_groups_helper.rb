module Irm::SiteGroupsHelper
  def available_site_group(region_code=nil)
    if(region_code)
      site_groups = Irm::SiteGroup.query_by_region_code(region_code).multilingual.enabled
    else
      site_groups = Irm::SiteGroup.multilingual.enabled
    end
    site_groups.collect{|i| [i[:name],i.id]}
  end
end
