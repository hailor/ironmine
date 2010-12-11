class AddLastLoginAtToIrmIdentities < ActiveRecord::Migration
  def self.up
    add_column :irm_identities,:last_login_at,:datetime,:after=>:language_code
  end

  def self.down
    remove_column :irm_identities,:last_login_at
  end
end
