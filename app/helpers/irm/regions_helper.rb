module Irm::RegionsHelper
  def available_region
    Irm::Region.query_by_status_code("ENABLED").multilingual.collect{|i| [i[:name],i.id]}
  end
end
