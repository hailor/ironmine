class ModifyProductModuleColumnName < ActiveRecord::Migration
  def self.up
    rename_column :irm_product_modules_tl, :product_name, :name
    rename_column :irm_product_modules_tl, :product_description, :description
    execute('CREATE OR REPLACE VIEW irm_product_modules_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                         FROM irm_product_modules  t,irm_product_modules_tl tl
                                         WHERE t.id = tl.product_id')
  end

  def self.down
    rename_column :irm_product_modules_tl, :name, :product_name
    rename_column :irm_product_modules_tl, :description, :product_description
    execute('CREATE OR REPLACE VIEW irm_product_modules_vl AS SELECT t.*,tl.id lang_id,tl.product_name name,tl.product_description description,tl.language,tl.source_lang
                                             FROM irm_product_modules  t,irm_product_modules_tl tl
                                             WHERE t.id = tl.product_id')        
  end
end
