class RenameSynPersonId < ActiveRecord::Migration
  def self.up
    rename_column "irm_ldap_syn_headers","syn_people_id","ldap_auth_header_id"
  end

  def self.down
    rename_column "irm_ldap_syn_headers","ldap_auth_header_id","syn_people_id"
  end
end
