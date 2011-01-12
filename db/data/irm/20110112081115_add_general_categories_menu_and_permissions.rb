# -*- coding: utf-8 -*-
class AddGeneralCategoriesMenuAndPermissions < ActiveRecord::Migration
  def self.up
    irm_cate_index = Irm::Permission.new(:permission_code=>'IRM_GEN_CATEGORY_INDEX',
                                             :page_controller=>'irm/general_categories',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    irm_cate_index.permissions_tls.build(:language=>'zh',:name=>'公共分类首页',:description=>'公共分类首页',:source_lang=>'en')
    irm_cate_index.permissions_tls.build(:language=>'en',:name=>'General Categories Index',:description=>'General Categories Index',:source_lang=>'en')
    irm_cate_index.save

    irm_cate_new = Irm::Permission.new(:permission_code=>'IRM_GEN_CATEGORY_NEW',
                                             :page_controller=>'irm/general_categories',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    irm_cate_new.permissions_tls.build(:language=>'zh',:name=>'创建公共分类',:description=>'创建公共分类',:source_lang=>'en')
    irm_cate_new.permissions_tls.build(:language=>'en',:name=>'Create General Category',:description=>'Create General Category',:source_lang=>'en')
    irm_cate_new.save

    irm_cate_edit = Irm::Permission.new(:permission_code=>'IRM_GEN_CATEGORY_EDIT',
                                             :page_controller=>'irm/general_categories',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    irm_cate_edit.permissions_tls.build(:language=>'zh',:name=>'编辑公共分类',:description=>'编辑公共分类',:source_lang=>'en')
    irm_cate_edit.permissions_tls.build(:language=>'en',:name=>'Edit General Category',:description=>'Edit General Category',:source_lang=>'en')
    irm_cate_edit.save

    irm_cate_show = Irm::Permission.new(:permission_code=>'IRM_GEN_CATEGORY_SHOW',
                                             :page_controller=>'irm/general_categories',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    irm_cate_show.permissions_tls.build(:language=>'zh',:name=>'查看公共分类',:description=>'查看公共分类',:source_lang=>'en')
    irm_cate_show.permissions_tls.build(:language=>'en',:name=>'Show General Category',:description=>'Show General Category',:source_lang=>'en')
    irm_cate_show.save

    cate_index_page = Irm::MenuEntry.new(:menu_code=>'IRM_COMMON_SETTING_MENU',
                                         :permission_code=>'IRM_GEN_CATEGORY_INDEX',
                                         :display_sequence=>35,
                                         :not_auto_mult=>true)
    cate_index_page.menu_entries_tls.build(:language=>'zh',:name=>'设置公共分类',:description=>'设置公共分类',:source_lang=>'en')
    cate_index_page.menu_entries_tls.build(:language=>'en',:name=>'Set General Categories',:description=>'Set General Categories',:source_lang=>'en')
    cate_index_page.save
  end

  def self.down
  end
end
