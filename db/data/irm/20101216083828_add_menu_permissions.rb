class AddMenuPermissions < ActiveRecord::Migration
  def self.up
    irm_menus_index = Irm::Permission.new(:permission_code=>'IRM_MENUS_INDEX',
                                             :page_controller=>'irm/menus',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_menus_index.permissions_tls.build(:language=>'zh',:name=>'菜单',:description=>'菜单',:source_lang=>'en')
    irm_menus_index.permissions_tls.build(:language=>'en',:name=>'Menu',:description=>'Menu',:source_lang=>'en')
    irm_menus_index.save

    irm_menus_edit = Irm::Permission.new(:permission_code=>'IRM_MENUS_EDIT',
                                             :page_controller=>'irm/menus',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_menus_edit.permissions_tls.build(:language=>'zh',:name=>'编辑菜单',:description=>'编辑菜单',:source_lang=>'en')
    irm_menus_edit.permissions_tls.build(:language=>'en',:name=>'Edit Menu',:description=>'Edit Menu',:source_lang=>'en')
    irm_menus_edit.save

    irm_menus_new = Irm::Permission.new(:permission_code=>'IRM_MENUS_NEW',
                                             :page_controller=>'irm/menus',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_menus_new.permissions_tls.build(:language=>'zh',:name=>'创建菜单',:description=>'创建菜单',:source_lang=>'en')
    irm_menus_new.permissions_tls.build(:language=>'en',:name=>'Create Menu',:description=>'Create Menu',:source_lang=>'en')
    irm_menus_new.save

    irm_menu_entries_index = Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_INDEX',
                                             :page_controller=>'irm/menu_entries',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_menu_entries_index.permissions_tls.build(:language=>'zh',:name=>'子菜单项',:description=>'子菜单项',:source_lang=>'en')
    irm_menu_entries_index.permissions_tls.build(:language=>'en',:name=>'Menu Entries',:description=>'Menu Entries',:source_lang=>'en')
    irm_menu_entries_index.save

#    irm_menu_entries_edit = Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_EDIT',
#                                             :page_controller=>'irm/menu_entries',
#                                             :page_action=>'edit',
#                                             :not_auto_mult=>true)
#    irm_menu_entries_edit.permissions_tls.build(:language=>'zh',:name=>'编辑子菜单项',:description=>'编辑子菜单项',:source_lang=>'en')
#    irm_menu_entries_edit.permissions_tls.build(:language=>'en',:name=>'Edit Menu Entry',:description=>'Edit Menu Entry',:source_lang=>'en')
#    irm_menu_entries_edit.save
#
#    irm_menu_entries_new = Irm::Permission.new(:permission_code=>'IRM_MENU_ENTRIES_NEW',
#                                             :page_controller=>'irm/menu_entries',
#                                             :page_action=>'new',
#                                             :not_auto_mult=>true)
#    irm_menu_entries_new.permissions_tls.build(:language=>'zh',:name=>'创建子菜单项',:description=>'创建子菜单项',:source_lang=>'en')
#    irm_menu_entries_new.permissions_tls.build(:language=>'en',:name=>'Create Menu Entry',:description=>'Create Menu Entry',:source_lang=>'en')
#    irm_menu_entries_new.save
  end

  def self.down
  end
end
