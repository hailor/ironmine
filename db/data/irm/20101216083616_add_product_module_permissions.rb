# -*- coding: utf-8 -*-
class AddProductModulePermissions < ActiveRecord::Migration
  def self.up
    irm_prodcut_modules_index = Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_INDEX',
                                             :page_controller=>'irm/product_modules',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_prodcut_modules_index.permissions_tls.build(:language=>'zh',:name=>'产品模块',:description=>'产品模块',:source_lang=>'en')
    irm_prodcut_modules_index.permissions_tls.build(:language=>'en',:name=>'Product Modules',:description=>'Product Modules',:source_lang=>'en')
    irm_prodcut_modules_index.save

    irm_prodcut_modules_edit = Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_EDIT',
                                             :page_controller=>'irm/product_modules',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_prodcut_modules_edit.permissions_tls.build(:language=>'zh',:name=>'编辑产品模块',:description=>'编辑产品模块',:source_lang=>'en')
    irm_prodcut_modules_edit.permissions_tls.build(:language=>'en',:name=>'Edit Product Module',:description=>'Edit Product Module',:source_lang=>'en')
    irm_prodcut_modules_edit.save

    irm_prodcut_modules_new = Irm::Permission.new(:permission_code=>'IRM_PRODUCT_MODULES_NEW',
                                             :page_controller=>'irm/product_modules',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_prodcut_modules_new.permissions_tls.build(:language=>'zh',:name=>'创建产品模块',:description=>'创建产品模块',:source_lang=>'en')
    irm_prodcut_modules_new.permissions_tls.build(:language=>'en',:name=>'Create Product Module',:description=>'Create Product Module',:source_lang=>'en')
    irm_prodcut_modules_new.save
  end

  def self.down
  end
end
