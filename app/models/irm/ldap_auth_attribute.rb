class Irm::LdapAuthAttribute < ActiveRecord::Base
  set_table_name :irm_ldap_auth_attributes
  belongs_to :ldap_auth_header,:foreign_key=>:ldap_auth_header_id,:primary_key=>:id

  query_extend
end
