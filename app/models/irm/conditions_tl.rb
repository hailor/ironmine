class Irm::ConditionsTl < ActiveRecord::Base
  set_table_name :irm_conditions_tl

  belongs_to :condition

  validates_presence_of :name
end