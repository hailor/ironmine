# -*- coding: utf-8 -*-
class AddOpeCatalogPermissions < ActiveRecord::Migration
  def self.up
    irm_ope_catalogs_index = Irm::Permission.new(:permission_code=>'IRM_OPE_CATALOGS_INDEX',
                                             :page_controller=>'irm/operational_catalogs',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_ope_catalogs_index.permissions_tls.build(:language=>'zh',:name=>'服务类别',:description=>'服务类别',:source_lang=>'en')
    irm_ope_catalogs_index.permissions_tls.build(:language=>'en',:name=>'Operational Catalogs',:description=>'Operational Catalogs',:source_lang=>'en')
    irm_ope_catalogs_index.save

    irm_ope_catalogs_edit = Irm::Permission.new(:permission_code=>'IRM_OPE_CATALOGS_EDIT',
                                             :page_controller=>'irm/operational_catalogs',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_ope_catalogs_edit.permissions_tls.build(:language=>'zh',:name=>'编辑服务类别',:description=>'编辑服务类别',:source_lang=>'en')
    irm_ope_catalogs_edit.permissions_tls.build(:language=>'en',:name=>'Edit Operational Catalog',:description=>'Edit Operational Catalog',:source_lang=>'en')
    irm_ope_catalogs_edit.save

    irm_ope_catalogs_new = Irm::Permission.new(:permission_code=>'IRM_PERMISSIONS_NEW',
                                             :page_controller=>'irm/operational_catalogs',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_ope_catalogs_new.permissions_tls.build(:language=>'zh',:name=>'创建服务类别',:description=>'创建服务类别',:source_lang=>'en')
    irm_ope_catalogs_new.permissions_tls.build(:language=>'en',:name=>'Create Operational Catalog',:description=>'Create Operational Catalog',:source_lang=>'en')
    irm_ope_catalogs_new.save

  end

  def self.down
  end
end
