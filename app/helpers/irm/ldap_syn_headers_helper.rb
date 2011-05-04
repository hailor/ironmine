module Irm::LdapSynHeadersHelper
  def available_syn_object_type
    attribute_types = Irm::LookupValue.query_by_lookup_type("LDAP_SYN_TYPE").multilingual.collect{|p|[p[:meaning],p[:lookup_code]]}
    attribute_types
  end

  def available_ldap_syn_headers
    Irm::LdapSynHeader.query_by_status_code("ENABLED").collect{|i|[i[:name],i.id]}
  end

end
