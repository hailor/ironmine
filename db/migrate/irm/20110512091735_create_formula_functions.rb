class CreateFormulaFunctions < ActiveRecord::Migration
  def self.up
    create_table "irm_formula_functions", :force => true do |t|
      t.integer "company_id",       :null => false
      t.string  "function_code",    :limit => 30,:null => false
      t.string  "parameters",       :limit => 150
      t.string  "function_type",    :limit => 30,:null => false
      t.string   "status_code",     :limit => 30, :default=>"ENABLED"
      t.integer  "created_by"
      t.integer  "updated_by"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "irm_formula_functions", ["function_code"], :name => "IRM_FORMULA_FUNCTIONS_U1", :unique => true

    create_table "irm_formula_functions_tl", :force => true do |t|
      t.integer   "company_id",           :null => false
      t.integer   "formula_function_id",  :null=>false
      t.string    "description",          :limit=>150
      t.string    "language",             :limit=>30
      t.string    "source_lang",          :limit=>30
      t.string    "status_code",          :limit => 30, :default=>"ENABLED"
      t.integer   "created_by"
      t.integer   "updated_by"
      t.datetime  "created_at"
      t.datetime  "updated_at"
    end

    add_index "irm_formula_functions_tl", ["formula_function_id", "language"], :name => "IRM_FORMULA_FUNCTIONS_TL_U1", :unique => true

    execute('CREATE OR REPLACE VIEW irm_formula_functions_vl AS SELECT t.*,tl.id lang_id,tl.description,tl.language,tl.source_lang
                                                 FROM irm_formula_functions t,irm_formula_functions_tl tl
                                                 WHERE t.id = tl.formula_function_id')
  end

  def self.down
    drop_table :irm_formula_functions
    drop_table :irm_formula_functions_tl
    execute('drop view irm_formula_functions_vl')
  end
end
