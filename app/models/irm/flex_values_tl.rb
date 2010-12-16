class Irm::FlexValuesTl < ActiveRecord::Base
  set_table_name :irm_flex_values_tl
  belongs_to :flex_value

  validates_presence_of :name
end
