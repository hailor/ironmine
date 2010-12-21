class ModifyIrmLocations < ActiveRecord::Migration
  def self.up
    add_column :irm_locations,:organization_id,:integer,:after=>:company_id
    add_column :irm_locations,:department_id,:integer,:after=>:organization_id
    add_column :irm_locations,:site_group_code,:string,:limit=>30,:after=>:department_id
  end

  def self.down
    remove_column :irm_locations,:organization_id
    remove_column :irm_locations,:department_id
    remove_column :irm_locations,:site_group_code    
  end
end
