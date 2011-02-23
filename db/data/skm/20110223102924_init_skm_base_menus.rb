class InitSkmBaseMenus < ActiveRecord::Migration
  def self.up
    skm_irm_soc_service_knowledge_menu= Irm::Menu.new(:menu_code=>'IRM_SOC_SERVICE_KNOWLEDGE_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_irm_soc_service_knowledge_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'SOC知识库',:description=>'SOC知识库')
    skm_irm_soc_service_knowledge_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'SOC service knowledge',:description=>'SOC service knowledge')
    skm_irm_soc_service_knowledge_menu.save
    skm_skm_admin_general_menu= Irm::Menu.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_skm_admin_general_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库一般设置',:description=>'知识库一般设置')
    skm_skm_admin_general_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge general',:description=>'Service knowledge general')
    skm_skm_admin_general_menu.save
    skm_skm_admin_menu= Irm::Menu.new(:menu_code=>'SKM_ADMIN_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    skm_skm_admin_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理',:description=>'知识库管理菜单')
    skm_skm_admin_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge admin',:description=>'Service knowledge admin')
    skm_skm_admin_menu.save

    skm_menu_entiry_49= Irm::MenuEntry.new(:menu_code=>'IRM_SYSTEM_SETTING_MENU',:sub_menu_code=>'SKM_ADMIN_MENU',:permission_code=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_49.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理',:description=>'知识库管理')
    skm_menu_entiry_49.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge admin',:description=>'Service knowledge admin')
    skm_menu_entiry_49.save
    skm_menu_entiry_50= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_MENU',:sub_menu_code=>'SKM_ADMIN_GENERAL_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_50.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'一般设置',:description=>'一般设置')
    skm_menu_entiry_50.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'General setting',:description=>'General setting')
    skm_menu_entiry_50.save
    skm_menu_entiry_51= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:permission_code=>'SKM_ENTRY_STATUSES_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_51.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库状态',:description=>'知识库状态')
    skm_menu_entiry_51.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry status',:description=>'Entry status')
    skm_menu_entiry_51.save
    skm_menu_entiry_52= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:permission_code=>'SKM_ENTRY_TEMPLATES_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_52.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库模板',:description=>'知识库模板')
    skm_menu_entiry_52.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry template',:description=>'Entry template')
    skm_menu_entiry_52.save
    skm_menu_entiry_53= Irm::MenuEntry.new(:menu_code=>'SKM_ADMIN_GENERAL_MENU',:sub_menu_code=>nil,:permission_code=>'SKM_ENTRY_TEMPLATE_ELE_INDEX',:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_53.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库模板元素',:description=>'知识库模板元素')
    skm_menu_entiry_53.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Entry template element',:description=>'Entry template element')
    skm_menu_entiry_53.save
    skm_menu_entiry_73= Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',:sub_menu_code=>'IRM_SOC_SERVICE_KNOWLEDGE_MENU',:permission_code=>nil,:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_73.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_menu_entiry_73.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge',:description=>'Service knowledge')
    skm_menu_entiry_73.save
    skm_menu_entiry_74= Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SERVICE_KNOWLEDGE_MENU',:sub_menu_code=>nil,:permission_code=>'SKM_ENTRY_HEADERS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_74.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库文章',:description=>'知识库文章')
    skm_menu_entiry_74.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge',:description=>'Service knowledge')
    skm_menu_entiry_74.save
  end

  def self.down
  end
end
