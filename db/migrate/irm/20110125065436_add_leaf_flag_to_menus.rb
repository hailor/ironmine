class AddLeafFlagToMenus < ActiveRecord::Migration
  def self.up
    add_column :irm_menus,:leaf_flag,:string,:limit=>1,:after=>:menu_code,:default=>"N"
    remove_column :irm_menus,:icon
    execute('CREATE OR REPLACE VIEW irm_menus_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menus  t,irm_menus_tl tl
                                             WHERE t.id = tl.menu_id')
  end

  def self.down
    remove_column :irm_menus,:leaf_flag
    add_column :irm_menus,:icon,:limit=>30,:after=>:menu_code
    execute('CREATE OR REPLACE VIEW irm_menus_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menus  t,irm_menus_tl tl
                                             WHERE t.id = tl.menu_id')
  end
end
