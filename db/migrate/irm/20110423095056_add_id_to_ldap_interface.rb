class AddIdToLdapInterface < ActiveRecord::Migration
  def self.up
    add_column :irm_ldap_syn_interface, :company_id, :integer
    add_column :irm_ldap_syn_interface, :organization_id, :integer
    add_column :irm_ldap_syn_interface, :department_id, :integer
  end

  def self.down
    remove_column  :irm_ldap_syn_interface, :company_id
    remove_column  :irm_ldap_syn_interface, :organization_id
    remove_column  :irm_ldap_syn_interface, :department_id
  end
end
