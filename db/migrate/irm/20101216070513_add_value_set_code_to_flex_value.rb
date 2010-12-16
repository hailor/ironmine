class AddValueSetCodeToFlexValue < ActiveRecord::Migration
  def self.up
    add_column :irm_flex_values, :value_set_code, :string, :limit => 30, :after => :id
  end

  def self.down
    remove_column :irm_flex_values, :value_set_code
  end
end
