class AddActiveFlagToIrmMenus < ActiveRecord::Migration
  def self.up
    add_column :irm_menus, :active_flag, :string, :limit => 1, :default => "Y", :null => false, :after => :status_code
    execute('CREATE OR REPLACE VIEW irm_menus_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menus  t,irm_menus_tl tl
                                             WHERE t.id = tl.menu_id')    
  end

  def self.down
    remove_column :irm_menus, :active_flag
    execute('CREATE OR REPLACE VIEW irm_menus_vl AS SELECT t.*,tl.id lang_id,tl.name,tl.description,tl.language,tl.source_lang
                                             FROM irm_menus  t,irm_menus_tl tl
                                             WHERE t.id = tl.menu_id')    
  end
end
