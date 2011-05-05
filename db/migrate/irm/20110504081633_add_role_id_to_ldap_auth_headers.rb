class AddRoleIdToLdapAuthHeaders < ActiveRecord::Migration
  def self.up
    add_column "irm_ldap_syn_people","role_id",:integer,:after=>:notification_flag
  end

  def self.down
    remove_column  "irm_ldap_syn_people","role_id"
  end
end
