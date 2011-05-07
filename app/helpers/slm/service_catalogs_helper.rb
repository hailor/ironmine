module Slm::ServiceCatalogsHelper
  def available_service_owner
     Irm::Person.real.collect{|p| ["#{p[:login_name]}(#{p[:person_name]})",p[:id]]}
  end
end
