class Irm::RoleFunction < ActiveRecord::Base
  set_table_name :irm_role_functions

  belongs_to :role
  belongs_to :function

  # 验证唯一性
  validates_uniqueness_of :function_id, :scope=>["role_id"]

end
