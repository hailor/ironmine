class Irm::ValueSetsTl < ActiveRecord::Base
  set_table_name :irm_value_sets_tl
  belongs_to :value_set

  validates_presence_of :name
end
