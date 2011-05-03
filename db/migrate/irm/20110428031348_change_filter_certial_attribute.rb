class ChangeFilterCertialAttribute < ActiveRecord::Migration
  def self.up
    change_column(:irm_rule_filter_criterions, :attribute_name, :string,:limit=>60, :null => true)
  end

  def self.down
    change_column(:irm_rule_filter_criterions, :attribute_name, :string,:limit=>60, :null => true)
  end
end
