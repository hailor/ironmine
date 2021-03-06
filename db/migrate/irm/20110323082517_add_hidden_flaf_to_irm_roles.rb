class AddHiddenFlafToIrmRoles < ActiveRecord::Migration
  def self.up
    add_column(:irm_roles,:hidden_flag,:string,:limit=>1,:default=>"N",:after=>"report_group_code")
    execute('CREATE OR REPLACE VIEW irm_roles_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_roles  t,irm_roles_tl tl
                                             WHERE t.id = tl.role_id')
  end

  def self.down
    remove_column(:irm_roles,:hidden_flag)
    execute('CREATE OR REPLACE VIEW irm_roles_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_roles  t,irm_roles_tl tl
                                             WHERE t.id = tl.role_id')
  end
end
