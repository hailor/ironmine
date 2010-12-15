module Irm::CurrenciesHelper
  def available_currency
    Irm::Currency.multilingual.query_by_status_code("ENABLED")
  end
end
