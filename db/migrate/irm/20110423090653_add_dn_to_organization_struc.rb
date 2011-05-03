class AddDnToOrganizationStruc < ActiveRecord::Migration
  def self.up
    add_column :irm_companies, :ldap_dn, :string, :limit => 200
    add_column :irm_organizations, :ldap_dn, :string, :limit => 200
    add_column :irm_departments, :ldap_dn, :string, :limit => 200
    add_column :irm_people, :ldap_dn, :string, :limit => 200
  end

  def self.down
    remove_column  :irm_companies, :ldap_dn
    remove_column  :irm_organizations, :ldap_dn
    remove_column  :irm_departments, :ldap_dn
    remove_column  :irm_people, :ldap_dn
  end
end
