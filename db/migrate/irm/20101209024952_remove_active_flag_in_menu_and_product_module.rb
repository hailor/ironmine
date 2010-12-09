class RemoveActiveFlagInMenuAndProductModule < ActiveRecord::Migration
  def self.up
    remove_column :irm_menus, :active_flag
    remove_column :irm_product_modules, :active_flag
  end

  def self.down
    add_column :irm_menus, :active_flag, :string, :limit => 1, :default => "Y", :null => false, :after => :status_code
    add_column :irm_product_modules, :active_flag, :string, :limit => 1, :default => "Y", :null => false, :after => :status_code    
  end
end
