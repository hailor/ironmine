class AddLoginNameToIrmLdapAuthHeaders < ActiveRecord::Migration
  def self.up
    add_column "irm_ldap_auth_headers","ldap_login_name_attr",:string,:limit=>30,:null=>false,:after=>:auth_cn
  end

  def self.down
    remove_column  "irm_ldap_auth_headers","ldap_login_name_attr"
  end
end
