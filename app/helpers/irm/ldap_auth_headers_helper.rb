module Irm::LdapAuthHeadersHelper
  def available_ldap_auth_headers
    Irm::LdapAuthHeader.query_by_status_code("ENABLED").collect{|i|[i[:name],i.id]}
  end
end
