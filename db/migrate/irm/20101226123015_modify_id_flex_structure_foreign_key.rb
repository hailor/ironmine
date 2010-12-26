class ModifyIdFlexStructureForeignKey < ActiveRecord::Migration
  def self.up
    execute('DROP VIEW irm_id_flex_structures_vl')
    add_column :irm_id_flex_structures_tl, :id_flex_structure_id, :integer, :after => :id
    remove_column :irm_id_flex_structures_tl, :id_flex_code
    remove_column :irm_id_flex_structures_tl, :id_flex_num
  end

  def self.down
    remove_column :irm_id_flex_structures_tl, :id_flex_structure_id
    add_column :irm_id_flex_structures_tl, :id_flex_code, :string, :limit => 30, :after => :id
    add_column :irm_id_flex_structures_tl, :id_flex_num, :integer, :after => :id
  end
end
