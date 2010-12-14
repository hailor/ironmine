class Irm::CurrenciesTl < ActiveRecord::Base
  set_table_name :irm_currencies_tl

  belongs_to :currency

  validates_presence_of :name
end
