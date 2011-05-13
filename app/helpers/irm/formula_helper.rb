module Irm::FormulaHelper
  def available_formula_function_type
    Irm::LookupValue.query_by_lookup_type("IRM_FORMULA_FUNCTION_TYPE").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end
end