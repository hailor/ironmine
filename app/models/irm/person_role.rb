class Irm::PersonRole < ActiveRecord::Base
  set_table_name :irm_person_roles
  belongs_to :person
  belongs_to :role
end