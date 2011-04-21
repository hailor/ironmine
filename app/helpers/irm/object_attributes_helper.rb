module Irm::ObjectAttributesHelper
  def available_attribute_type
    attribute_types = Irm::LookupValue.query_by_lookup_type("BO_ATTRIBUTE_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
    attribute_types.delete_if{|at| at[1].eql?("TABLE_COLUMN")}
    attribute_types
  end
  def available_object_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    else
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual
    end
    object_attributes.collect{|i|[i[:name],i.attribute_name]}
  end
  # only table column
  def available_relationable_object_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.table_column.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    end
    object_attributes.collect{|i|[i.attribute_name,i.attribute_name,{:attribute_name=>i.attribute_name}]}
  end

  # table column and relation column
  def available_selectable_object_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.selectable_column.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    end
    object_attributes.collect{|i|[i.attribute_name,i.attribute_name,{:attribute_name=>i.attribute_name}]}
  end
end
