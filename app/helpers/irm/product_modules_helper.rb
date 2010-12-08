module Irm::ProductModulesHelper
  def available_product_modules
    Irm::ProductModule.multilingual.collect{|t| [t[:name], t.id]}
  end
end
