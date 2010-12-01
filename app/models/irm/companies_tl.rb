class Irm::CompaniesTl < ActiveRecord::Base
  set_table_name :irm_companies_tl
  belongs_to :company

  validates_presence_of :name
end
