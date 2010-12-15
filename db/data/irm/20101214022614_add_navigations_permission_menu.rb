# -*- coding: utf-8 -*-
class AddNavigationsPermissionMenu < ActiveRecord::Migration
  def self.up
    irm_navigations_entrance = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_ENTRANCE',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'entrance',
                                             :not_auto_mult=>true)
    irm_navigations_entrance.permissions_tls.build(:language=>'zh',:name=>'系统页面入口',:description=>'系统页面入口',:source_lang=>'en')
    irm_navigations_entrance.permissions_tls.build(:language=>'en',:name=>'System Entrance',:description=>'System Entrance',:source_lang=>'en')
    irm_navigations_entrance.save

    irm_navigations_workspace = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_WORKSPACE',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'workspace',
                                             :not_auto_mult=>true)
    irm_navigations_workspace.permissions_tls.build(:language=>'zh',:name=>'我的工作空间',:description=>'我的工作空间',:source_lang=>'en')
    irm_navigations_workspace.permissions_tls.build(:language=>'en',:name=>'Workspace',:description=>'Workspace',:source_lang=>'en')
    irm_navigations_workspace.save

    irm_navigations_my_page = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_MY_PAGE',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'my_page',
                                             :not_auto_mult=>true)
    irm_navigations_my_page.permissions_tls.build(:language=>'zh',:name=>'我的页面',:description=>'我的页面',:source_lang=>'en')
    irm_navigations_my_page.permissions_tls.build(:language=>'en',:name=>'My Page',:description=>'My Page',:source_lang=>'en')
    irm_navigations_my_page.save

    irm_navigations_my_setting = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_MY_SETTING',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'my_setting',
                                             :not_auto_mult=>true)
    irm_navigations_my_setting.permissions_tls.build(:language=>'zh',:name=>'我的设置',:description=>'我的设置',:source_lang=>'en')
    irm_navigations_my_setting.permissions_tls.build(:language=>'en',:name=>'My Setting',:description=>'My Setting',:source_lang=>'en')
    irm_navigations_my_setting.save

    irm_navigations_admin = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_ADMIN',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'admin',
                                             :not_auto_mult=>true)
    irm_navigations_admin.permissions_tls.build(:language=>'zh',:name=>'管理',:description=>'管理',:source_lang=>'en')
    irm_navigations_admin.permissions_tls.build(:language=>'en',:name=>'Admin',:description=>'Admin',:source_lang=>'en')
    irm_navigations_admin.save


    irm_navigations_advnace_setting = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_ADVNACE_SETTIN',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'advance_setting',
                                             :not_auto_mult=>true)
    irm_navigations_advnace_setting.permissions_tls.build(:language=>'zh',:name=>'高级设置',:description=>'高级设置',:source_lang=>'en')
    irm_navigations_advnace_setting.permissions_tls.build(:language=>'en',:name=>'Advance Setting',:description=>'Advance Setting',:source_lang=>'en')
    irm_navigations_advnace_setting.save

    
    irm_entrance_menu = Irm::Menu.new(:menu_code=>'IRM_ENTRANCE_MENU',:not_auto_mult=>true)
    irm_entrance_menu.menus_tls.build(:language=>'zh',:name=>'入口菜单',:description=>'入口菜单',:source_lang=>'en')
    irm_entrance_menu.menus_tls.build(:language=>'en',:name=>'Entrance Menu',:description=>'Entrance Menu',:source_lang=>'en')
    irm_entrance_menu.save

    irm_workspace_menu = Irm::Menu.new(:menu_code=>'IRM_WORKSPACE_MENU',:not_auto_mult=>true)
    irm_workspace_menu.menus_tls.build(:language=>'zh',:name=>'我的工作空间菜单',:description=>'我的工作空间菜单',:source_lang=>'en')
    irm_workspace_menu.menus_tls.build(:language=>'en',:name=>'Workspace Menu',:description=>'Workspace Menu',:source_lang=>'en')
    irm_workspace_menu.save

    irm_my_page_menu = Irm::Menu.new(:menu_code=>'IRM_MY_PAGE_MENU',:icon=>'my_page.gif',:not_auto_mult=>true)
    irm_my_page_menu.menus_tls.build(:language=>'zh',:name=>'我的页面菜单',:description=>'我的页面菜单',:source_lang=>'en')
    irm_my_page_menu.menus_tls.build(:language=>'en',:name=>'My Page Menu',:description=>'My Page Menu',:source_lang=>'en')
    irm_my_page_menu.save

    irm_my_setting_menu = Irm::Menu.new(:menu_code=>'IRM_MY_SETTING_MENU',:icon=>'my_settings.gif',:not_auto_mult=>true)
    irm_my_setting_menu.menus_tls.build(:language=>'zh',:name=>'我的设置菜单',:description=>'我的设置菜单',:source_lang=>'en')
    irm_my_setting_menu.menus_tls.build(:language=>'en',:name=>'My Setting Menu',:description=>'My Setting Menu',:source_lang=>'en')
    irm_my_setting_menu.save

    irm_admin_menu = Irm::Menu.new(:menu_code=>'IRM_ADMIN_MENU',:not_auto_mult=>true)
    irm_admin_menu.menus_tls.build(:language=>'zh',:name=>'管理菜单',:description=>'管理菜单',:source_lang=>'en')
    irm_admin_menu.menus_tls.build(:language=>'en',:name=>'Admin Menu',:description=>'Admin Menu',:source_lang=>'en')
    irm_admin_menu.save

    irm_advance_setting_menu = Irm::Menu.new(:menu_code=>'IRM_ADVANCE_SETTING_MENU',:icon=>'advance_settings.gif',:not_auto_mult=>true)
    irm_advance_setting_menu.menus_tls.build(:language=>'zh',:name=>'高级设置菜单',:description=>'高级设置菜单',:source_lang=>'en')
    irm_advance_setting_menu.menus_tls.build(:language=>'en',:name=>'Advance Setting Menu',:description=>'Advance Setting Menu',:source_lang=>'en')
    irm_advance_setting_menu.save


    entrance_workspace = Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',
                                              :sub_menu_code=>'IRM_WORKSPACE_MENU',
                                              :permission_code=>'IRM_NAVIGATIONS_WORKSPACE',
                                              :display_sequence=>10,
                                              :not_auto_mult=>true)
    entrance_workspace.menu_entries_tls.build(:language=>'zh',:name=>'我的工作空间',:description=>'我的工作空间',:source_lang=>'en')
    entrance_workspace.menu_entries_tls.build(:language=>'en',:name=>'My Page',:description=>'My Page',:source_lang=>'en')
    entrance_workspace.save

    entrace_admin = Irm::MenuEntry.new(:menu_code=>'IRM_ENTRANCE_MENU',
                                         :sub_menu_code=>'IRM_ADMIN_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_ADMIN',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    entrace_admin.menu_entries_tls.build(:language=>'zh',:name=>'管理',:description=>'管理',:source_lang=>'en')
    entrace_admin.menu_entries_tls.build(:language=>'en',:name=>'Admin',:description=>'Admin',:source_lang=>'en')
    entrace_admin.save

    workspace_my_page = Irm::MenuEntry.new(:menu_code=>'IRM_WORKSPACE_MENU',
                                         :sub_menu_code=>'IRM_MY_PAGE_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_MY_PAGE',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    workspace_my_page.menu_entries_tls.build(:language=>'zh',:name=>'我的页面',:description=>'我的页面',:source_lang=>'en')
    workspace_my_page.menu_entries_tls.build(:language=>'en',:name=>'My Page',:description=>'My Page',:source_lang=>'en')
    workspace_my_page.save

    workspace_my_setting = Irm::MenuEntry.new(:menu_code=>'IRM_WORKSPACE_MENU',
                                         :sub_menu_code=>'IRM_MY_SETTING_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_MY_SETTING',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    workspace_my_setting.menu_entries_tls.build(:language=>'zh',:name=>'我的设置',:description=>'我的设置',:source_lang=>'en')
    workspace_my_setting.menu_entries_tls.build(:language=>'en',:name=>'My Setting',:description=>'My Setting',:source_lang=>'en')
    workspace_my_setting.save

    admin_advance_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_ADVANCE_SETTING_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_ADVNACE_SETTIN',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    admin_advance_setting.menu_entries_tls.build(:language=>'zh',:name=>'高级设置',:description=>'高级设置',:source_lang=>'en')
    admin_advance_setting.menu_entries_tls.build(:language=>'en',:name=>'Advance Setting',:description=>'Advance Setting',:source_lang=>'en')
    admin_advance_setting.save

  end

  def self.down
  end
end
