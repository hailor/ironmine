class Irm::FunctionGroupMember < ActiveRecord::Base
  set_table_name :irm_function_group_members

  belongs_to :function,:foreign_key => "function_code",:primary_key => "function_code"
  belongs_to :function_group,:foreign_key => "group_code",:primary_key => "group_code"
end
