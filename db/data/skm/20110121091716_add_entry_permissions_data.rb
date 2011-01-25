# -*- coding: utf-8 -*-
class AddEntryPermissionsData < ActiveRecord::Migration
  def self.up
    soc_skm_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_SKM_MENU',:not_auto_mult=>true)
    soc_skm_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心知识库菜单',:description=>'服务运营中心知识库菜单',:source_lang=>'en')
    soc_skm_menu.menus_tls.build(:language=>'en',:name=>'SOC Knowledge Base Menu',:description=>'SOC Knowledge Base Menu',:source_lang=>'en')
    soc_skm_menu.save

    soc_skm = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_SKM_MENU',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    soc_skm.menu_entries_tls.build(:language=>'zh',:name=>'知识库',:description=>'知识库',:source_lang=>'en')
    soc_skm.menu_entries_tls.build(:language=>'en',:name=>'Knowledge Base',:description=>'Knowledge Base',:source_lang=>'en')
    soc_skm.save

    soc_skm_index = Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SKM_MENU',
                                        :permission_code => 'SKM_ENTRY_HEADERS_INDEX',
                                         :display_sequence=>10,
                                         :not_auto_mult=>true)
    soc_skm_index.menu_entries_tls.build(:language=>'zh',:name=>'知识库',:description=>'知识库',:source_lang=>'en')
    soc_skm_index.menu_entries_tls.build(:language=>'en',:name=>'Knowledge Base',:description=>'Knowledge Base',:source_lang=>'en')
    soc_skm_index.save

    skm_header_new = Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_NEW',
                                             :page_controller=>'skm/entry_headers',
                                             :page_action=>'new',
                                             :not_auto_mult=>true)
    skm_header_new.permissions_tls.build(:language=>'zh',:name=>'创建知识库文章',:description=>'创建知识库文章',:source_lang=>'en')
    skm_header_new.permissions_tls.build(:language=>'en',:name=>'Create SKM Entries',:description=>'Create SKM Entries Index',:source_lang=>'en')
    skm_header_new.save

    skm_header_edit = Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_EDIT',
                                             :page_controller=>'skm/entry_headers',
                                             :page_action=>'edit',
                                             :not_auto_mult=>true)
    skm_header_edit.permissions_tls.build(:language=>'zh',:name=>'编辑知识库文章',:description=>'编辑知识库文章',:source_lang=>'en')
    skm_header_edit.permissions_tls.build(:language=>'en',:name=>'Edit SKM Entries',:description=>'Edit SKM Entries',:source_lang=>'en')
    skm_header_edit.save

    skm_header_show = Irm::Permission.new(:permission_code=>'SKM_ENTRY_HEADERS_SHOW',
                                             :page_controller=>'skm/entry_headers',
                                             :page_action=>'show',
                                             :not_auto_mult=>true)
    skm_header_show.permissions_tls.build(:language=>'zh',:name=>'查看知识库文章首页',:description=>'查看知识库文章',:source_lang=>'en')
    skm_header_show.permissions_tls.build(:language=>'en',:name=>'Show SKM Entries',:description=>'Show SKM Entries',:source_lang=>'en')
    skm_header_show.save       
  end

  def self.down
  end
end
