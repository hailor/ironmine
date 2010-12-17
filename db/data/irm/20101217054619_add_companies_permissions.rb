# -*- coding: utf-8 -*-
class AddCompaniesPermissions < ActiveRecord::Migration
  def self.up
    irm_companies_index = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_INDEX',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_companies_index.permissions_tls.build(:language=>'zh',:name=>'设置公司',:description=>'设置公司',:source_lang=>'en')
    irm_companies_index.permissions_tls.build(:language=>'en',:name=>'Company',:description=>'Company',:source_lang=>'en')
    irm_companies_index.save

    irm_companies_new = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_NEW',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_companies_new.permissions_tls.build(:language=>'zh',:name=>'新建公司',:description=>'新建公司',:source_lang=>'en')
    irm_companies_new.permissions_tls.build(:language=>'en',:name=>'New Company',:description=>'New Company',:source_lang=>'en')
    irm_companies_new.save

    irm_companies_edit = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_EDIT',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_companies_edit.permissions_tls.build(:language=>'zh',:name=>'编辑公司',:description=>'编辑公司',:source_lang=>'en')
    irm_companies_edit.permissions_tls.build(:language=>'en',:name=>'Edit Company',:description=>'Edit Company',:source_lang=>'en')
    irm_companies_edit.save

    irm_companies_create = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_CREATE',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_companies_create.permissions_tls.build(:language=>'zh',:name=>'保存公司',:description=>'保存公司',:source_lang=>'en')
    irm_companies_create.permissions_tls.build(:language=>'en',:name=>'Create Company',:description=>'Create Company',:source_lang=>'en')
    irm_companies_create.save

    irm_companies_update = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_UPDATE',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_companies_update.permissions_tls.build(:language=>'zh',:name=>'更新公司',:description=>'更新公司',:source_lang=>'en')
    irm_companies_update.permissions_tls.build(:language=>'en',:name=>'Update Company',:description=>'Update Company',:source_lang=>'en')
    irm_companies_update.save

    irm_companies_lang_edit = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_LANG_EDIT',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'multilingual_edit',
                                                   :not_auto_mult=>true)
    irm_companies_lang_edit.permissions_tls.build(:language=>'zh',:name=>'编辑公司多语言',:description=>'编辑公司多语言',:source_lang=>'en')
    irm_companies_lang_edit.permissions_tls.build(:language=>'en',:name=>'Edit Company Multilingual',:description=>'Edit Company Multilingual',:source_lang=>'en')
    irm_companies_lang_edit.save


    irm_companies_lang_update = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_LANG_UPDATE',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'multilingual_update',
                                                   :not_auto_mult=>true)
    irm_companies_lang_update.permissions_tls.build(:language=>'zh',:name=>'更新公司多语言',:description=>'更新公司多语言',:source_lang=>'en')
    irm_companies_lang_update.permissions_tls.build(:language=>'en',:name=>'Update Company Multilingual',:description=>'Update Company Multilingual',:source_lang=>'en')
    irm_companies_lang_update.save

    irm_companies_get_data = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_GET_DATA',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_companies_get_data.permissions_tls.build(:language=>'zh',:name=>'获取公司',:description=>'获取公司',:source_lang=>'en')
    irm_companies_get_data.permissions_tls.build(:language=>'en',:name=>'Get Company',:description=>'Get Company',:source_lang=>'en')
    irm_companies_get_data.save

    irm_companies_base_info = Irm::Permission.new(:permission_code=>'IRM_COMPANIES_BASE_INFO',
                                                   :page_controller=>'irm/companies',
                                                   :page_action=>'base_info',
                                                   :not_auto_mult=>true)
    irm_companies_base_info.permissions_tls.build(:language=>'zh',:name=>'获取公司的组织',:description=>'获取公司的组织',:source_lang=>'en')
    irm_companies_base_info.permissions_tls.build(:language=>'en',:name=>'Get Organization From Company',:description=>'Get Organization From Company',:source_lang=>'en')
    irm_companies_base_info.save
  end

  def self.down
    #
    lookup_types_permissions=Irm::Permission.query_by_page_controller("irm/companies")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
