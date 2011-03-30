class CreateUidExternalSystemVl < ActiveRecord::Migration
  def self.up
    execute('CREATE OR REPLACE VIEW uid_external_systems_vl AS SELECT t.*,tl.id lang_id,tl.system_name,tl.system_description,tl.language,tl.source_lang
                                             FROM uid_external_systems  t,uid_external_systems_tl tl
                                             WHERE t.id = tl.external_system_id')
  end

  def self.down
     execute('drop view uid_external_systems_vl')
  end
end
