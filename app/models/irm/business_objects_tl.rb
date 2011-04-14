class Irm::BusinessObjectsTl < ActiveRecord::Base
  set_table_name :irm_business_objects_tl

  belongs_to :business_object

  validates_presence_of :name
end
