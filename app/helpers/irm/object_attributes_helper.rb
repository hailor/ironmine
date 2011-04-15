module Irm::ObjectAttributesHelper
  def available_object_attribute_name(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    else
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual
    end
    object_attributes.collect{|i|[i[:name],i.attribute_name]}
  end

  def available_object_attribute(business_object_code=nil,force=false)
    object_attributes =[]
    return object_attributes if business_object_code.nil?&&force
    if business_object_code
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    else
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual
    end
    object_attributes.collect{|i|[i[:name],i.id,{:attribute_name=>i.attribute_name}]}
  end
end
