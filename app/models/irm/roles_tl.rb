class Irm::RolesTl < ActiveRecord::Base
  set_table_name :irm_roles_tl

  belongs_to :role

  validates_presence_of :name

  scope :query_by_role_id,lambda{|role_id| where("role_id=?",role_id)}

end
