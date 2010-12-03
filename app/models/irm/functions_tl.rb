class Irm::FunctionsTl < ActiveRecord::Base
  set_table_name :irm_functions_tl
  belongs_to :function

  validates_presence_of :name
end
