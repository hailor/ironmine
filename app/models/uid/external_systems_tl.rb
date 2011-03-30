class Uid::ExternalSystemsTl < ActiveRecord::Base
  set_table_name :uid_external_systems_tl

  belongs_to :external_system

end
