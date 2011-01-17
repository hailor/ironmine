# -*- coding: utf-8 -*-
class AddEntryTemplatesMenuAndPermissionData < ActiveRecord::Migration
  def self.up
    skm_product = Irm::ProductModule.new({:product_short_name=>"SKM",:installed_flag=>"Y",:not_auto_mult=>true})
    skm_product.product_modules_tls.build({:name=>"Service Knowledge Manager",
                                    :description=>"Service Knowledge Manager",
                                    :language=>"en",
                                    :source_lang=>"en"})
    skm_product.product_modules_tls.build({:name=>"知识库模块",
                                    :description=>"知识库模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    skm_product.save
    
    skm_template_index = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_INDEX',
                                             :page_controller=>'skm/entry_templates',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    skm_template_index.permissions_tls.build(:language=>'zh',:name=>'知识库模板首页',:description=>'知识库模板首页',:source_lang=>'en')
    skm_template_index.permissions_tls.build(:language=>'en',:name=>'SKM Entry Template Index',:description=>'SKM Template Index',:source_lang=>'en')
    skm_template_index.save

    skm_template_edit = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_EDIT',
                                             :page_controller=>'skm/entry_templates',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    skm_template_edit.permissions_tls.build(:language=>'zh',:name=>'编辑知识库模板',:description=>'编辑知识库模板',:source_lang=>'en')
    skm_template_edit.permissions_tls.build(:language=>'en',:name=>'Edit SKM Entry Template',:description=>'Edit SKM Entry Template',:source_lang=>'en')
    skm_template_edit.save

    skm_template_new = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_NEW',
                                             :page_controller=>'skm/entry_templates',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    skm_template_new.permissions_tls.build(:language=>'zh',:name=>'创建知识库模板',:description=>'创建知识库模板', :source_lang=>'en')
    skm_template_new.permissions_tls.build(:language=>'en',:name=>'Create SKM Entry Template',:description=>'Create SKM Entry Templates', :source_lang=>'en')
    skm_template_new.save

    skm_template_show = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_SHOW',
                                             :page_controller=>'skm/entry_templates',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    skm_template_show.permissions_tls.build(:language=>'zh',:name=>'查看知识库模板',:description=>'查看知识库模板', :source_lang=>'en')
    skm_template_show.permissions_tls.build(:language=>'en',:name=>'Show SKM Entry Template',:description=>'Show SKM Entry Template', :source_lang=>'en')
    skm_template_show.save
################################################################################################################################################################################################
    skm_status_index = Irm::Permission.new(:permission_code=>'SKM_ENTRY_STA_INDEX',
                                         :page_controller=>'skm/entry_statuses',
                                         :page_action=>'index',
                                         :not_auto_mult=>true)
    skm_status_index.permissions_tls.build(:language=>'zh',:name=>'知识库文章状态首页',:description=>'知识库文章状态首页',:source_lang=>'en')
    skm_status_index.permissions_tls.build(:language=>'en',:name=>'SKM Entry Status Index',:description=>'SKM Entry Status Index',:source_lang=>'en')
    skm_status_index.save

    skm_status_edit = Irm::Permission.new(:permission_code=>'SKM_ENTRY_STA_EDIT',
                                         :page_controller=>'skm/entry_statuses',
                                         :page_action=>'edit',
                                         :not_auto_mult=>true)
    skm_status_edit.permissions_tls.build(:language=>'zh',:name=>'编辑知识库文章状态',:description=>'编辑知识库文章状态',:source_lang=>'en')
    skm_status_edit.permissions_tls.build(:language=>'en',:name=>'Edit SKM Entry Status',:description=>'Edit SKM Entry Status',:source_lang=>'en')
    skm_status_edit.save

    skm_status_new = Irm::Permission.new(:permission_code=>'SKM_ENTRY_STA_NEW',
                                         :page_controller=>'skm/entry_statuses',
                                         :page_action=>'new',
                                         :not_auto_mult=>true)
    skm_status_new.permissions_tls.build(:language=>'zh',:name=>'创建知识库文章状态',:description=>'创建知识库文章状态', :source_lang=>'en')
    skm_status_new.permissions_tls.build(:language=>'en',:name=>'Create SKM Entry Status',:description=>'Create SKM Entry Status', :source_lang=>'en')
    skm_status_new.save

    skm_status_show = Irm::Permission.new(:permission_code=>'SKM_ENTRY_STA_SHOW',
                                         :page_controller=>'skm/entry_statuses',
                                         :page_action=>'show',
                                         :not_auto_mult=>true)
    skm_status_show.permissions_tls.build(:language=>'zh',:name=>'查看知识库文章状态',:description=>'查看知识库文章状态', :source_lang=>'en')
    skm_status_show.permissions_tls.build(:language=>'en',:name=>'Show SKM Entry Status',:description=>'Show SKM Entry Status', :source_lang=>'en')
    skm_status_show.save
################################################################################################################################################################################################
    skm_tem_ele_index = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_ELE_INDEX',
                                             :page_controller=>'skm/entry_template_elements',
                                             :page_action=>'index',
                                             :not_auto_mult=>true)
    skm_tem_ele_index.permissions_tls.build(:language=>'zh',:name=>'知识库模板元素首页',:description=>'知识库模板元素首页',:source_lang=>'en')
    skm_tem_ele_index.permissions_tls.build(:language=>'en',:name=>'SKM Entry Template Elements Index',:description=>'SKM Entry Template Elements Index',:source_lang=>'en')
    skm_tem_ele_index.save

    skm_tem_ele_edit = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_ELE_EDIT',
                                             :page_controller=>'skm/entry_template_elements',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    skm_tem_ele_edit.permissions_tls.build(:language=>'zh',:name=>'编辑知识库模板元素',:description=>'编辑知识库模板元素',:source_lang=>'en')
    skm_tem_ele_edit.permissions_tls.build(:language=>'en',:name=>'Edit SKM Entry Template Element',:description=>'Edit SKM Entry Template Element',:source_lang=>'en')
    skm_tem_ele_edit.save

    skm_tem_ele_new = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_ELE_NEW',
                                             :page_controller=>'skm/entry_template_elements',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    skm_tem_ele_new.permissions_tls.build(:language=>'zh',:name=>'创建知识库模板元素',:description=>'创建知识库模板元素', :source_lang=>'en')
    skm_tem_ele_new.permissions_tls.build(:language=>'en',:name=>'Create SKM Entry Template Element',:description=>'Create SKM Entry Template Element', :source_lang=>'en')
    skm_tem_ele_new.save

    skm_tem_ele_show = Irm::Permission.new(:permission_code=>'SKM_ENTRY_TEM_ELE_SHOW',
                                             :page_controller=>'skm/entry_template_elements',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    skm_tem_ele_show.permissions_tls.build(:language=>'zh',:name=>'查看知识库模板元素',:description=>'查看知识库模板元素', :source_lang=>'en')
    skm_tem_ele_show.permissions_tls.build(:language=>'en',:name=>'Show SKM Entry Template Element',:description=>'Show SKM Entry Template Element', :source_lang=>'en')
    skm_tem_ele_show.save
################################################################################################################################################################################################

    skm_menu = Irm::Menu.new(:menu_code => 'SKM_SETTING_MENU',:not_auto_mult=>true)
    skm_menu.menus_tls.build(:language => 'zh', :name => '知识库', :description => "知识库", :source_lang => 'en')
    skm_menu.menus_tls.build(:language => 'en', :name => 'Service Knowledge Manager', :description => 'Service Knowledge Manager', :source_lang => 'en')
    skm_menu.save
    
    skm_menu_entry = Irm::MenuEntry.new(:menu_code=>'IRM_ADMIN_MENU',
                                         :sub_menu_code=>'SKM_SETTING_MENU',
                                         :display_sequence=>60,
                                         :not_auto_mult=>true)
    skm_menu_entry.menu_entries_tls.build(:language=>'zh',:name=>'知识库',:description=>'知识库',:source_lang=>'en')
    skm_menu_entry.menu_entries_tls.build(:language=>'en',:name=>'Service Knowledge Manager',:description=>'Service Knowledge Manager',:source_lang=>'en')
    skm_menu_entry.save

    skm_template_index_page = Irm::MenuEntry.new(:menu_code=>'SKM_SETTING_MENU',
                                         :permission_code=>'SKM_ENTRY_TEM_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    skm_template_index_page.menu_entries_tls.build(:language=>'zh',:name=>'知识库文章模板',:description=>'知识库文章模板',:source_lang=>'en')
    skm_template_index_page.menu_entries_tls.build(:language=>'en',:name=>'SKM Entry Templates',:description=>'SKM Entry Templates',:source_lang=>'en')
    skm_template_index_page.save

    skm_status_index_page = Irm::MenuEntry.new(:menu_code=>'SKM_SETTING_MENU',
                                         :permission_code=>'SKM_ENTRY_STA_INDEX',
                                         :display_sequence=>20,
                                         :not_auto_mult=>true)
    skm_status_index_page.menu_entries_tls.build(:language=>'zh',:name=>'知识库文章状态',:description=>'知识库文章状态',:source_lang=>'en')
    skm_status_index_page.menu_entries_tls.build(:language=>'en',:name=>'SKM Entry Statuses',:description=>'SKM Entry Statuses',:source_lang=>'en')
    skm_status_index_page.save

    skm_ele_index_page = Irm::MenuEntry.new(:menu_code=>'SKM_SETTING_MENU',
                                         :permission_code=>'SKM_ENTRY_TEM_ELE_INDEX',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    skm_ele_index_page.menu_entries_tls.build(:language=>'zh',:name=>'知识库模板元素',:description=>'知识库模板元素',:source_lang=>'en')
    skm_ele_index_page.menu_entries_tls.build(:language=>'en',:name=>'SKM Entry Template Elements',:description=>'SKM Entry Template Elements',:source_lang=>'en')
    skm_ele_index_page.save       
  end

  def self.down
  end
end
