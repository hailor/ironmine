module Irm::LdapSynHeadersHelper
  def available_syn_object_type
    attribute_types = Irm::LookupValue.query_by_lookup_type("LDAP_SYN_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
    attribute_types
  end

  def available_ldap_syn_headers
    Irm::LdapSynHeader.query_by_status_code("ENABLED").collect{|i|[i[:name],i.id]}
  end


  def available_ldap_auth_headers(ldap_source_id=nil)
    ldap_auth_headers = []
    if ldap_source_id
      ldap_auth_headers = Irm::LdapAuthHeader.enabled.query_by_ldap_source(ldap_source_id)
    end
    ldap_auth_headers.collect{|i| [i[:name],i.id]}

  end

end
