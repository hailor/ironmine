class Irm::PermissionsTl < ActiveRecord::Base
  set_table_name :irm_permissions_tl

  belongs_to :permission

  validates_presence_of :name

end
