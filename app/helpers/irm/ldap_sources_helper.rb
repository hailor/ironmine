module Irm::LdapSourcesHelper
  def available_ldap_sources
    Irm::LdapSource.query_by_status_code("ENABLED").collect{|i|[i[:name],i.id]}
  end
end
