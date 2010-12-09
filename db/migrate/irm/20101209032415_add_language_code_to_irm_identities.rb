class AddLanguageCodeToIrmIdentities < ActiveRecord::Migration
  def self.up
    add_column :irm_identities,:language_code,:string,:limit=>30,:null=>false,:after=>:auth_source_id
  end

  def self.down
    remove_column :irm_identities,:language_code
  end
end
