class AddSystemParametersTable < ActiveRecord::Migration
  def self.up
    create_table :irm_system_parameters, :force => true do |t|
      t.integer :company_id, :null => false
      t.string :parameter_code, :limit => 30
      t.string :content_type, :limit => 30, :null => false
      t.string :data_type, :limit => 30, :null =>  false
      t.string :value, :limit => 240
      t.string :status_code, :limit => 30, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :irm_system_parameters_tl, :force => true do |t|
      t.integer :company_id, :null => false
      t.integer :system_parameter_id, :null => false
      t.string :name, :limit => 150
      t.string :description, :limit => 240
      t.string :language, :limit => 30
      t.string :source_lang, :limit => 30
      t.string :status_code, :limit => 30, :default => "ENABLED"
      t.integer  :created_by
      t.integer  :updated_by
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index "irm_system_parameters_tl", ["system_parameter_id", "language"], :name => "IRM_SYSTEM_PARAMETERS_TL_U1", :unique => true
    execute('CREATE OR REPLACE VIEW irm_system_parameters_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_system_parameters  t,irm_system_parameters_tl tl
                                             WHERE t.id = tl.system_parameter_id')
  end

  def self.down
    execute('drop view irm_system_parameters_vl')
    drop_table :irm_system_parameters
    drop_table :irm_system_parameters_tl
  end
end
