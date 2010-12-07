class AddActiveFlagToIrmProductModules < ActiveRecord::Migration
  def self.up
    add_column :irm_product_modules, :active_flag, :string, :limit => 1, :default => "Y", :null => false    
  end

  def self.down
    remove_column :irm_product_modules, :active_flag
  end
end
