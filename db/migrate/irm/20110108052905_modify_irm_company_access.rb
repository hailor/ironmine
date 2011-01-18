class ModifyIrmCompanyAccess < ActiveRecord::Migration
  def self.up
    add_column :irm_company_accesses,:company_access_flag,:string,:limit=>1,:after=>:accessable_company_id
    add_column :irm_company_accesses,:support_stuff_flag,:string,:limit=>1,:after=>:company_access_flag
  end

  def self.down
    remove_column :irm_company_accesses,:company_access_flag
    remove_column :irm_company_accesses,:support_stuff_flag
  end
end
