class Irm::LdapAuthHeader < ActiveRecord::Base
  set_table_name :irm_ldap_auth_headers
  belongs_to :ldap_source,:foreign_key=>:ldap_source_id,:primary_key=>:id
  has_many :ldap_auth_attributes
  query_extend

  scope :query_auth_info,lambda{ select("#{table_name}.*,"+
                                                          "v1.name ldap_source").
                                                   joins(",irm_ldap_sources v1").
                                                   where("v1.id=#{table_name}.ldap_source_id")}


end
