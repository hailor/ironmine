module Irm::RegionsHelper
  def available_region
    Irm::Region.query_by_status_code("ENABLED").multilingual
  end
end
