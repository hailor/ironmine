module Irm::LdapAuthAttributesHelper
  def available_ldap_object_attribute(business_object_code=nil)
    object_attributes =[]
    if business_object_code
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual.where(:business_object_code=>business_object_code)
    else
      object_attributes = Irm::ObjectAttribute.query_by_status_code("ENABLED").multilingual
    end
    object_attributes.delete_if{|i| i.attribute_name.include?("id")||i.attribute_name.include?("login_name")}
    object_attributes.delete_if{|i| i.attribute_name.include?("id")||i.attribute_name.include?("password")}
    object_attributes.delete_if{|i| i.attribute_name.include?("id")||i.attribute_name.include?("flag")}
    object_attributes.delete_if{|i| i.attribute_name.include?("avatar")||i.attribute_name.include?("flag")}
    #object_attributes.delete_if{|i| i.attribute_name.include?("login_name")||i.attribute_name.include?("hashed_password")}

    object_attributes.collect{|i|[i[:name],i.attribute_name] }
  end
end
