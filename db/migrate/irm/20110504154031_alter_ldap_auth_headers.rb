class AlterLdapAuthHeaders < ActiveRecord::Migration
  def self.up
    add_column "irm_ldap_auth_headers","template_person_id",:string,:limit=>30,:after=>:ldap_login_name_attr
    add_column "irm_ldap_auth_headers","ldap_email_address_attr",:string,:limit=>30,:after=>:ldap_login_name_attr
  end

  def self.down
    remove_column "irm_ldap_auth_headers","template_person_id"
    remove_column "irm_ldap_auth_headers","ldap_email_address_attr"
  end
end
