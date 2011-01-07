# -*- coding: utf-8 -*-
class InitSiteToMenu < ActiveRecord::Migration
    def self.up
    irm_sites_index = Irm::Permission.new(:permission_code=>'IRM_SITE_INDEX',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_sites_index.permissions_tls.build(:language=>'zh',:name=>'设置地点',:description=>'设置地点',:source_lang=>'en')
    irm_sites_index.permissions_tls.build(:language=>'en',:name=>'Site',:description=>'Site',:source_lang=>'en')
    irm_sites_index.save

    irm_sites_new = Irm::Permission.new(:permission_code=>'IRM_SITE_NEW',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_sites_new.permissions_tls.build(:language=>'zh',:name=>'新建地点',:description=>'新建地点',:source_lang=>'en')
    irm_sites_new.permissions_tls.build(:language=>'en',:name=>'New Site',:description=>'New Site',:source_lang=>'en')
    irm_sites_new.save

    irm_sites_edit = Irm::Permission.new(:permission_code=>'IRM_SITE_EDIT',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_sites_edit.permissions_tls.build(:language=>'zh',:name=>'编辑地点',:description=>'编辑地点',:source_lang=>'en')
    irm_sites_edit.permissions_tls.build(:language=>'en',:name=>'Edit Site',:description=>'Edit Site',:source_lang=>'en')
    irm_sites_edit.save

    irm_sites_create = Irm::Permission.new(:permission_code=>'IRM_SITE_CREATE',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_sites_create.permissions_tls.build(:language=>'zh',:name=>'保存地点',:description=>'保存地点',:source_lang=>'en')
    irm_sites_create.permissions_tls.build(:language=>'en',:name=>'Create Site',:description=>'Create Site',:source_lang=>'en')
    irm_sites_create.save

    irm_sites_update = Irm::Permission.new(:permission_code=>'IRM_SITE_UPDATE',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_sites_update.permissions_tls.build(:language=>'zh',:name=>'更新地点',:description=>'更新地点',:source_lang=>'en')
    irm_sites_update.permissions_tls.build(:language=>'en',:name=>'Update Site',:description=>'Update Site',:source_lang=>'en')
    irm_sites_update.save

    irm_sites_lang_edit = Irm::Permission.new(:permission_code=>'IRM_SITE_LANG_EDIT',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_sites_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑地点多语言',:description=>'编辑地点多语言',:source_lang=>'en')
    irm_sites_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Site Multilingual',:description=>'Edit Site Multilingual',:source_lang=>'en')
    irm_sites_lang_edit.save


    irm_sites_lang_update = Irm::Permission.new(:permission_code=>'IRM_SITE_LANG_UPDATE',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_sites_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新地点多语言',:description=>'更新地点多语言',:source_lang=>'en')
    irm_sites_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Site Multilingual',:description=>'Update Site Multilingual',:source_lang=>'en')
    irm_sites_lang_update.save

    irm_sites_get_data = Irm::Permission.new(:permission_code=>'IRM_SITE_GET_DATA',
                                                   :page_controller=>'irm/sites',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_sites_get_data.permissions_tls.build(:language=>'zh',:name=>'获取地点',:description=>'获取地点',:source_lang=>'en')
    irm_sites_get_data.permissions_tls.build(:language=>'en',:name=>'Get Site',:description=>'Get Site',:source_lang=>'en')
    irm_sites_get_data.save


    site_group_menu_entry = Irm::MenuEntry.query_by_menu_code("IRM_ORGANIZATION_MENU").
                                         query_by_permission_code("IRM_SITE_GROUP_INDEX").first

    site_group_menu_entries_tl =  Irm::MenuEntriesTl.query_by_menu_entry_id(site_group_menu_entry.id).
                                        query_by_language('zh').first
    site_group_menu_entries_tl.update_attributes({:name=>'地点组'})    
      
    organization_site = Irm::MenuEntry.new(:menu_code=>'IRM_ORGANIZATION_MENU',
                                         :permission_code=>'IRM_SITE_INDEX',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    organization_site.menu_entries_tls.build(:language=>'zh',:name=>'地点',:description=>'地点',:source_lang=>'en')
    organization_site.menu_entries_tls.build(:language=>'en',:name=>'Sites',:description=>'Sites',:source_lang=>'en')
    organization_site.save
  end

  def self.down
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/sites")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
