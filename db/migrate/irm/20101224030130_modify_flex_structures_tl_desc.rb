class ModifyFlexStructuresTlDesc < ActiveRecord::Migration
  def self.up
    change_column :irm_id_flex_structures_tl, :description, :string, :limit => 240, :null => true
  end

  def self.down
  end
end
