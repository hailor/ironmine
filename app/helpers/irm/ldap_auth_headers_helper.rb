module Irm::LdapAuthHeadersHelper
  def available_ldap_auth_headers
    Irm::LdapAuthHeader.query_by_status_code("ENABLED").collect{|i|[i[:name],i.id]}
  end

  def available_template_people
    Irm::Person.where(:type=>"Irm::TemplatePerson").collect{|i|[i[:full_name],i.id]}
  end
end
