module Irm::LdapSynAttributesHelper
  def available_syn_object_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    else
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual
    end
    object_attributes.delete_if{|i| i.attribute_name.include?("id")}
    object_attributes.delete_if{|i| i.attribute_name.include?("update")||i.attribute_name.include?("create")}
    object_attributes.delete_if{|i| i.attribute_name.include?("language")||i.attribute_name.include?("source_lang")}

    object_attributes.collect{|i|[i[:name],i.attribute_name] }
  end

  def available_syn_value_type
    attribute_types = Irm::LookupValue.query_by_lookup_type("LDAP_VALUE_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}

    attribute_types
  end
end
