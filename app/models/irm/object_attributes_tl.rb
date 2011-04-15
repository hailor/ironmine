class Irm::ObjectAttributesTl < ActiveRecord::Base
  set_table_name :irm_object_attributes_tl

  belongs_to :object_attribute

  validates_presence_of :name
end
