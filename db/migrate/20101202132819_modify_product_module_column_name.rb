class ModifyProductModuleColumnName < ActiveRecord::Migration
  def self.up
    rename_column :irm_product_modules_tl, :product_name, :name
    rename_column :irm_product_modules_tl, :product_description, :description
  end

  def self.down
    rename_column :irm_product_modules_tl, :name, :product_name
    rename_column :irm_product_modules_tl, :description, :product_description    
  end
end
