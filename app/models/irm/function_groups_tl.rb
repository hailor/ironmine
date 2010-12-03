class Irm::FunctionGroupsTl < ActiveRecord::Base
  set_table_name :irm_function_groups_tl
  belongs_to :function_group

  validates_presence_of :name
end
