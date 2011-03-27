class AlterMenuTables < ActiveRecord::Migration
  def self.up
    rename_column(:irm_menu_entries,:permission_code,:page_controller)
    add_column(:irm_menu_entries,:page_action,:string,:limit=>30,:after=>"page_controller")
    execute('CREATE OR REPLACE VIEW irm_menu_entries_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menu_entries  t,irm_menu_entries_tl tl
                                             WHERE t.id = tl.menu_entry_id')
  end

  def self.down
    rename_column(:irm_menu_entries,:page_controller,:permission_code)
    remove_column(:irm_menu_entries,:page_action)
    execute('CREATE OR REPLACE VIEW irm_menu_entries_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menu_entries  t,irm_menu_entries_tl tl
                                             WHERE t.id = tl.menu_entry_id')
  end
end
