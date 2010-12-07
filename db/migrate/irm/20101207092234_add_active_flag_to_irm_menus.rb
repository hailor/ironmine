class AddActiveFlagToIrmMenus < ActiveRecord::Migration
  def self.up
    add_column :irm_menus, :active_flag, :string, :limit => 1, :default => "Y", :null => false, :after => :status_code
  end

  def self.down
    remove_column :irm_menus, :active_flag
  end
end
