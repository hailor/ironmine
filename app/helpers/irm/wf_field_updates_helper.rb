module Irm::WfFieldUpdatesHelper
  def bo_attribute(bo_code,object_attribute)
    Irm::ObjectAttribute.where(:business_object_code=>bo_code,:attribute_name=>object_attribute).first
  end
end
