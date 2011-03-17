class ReworkFunctionPermissionTables < ActiveRecord::Migration
  def self.up
    add_column(:irm_functions,:group_code,:string,:limit=>30,:before=>"function_code")
    add_column(:irm_functions,:public_flag,:string,:limit=>1,:before=>"status_code",:default=>"N")
    add_column(:irm_functions,:default_flag,:string,:limit=>1,:before=>"status_code",:default=>"Y")
    execute('CREATE OR REPLACE VIEW irm_functions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_functions  t,irm_functions_tl tl
                                             WHERE t.id = tl.function_id')
    add_column(:irm_permissions,:function_code,:string,:limit=>30,:before=>"product_id")
    remove_index(:irm_permissions,:name => "IRM_PERMISSIONS_U1")
  end

  def self.down
    remove_column(:irm_functions,:group_code)
    remove_column(:irm_functions,:public_flag)
    remove_column(:irm_functions,:default_flag)
    execute('CREATE OR REPLACE VIEW irm_functions_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_functions  t,irm_functions_tl tl
                                             WHERE t.id = tl.function_id')
    remove_column(:irm_permissions,:function_code)
    add_index "irm_permissions", ["permission_code"], :name => "IRM_PERMISSIONS_U1", :unique => true
  end
end
