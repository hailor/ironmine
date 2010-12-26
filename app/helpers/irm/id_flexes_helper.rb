module Irm::IdFlexesHelper
  def available_id_flexes
    Irm::IdFlex.enabled.collect{|m| [m.id_flex_name, m.id_flex_code]}
  end
  
end