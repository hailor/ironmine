# -*- coding: utf-8 -*-
class AddAdminMenu < ActiveRecord::Migration
  def self.up
    irm_navigations_base_setting = Irm::Permission.new(:permission_code=>'IRM_NAVIGATIONS_BASE_SETTIN',
                                             :page_controller=>'irm/navigations',
                                             :page_action=>'base_setting',
                                             :not_auto_mult=>true)
    irm_navigations_base_setting.permissions_tls.build(:language=>'zh',:name=>'基础设置',:description=>'基础设置',:source_lang=>'en')
    irm_navigations_base_setting.permissions_tls.build(:language=>'en',:name=>'Base Setting',:description=>'Base Setting',:source_lang=>'en')
    irm_navigations_base_setting.save

    irm_base_setting_menu = Irm::Menu.new(:menu_code=>'IRM_BASE_SETTING_MENU',:icon=>'base_settings.gif',:not_auto_mult=>true)
    irm_base_setting_menu.menus_tls.build(:language=>'zh',:name=>'基础设置菜单',:description=>'基础设置菜单',:source_lang=>'en')
    irm_base_setting_menu.menus_tls.build(:language=>'en',:name=>'Base Setting Menu',:description=>'Base Setting Menu',:source_lang=>'en')
    irm_base_setting_menu.save

    admin_base_setting = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'IRM_BASE_SETTING_MENU',
                                         :permission_code=>'IRM_NAVIGATIONS_BASE_SETTIN',
                                         :display_sequence=>5,
                                         :not_auto_mult=>true)
    admin_base_setting.menu_entries_tls.build(:language=>'zh',:name=>'基础设置',:description=>'高级设置',:source_lang=>'en')
    admin_base_setting.menu_entries_tls.build(:language=>'en',:name=>'Advance Setting',:description=>'Advance Setting',:source_lang=>'en')
    admin_base_setting.save


    irm_organization_menu = Irm::Menu.new(:menu_code=>'IRM_ORGANIZATION_MENU',:not_auto_mult=>true)
    irm_organization_menu.menus_tls.build(:language=>'zh',:name=>'组织结构菜单',:description=>'组织结构菜单',:source_lang=>'en')
    irm_organization_menu.menus_tls.build(:language=>'en',:name=>'Organizational Structure Menu',:description=>'Organizational Structure Menu',:source_lang=>'en')
    irm_organization_menu.save

    baseset_organization = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_ORGANIZATION_MENU',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    baseset_organization.menu_entries_tls.build(:language=>'zh',:name=>'组织结构',:description=>'组织结构',:source_lang=>'en')
    baseset_organization.menu_entries_tls.build(:language=>'en',:name=>'Organizational Structure',:description=>'Organizational Structure',:source_lang=>'en')
    baseset_organization.save

    irm_permission_menu = Irm::Menu.new(:menu_code=>'IRM_PERMISSION_MENU',:not_auto_mult=>true)
    irm_permission_menu.menus_tls.build(:language=>'zh',:name=>'权限菜单',:description=>'权限菜单',:source_lang=>'en')
    irm_permission_menu.menus_tls.build(:language=>'en',:name=>'Permission Menu',:description=>'Permission Menu',:source_lang=>'en')
    irm_permission_menu.save

    baseset_permission = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_PERMISSION_MENU',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    baseset_permission.menu_entries_tls.build(:language=>'zh',:name=>'权限',:description=>'权限',:source_lang=>'en')
    baseset_permission.menu_entries_tls.build(:language=>'en',:name=>'Permission',:description=>'Permission',:source_lang=>'en')
    baseset_permission.save

    irm_public_menu = Irm::Menu.new(:menu_code=>'IRM_PUBLIC_MENU',:not_auto_mult=>true)
    irm_public_menu.menus_tls.build(:language=>'zh',:name=>'公共菜单',:description=>'公共菜单',:source_lang=>'en')
    irm_public_menu.menus_tls.build(:language=>'en',:name=>'Public Menu',:description=>'Public Menu',:source_lang=>'en')
    irm_public_menu.save

    baseset_public = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_PUBLIC_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    baseset_public.menu_entries_tls.build(:language=>'zh',:name=>'公共',:description=>'公共',:source_lang=>'en')
    baseset_public.menu_entries_tls.build(:language=>'en',:name=>'Public',:description=>'Public',:source_lang=>'en')
    baseset_public.save

    irm_category_menu = Irm::Menu.new(:menu_code=>'IRM_CATEGORY_MENU',:not_auto_mult=>true)
    irm_category_menu.menus_tls.build(:language=>'zh',:name=>'分类菜单',:description=>'分类菜单',:source_lang=>'en')
    irm_category_menu.menus_tls.build(:language=>'en',:name=>'Category Menu',:description=>'Category Menu',:source_lang=>'en')
    irm_category_menu.save

    baseset_category = Irm::MenuEntry.new(:menu_code=>'IRM_BASE_SETTING_MENU',
                                         :sub_menu_code=>'IRM_CATEGORY_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    baseset_category.menu_entries_tls.build(:language=>'zh',:name=>'分类',:description=>'分类',:source_lang=>'en')
    baseset_category.menu_entries_tls.build(:language=>'en',:name=>'Category',:description=>'Category',:source_lang=>'en')
    baseset_category.save    



  end

  def self.down
  end
end
