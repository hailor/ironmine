# -*- coding: utf-8 -*-
class AddRegionsPermissions < ActiveRecord::Migration
  def self.up
    irm_regions_index = Irm::Permission.new(:permission_code=>'IRM_REGIONS_INDEX',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_regions_index.permissions_tls.build(:language=>'zh',:name=>'设置区域',:description=>'设置区域',:source_lang=>'en')
    irm_regions_index.permissions_tls.build(:language=>'en',:name=>'Region',:description=>'Region',:source_lang=>'en')
    irm_regions_index.save

    irm_regions_new = Irm::Permission.new(:permission_code=>'IRM_REGIONS_NEW',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_regions_new.permissions_tls.build(:language=>'zh',:name=>'新建区域',:description=>'新建区域',:source_lang=>'en')
    irm_regions_new.permissions_tls.build(:language=>'en',:name=>'New Region',:description=>'New Region',:source_lang=>'en')
    irm_regions_new.save

    irm_regions_edit = Irm::Permission.new(:permission_code=>'IRM_REGIONS_EDIT',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_regions_edit.permissions_tls.build(:language=>'zh',:name=>'编辑区域',:description=>'编辑区域',:source_lang=>'en')
    irm_regions_edit.permissions_tls.build(:language=>'en',:name=>'Edit Region',:description=>'Edit Region',:source_lang=>'en')
    irm_regions_edit.save

    irm_regions_create = Irm::Permission.new(:permission_code=>'IRM_REGIONS_CREATE',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_regions_create.permissions_tls.build(:language=>'zh',:name=>'保存区域',:description=>'保存区域',:source_lang=>'en')
    irm_regions_create.permissions_tls.build(:language=>'en',:name=>'Create Region',:description=>'Create Region',:source_lang=>'en')
    irm_regions_create.save

    irm_regions_update = Irm::Permission.new(:permission_code=>'IRM_REGIONS_UPDATE',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_regions_update.permissions_tls.build(:language=>'zh',:name=>'更新区域',:description=>'更新区域',:source_lang=>'en')
    irm_regions_update.permissions_tls.build(:language=>'en',:name=>'Update Region',:description=>'Update Region',:source_lang=>'en')
    irm_regions_update.save

    irm_regions_lang_edit = Irm::Permission.new(:permission_code=>'IRM_REGIONS_LANG_EDIT',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_regions_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑区域多语言',:description=>'编辑区域多语言',:source_lang=>'en')
    irm_regions_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Region Multilingual',:description=>'Edit Region Multilingual',:source_lang=>'en')
    irm_regions_lang_edit.save


    irm_regions_lang_update = Irm::Permission.new(:permission_code=>'IRM_REGIONS_LANG_UPDATE',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_regions_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新区域多语言',:description=>'更新区域多语言',:source_lang=>'en')
    irm_regions_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Region Multilingual',:description=>'Update Region Multilingual',:source_lang=>'en')
    irm_regions_lang_update.save

    irm_regions_get_data = Irm::Permission.new(:permission_code=>'IRM_REGIONS_GET_DATA',
                                                   :page_controller=>'irm/regions',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_regions_get_data.permissions_tls.build(:language=>'zh',:name=>'获取区域',:description=>'获取区域',:source_lang=>'en')
    irm_regions_get_data.permissions_tls.build(:language=>'en',:name=>'Get Region',:description=>'Get Region',:source_lang=>'en')
    irm_regions_get_data.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/regions")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
