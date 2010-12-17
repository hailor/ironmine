class Irm::PermissionsTl < ActiveRecord::Base
  set_table_name :irm_permissions_tl

  belongs_to :permission

  validates_presence_of :name

  scope :query_by_permission_id,lambda{|permission_id| where("permission_id=?",permission_id)}

end
