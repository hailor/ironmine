# -*- coding: utf-8 -*-
class AddUserRequestPermissionMenu < ActiveRecord::Migration
  def self.up
    icm_user_journals_create= Irm::Permission.new(:permission_code=>'ICM_USER_JOURNALS_CREATE',:page_controller=>'icm/user_journals',:page_action=>'create',:not_auto_mult=>true)
    icm_user_journals_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_user_journals_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_user_journals_create.save
    icm_user_journals_index= Irm::Permission.new(:permission_code=>'ICM_USER_JOURNALS_INDEX',:page_controller=>'icm/user_journals',:page_action=>'index',:not_auto_mult=>true)
    icm_user_journals_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_user_journals_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_user_journals_index.save
    icm_user_journals_new= Irm::Permission.new(:permission_code=>'ICM_USER_JOURNALS_NEW',:page_controller=>'icm/user_journals',:page_action=>'new',:not_auto_mult=>true)
    icm_user_journals_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_user_journals_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_user_journals_new.save
    icm_user_requests_create= Irm::Permission.new(:permission_code=>'ICM_USER_REQUESTS_CREATE',:page_controller=>'icm/user_requests',:page_action=>'create',:not_auto_mult=>true)
    icm_user_requests_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_user_requests_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_user_requests_create.save
    icm_user_requests_get_data= Irm::Permission.new(:permission_code=>'ICM_USER_REQUESTS_GET_DATA',:page_controller=>'icm/user_requests',:page_action=>'get_data',:not_auto_mult=>true)
    icm_user_requests_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    icm_user_requests_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    icm_user_requests_get_data.save
    icm_user_requests_index= Irm::Permission.new(:permission_code=>'ICM_USER_REQUESTS_INDEX',:page_controller=>'icm/user_requests',:page_action=>'index',:not_auto_mult=>true)
    icm_user_requests_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    icm_user_requests_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    icm_user_requests_index.save
    icm_user_requests_new= Irm::Permission.new(:permission_code=>'ICM_USER_REQUESTS_NEW',:page_controller=>'icm/user_requests',:page_action=>'new',:not_auto_mult=>true)
    icm_user_requests_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    icm_user_requests_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    icm_user_requests_new.save
    icm_user_requests_show= Irm::Permission.new(:permission_code=>'ICM_USER_REQUESTS_SHOW',:page_controller=>'icm/user_requests',:page_action=>'show',:not_auto_mult=>true)
    icm_user_requests_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    icm_user_requests_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    icm_user_requests_show.save

    irm_user_home_index= Irm::Permission.new(:permission_code=>'IRM_USER_HOME_INDEX',:page_controller=>'irm/user_home',:page_action=>'index',:not_auto_mult=>true)
    irm_user_home_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    irm_user_home_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    irm_user_home_index.save

    irm_irm_user_soc_menu= Irm::Menu.new(:menu_code=>'IRM_USER_SOC_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_user_soc_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户服务中心',:description=>'用户服务中心')
    irm_irm_user_soc_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'User service operation center',:description=>'User service operation center')
    irm_irm_user_soc_menu.save
    irm_irm_user_soc_home_menu= Irm::Menu.new(:menu_code=>'IRM_USER_SOC_HOME_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_user_soc_home_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户服务中心主页',:description=>'用户服务中心主页')
    irm_irm_user_soc_home_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'User soc home page',:description=>'User soc home page')
    irm_irm_user_soc_home_menu.save
    irm_irm_user_soc_incident_menu= Irm::Menu.new(:menu_code=>'IRM_USER_SOC_INCIDENT_MENU',:leaf_flag=>'N',:not_auto_mult=>true)
    irm_irm_user_soc_incident_menu.menus_tls.build(:language=>'zh',:source_lang=>'en',:name=>'USOC事故单',:description=>'USOC事故单')
    irm_irm_user_soc_incident_menu.menus_tls.build(:language=>'en',:source_lang=>'en',:name=>'User soc incident request',:description=>'User soc incident request')
    irm_irm_user_soc_incident_menu.save

    irm_menu_entiry_91= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_MENU',:sub_menu_code=>'IRM_USER_SOC_HOME_MENU',:permission_code=>nil,:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'主页',:description=>'主页')
    irm_menu_entiry_91.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home',:description=>'Home')
    irm_menu_entiry_91.save
    irm_menu_entiry_92= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_HOME_MENU',:sub_menu_code=>nil,:permission_code=>'IRM_USER_HOME_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'用户主页',:description=>'用户主页')
    irm_menu_entiry_92.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    irm_menu_entiry_92.save
    icm_menu_entiry_93= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_MENU',:sub_menu_code=>'IRM_USER_SOC_INCIDENT_MENU',:permission_code=>nil,:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_93.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_menu_entiry_93.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    icm_menu_entiry_93.save
    icm_menu_entiry_94= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_USER_REQUESTS_INDEX',:display_sequence=>10,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_94.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_menu_entiry_94.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    icm_menu_entiry_94.save
    icm_menu_entiry_95= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_INCIDENT_MENU',:sub_menu_code=>nil,:permission_code=>'ICM_USER_JOURNALS_INDEX',:display_sequence=>20,:display_flag=>'Y',:not_auto_mult=>true)
    icm_menu_entiry_95.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单回复',:description=>'事故单回复')
    icm_menu_entiry_95.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply request',:description=>'Reply request')
    icm_menu_entiry_95.save

    skm_menu_entiry_96= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_MENU',:sub_menu_code=>'IRM_SOC_SERVICE_KNOWLEDGE_MENU',:permission_code=>nil,:display_sequence=>30,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_96.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库',:description=>'知识库')
    skm_menu_entiry_96.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge',:description=>'Service knowledge')
    skm_menu_entiry_96.save
    skm_menu_entiry_97= Irm::MenuEntry.new(:menu_code=>'IRM_USER_SOC_MENU',:sub_menu_code=>'IRM_SOC_FILE_MANAGEMENT_MENU',:permission_code=>nil,:display_sequence=>40,:display_flag=>'Y',:not_auto_mult=>true)
    skm_menu_entiry_97.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'文件管理',:description=>'文件管理')
    skm_menu_entiry_97.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'File Management',:description=>'File Management')
    skm_menu_entiry_97.save


    

  end

  def self.down
  end
end
