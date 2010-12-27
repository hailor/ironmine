# -*- coding: utf-8 -*-
class AddSiteGroupPermission < ActiveRecord::Migration
  def self.up
    irm_sites_index = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_INDEX',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_sites_index.permissions_tls.build(:language=>'zh',:name=>'设置地点',:description=>'设置地点',:source_lang=>'en')
    irm_sites_index.permissions_tls.build(:language=>'en',:name=>'Site',:description=>'Site',:source_lang=>'en')
    irm_sites_index.save

    irm_sites_new = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_NEW',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_sites_new.permissions_tls.build(:language=>'zh',:name=>'新建地点',:description=>'新建地点',:source_lang=>'en')
    irm_sites_new.permissions_tls.build(:language=>'en',:name=>'New Site',:description=>'New Site',:source_lang=>'en')
    irm_sites_new.save

    irm_sites_edit = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_EDIT',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_sites_edit.permissions_tls.build(:language=>'zh',:name=>'编辑地点',:description=>'编辑地点',:source_lang=>'en')
    irm_sites_edit.permissions_tls.build(:language=>'en',:name=>'Edit Site',:description=>'Edit Site',:source_lang=>'en')
    irm_sites_edit.save

    irm_sites_create = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_CREATE',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_sites_create.permissions_tls.build(:language=>'zh',:name=>'保存地点',:description=>'保存地点',:source_lang=>'en')
    irm_sites_create.permissions_tls.build(:language=>'en',:name=>'Create Site',:description=>'Create Site',:source_lang=>'en')
    irm_sites_create.save

    irm_sites_update = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_UPDATE',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_sites_update.permissions_tls.build(:language=>'zh',:name=>'更新地点',:description=>'更新地点',:source_lang=>'en')
    irm_sites_update.permissions_tls.build(:language=>'en',:name=>'Update Site',:description=>'Update Site',:source_lang=>'en')
    irm_sites_update.save

    irm_sites_lang_edit = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_LANG_EDIT',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_sites_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑地点多语言',:description=>'编辑地点多语言',:source_lang=>'en')
    irm_sites_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Site Multilingual',:description=>'Edit Site Multilingual',:source_lang=>'en')
    irm_sites_lang_edit.save


    irm_sites_lang_update = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_LANG_UPDATE',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_sites_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新地点多语言',:description=>'更新地点多语言',:source_lang=>'en')
    irm_sites_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Site Multilingual',:description=>'Update Site Multilingual',:source_lang=>'en')
    irm_sites_lang_update.save

    irm_sites_get_data = Irm::Permission.new(:permission_code=>'IRM_SITE_GROUP_GET_DATA',
                                                   :page_controller=>'irm/site_groups',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_sites_get_data.permissions_tls.build(:language=>'zh',:name=>'获取地点',:description=>'获取地点',:source_lang=>'en')
    irm_sites_get_data.permissions_tls.build(:language=>'en',:name=>'Get Site',:description=>'Get Site',:source_lang=>'en')
  end

  def self.down
  end
end
