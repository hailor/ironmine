class Irm::FunctionMember < ActiveRecord::Base
  set_table_name :irm_function_members

  belongs_to :function,:foreign_key => "function_code",:primary_key => "function_code"
  belongs_to :permission,:foreign_key => "permission_code",:primary_key => "permission_code"
end
