class CreateModuleProductModuleTables < ActiveRecord::Migration
  def self.up
    create_table "irm_product_modules" do |t|
      t.string   "product_short_name",   :limit => 30,:null => false
      t.string   "installed_flag",   :limit => 1
      t.string   "status_code",   :limit => 30,:null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "irm_product_modules_tl" do |t|
      t.integer   "product_id", :null => false
      t.string   "language",   :limit => 30, :null => false
      t.string   "product_name",   :limit => 150,:null => false
      t.string   "product_description",   :limit => 240
      t.string   "source_lang",   :limit => 30,:null => false
      t.string   "status_code",   :limit => 30,:null => false
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    execute('CREATE OR REPLACE VIEW irm_product_modules_vl AS SELECT t.*,tl.id lang_id,tl.product_name name,tl.product_description description,tl.language,tl.source_lang
                                             FROM irm_product_modules  t,irm_product_modules_tl tl
                                             WHERE t.id = tl.product_id')    
  end

  def self.down
    execute('drop view irm_product_modules_vl')
    drop_table "irm_product_modules"
    drop_table "irm_product_modules_tl"
  end
end
