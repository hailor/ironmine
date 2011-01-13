class Irm::FunctionMember < ActiveRecord::Base
  set_table_name :irm_function_members
  belongs_to :function
  belongs_to :permission
end
