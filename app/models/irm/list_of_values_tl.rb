class Irm::ListOfValuesTl < ActiveRecord::Base
  set_table_name :irm_list_of_values_tl

  belongs_to :list_of_value

  validates_presence_of :name,:value_title,:desc_title
end
