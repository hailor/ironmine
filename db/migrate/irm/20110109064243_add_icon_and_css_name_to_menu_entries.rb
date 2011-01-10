class AddIconAndCssNameToMenuEntries < ActiveRecord::Migration
  def self.up
    add_column :irm_menu_entries, :icon, :string, :limit => 60, :after => :display_flag
    add_column :irm_menu_entries, :css_name, :string, :limit => 60, :after => :icon
  end

  def self.down
    remove_column :irm_menu_entries, :icon
    remove_column :irm_menu_entries, :css_name
  end
end
