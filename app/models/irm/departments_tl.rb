class Irm::DepartmentsTl < ActiveRecord::Base
  set_table_name :irm_departments_tl

  belongs_to :department

  validates_presence_of :name
end
