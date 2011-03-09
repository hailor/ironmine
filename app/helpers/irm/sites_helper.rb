module Irm::SitesHelper
  def available_sites
    Irm::Site.multilingual.enabled
  end
end
