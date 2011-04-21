module Slm::ServiceCategoriesHelper
  def available_service_categories
     Slm::ServiceCategory.multilingual
  end
end
