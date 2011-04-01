module Irm::CompaniesHelper
  def available_company
    Irm::Company.query_by_status_code("ENABLED").multilingual.collect{|i|[i[:name],i.id]}
  end
end