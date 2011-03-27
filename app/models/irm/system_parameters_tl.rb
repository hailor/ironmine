class Irm::SystemParametersTl < ActiveRecord::Base
  set_table_name :irm_system_parameters_tl

  belongs_to :system_parameter
  validates_presence_of :name
end