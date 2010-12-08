class AddActiveFlagToIrmProductModules < ActiveRecord::Migration
  def self.up
    add_column :irm_product_modules, :active_flag, :string, :limit => 1, :default => "Y", :null => false, :after => :status_code
    execute('CREATE OR REPLACE VIEW irm_product_modules_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                         FROM irm_product_modules  t,irm_product_modules_tl tl
                                         WHERE t.id = tl.product_id')    
  end

  def self.down
    remove_column :irm_product_modules, :active_flag
    execute('CREATE OR REPLACE VIEW irm_product_modules_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                         FROM irm_product_modules  t,irm_product_modules_tl tl
                                         WHERE t.id = tl.product_id')       
  end
end
