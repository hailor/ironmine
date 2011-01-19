# -*- coding: utf-8 -*-
class InitCsiSurveyPermissions < ActiveRecord::Migration
  def self.up
    csi_product = Irm::ProductModule.new({:product_short_name=>"CSI",:installed_flag=>"Y",:not_auto_mult=>true})
    csi_product.product_modules_tls.build({:name=>"Continual Service Improvement",
                                    :description=>"Continual Service Improvement",
                                    :language=>"en",
                                    :source_lang=>"en"})
    csi_product.product_modules_tls.build({:name=>"持续服务改进模块",
                                    :description=>"持续服务改进模块",
                                    :language=>"zh",
                                    :source_lang=>"en"})
    csi_product.save
    
    irm_surveys_index = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_INDEX',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'index',
                                                   :not_auto_mult=>true)
    irm_surveys_index.permissions_tls.build(:language=>'zh',:name=>'设置调查问卷',:description=>'设置调查问卷',:source_lang=>'en')
    irm_surveys_index.permissions_tls.build(:language=>'en',:name=>'Survey',:description=>'Survey',:source_lang=>'en')
    irm_surveys_index.save

    irm_surveys_new = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_NEW',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'new',
                                                   :not_auto_mult=>true)
    irm_surveys_new.permissions_tls.build(:language=>'zh',:name=>'新建调查问卷',:description=>'新建调查问卷',:source_lang=>'en')
    irm_surveys_new.permissions_tls.build(:language=>'en',:name=>'New Survey',:description=>'New Survey',:source_lang=>'en')
    irm_surveys_new.save

    irm_surveys_edit = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_EDIT',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'edit',
                                                   :not_auto_mult=>true)
    irm_surveys_edit.permissions_tls.build(:language=>'zh',:name=>'编辑调查问卷',:description=>'编辑调查问卷',:source_lang=>'en')
    irm_surveys_edit.permissions_tls.build(:language=>'en',:name=>'Edit Survey',:description=>'Edit Survey',:source_lang=>'en')
    irm_surveys_edit.save

    irm_surveys_create = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_CREATE',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'create',
                                                   :not_auto_mult=>true)
    irm_surveys_create.permissions_tls.build(:language=>'zh',:name=>'保存调查问卷',:description=>'保存调查问卷',:source_lang=>'en')
    irm_surveys_create.permissions_tls.build(:language=>'en',:name=>'Create Survey',:description=>'Create Survey',:source_lang=>'en')
    irm_surveys_create.save

    irm_surveys_update = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_UPDATE',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'update',
                                                   :not_auto_mult=>true)
    irm_surveys_update.permissions_tls.build(:language=>'zh',:name=>'更新调查问卷',:description=>'更新调查问卷',:source_lang=>'en')
    irm_surveys_update.permissions_tls.build(:language=>'en',:name=>'Update Survey',:description=>'Update Survey',:source_lang=>'en')
    irm_surveys_update.save

    irm_surveys_get_data = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_GET_DATA',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'get_data',
                                                   :not_auto_mult=>true)
    irm_surveys_get_data.permissions_tls.build(:language=>'zh',:name=>'获取调查问卷',:description=>'获取调查问卷',:source_lang=>'en')
    irm_surveys_get_data.permissions_tls.build(:language=>'en',:name=>'Get Survey',:description=>'Get Survey',:source_lang=>'en')
    irm_surveys_get_data.save

    irm_surveys_password = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_PASSWORD',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'password',
                                                   :not_auto_mult=>true)
    irm_surveys_password.permissions_tls.build(:language=>'zh',:name=>'调查问卷验证',:description=>'编辑调查问卷验证',:source_lang=>'en')
    irm_surveys_password.permissions_tls.build(:language=>'en',:name=>'Survey Password',:description=>'Survey Password',:source_lang=>'en')
    irm_surveys_password.save

    irm_surveys_reply = Irm::Permission.new(:permission_code=>'IRM_SURVEYS_REPLY',
                                                   :page_controller=>'csi/surveys',
                                                   :page_action=>'reply',
                                                   :not_auto_mult=>true)
    irm_surveys_reply.permissions_tls.build(:language=>'zh',:name=>'回复调查问卷',:description=>'回复调查问卷',:source_lang=>'en')
    irm_surveys_reply.permissions_tls.build(:language=>'en',:name=>'Survey Reply',:description=>'Survey Reply',:source_lang=>'en')
    irm_surveys_reply.save


    ##############################################################################################################################
    soc_survey_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_SURVEY_MENU',:not_auto_mult=>true)
    soc_survey_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心调查问卷',:description=>'服务运营中心调查问卷',:source_lang=>'en')
    soc_survey_menu.menus_tls.build(:language=>'en',:name=>'SOC Survey Menu',:description=>'SOC Survey Menu',:source_lang=>'en')
    soc_survey_menu.save

    survey_page = Irm::MenuEntry.new(:menu_code=>'IRM_SOC_SURVEY_PAGE_MENU',
                                     :permission_code=>'IRM_SURVEYS_INDEX',
                                     :display_sequence=>10,
                                     :not_auto_mult=>true)
    survey_page.menu_entries_tls.build(:language=>'zh',:name=>'调查问卷',:description=>'调查问卷',:source_lang=>'en')
    survey_page.menu_entries_tls.build(:language=>'en',:name=>'Survey',:description=>'Survey',:source_lang=>'en')
    survey_page.save

    soc_survey = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_SURVEY_MENU',
                                         :display_sequence=>30,
                                         :not_auto_mult=>true)
    soc_survey.menu_entries_tls.build(:language=>'zh',:name=>'调查问卷',:description=>'调查问卷',:source_lang=>'en')
    soc_survey.menu_entries_tls.build(:language=>'en',:name=>'Survey',:description=>'Survey',:source_lang=>'en')
    soc_survey.save

    soc_survey_page_menu = Irm::Menu.new(:menu_code=>'IRM_SOC_SURVEY_PAGE_MENU',:not_auto_mult=>true)
    soc_survey_page_menu.menus_tls.build(:language=>'zh',:name=>'服务运营中心调查问卷',:description=>'服务运营中心调查问卷',:source_lang=>'en')
    soc_survey_page_menu.menus_tls.build(:language=>'en',:name=>'SOC Survey',:description=>'SOC Survey',:source_lang=>'en')
    soc_survey_page_menu.save

    soc_home_page = Irm::MenuEntry.new(:menu_code=>'IRM_SERVICE_OPERATION_MENU',
                                         :sub_menu_code=>'IRM_SOC_SURVEY_PAGE_MENU',
                                         :display_sequence=>40,
                                         :not_auto_mult=>true)
    soc_home_page.menu_entries_tls.build(:language=>'zh',:name=>'调查问卷',:description=>'调查问卷',:source_lang=>'en')
    soc_home_page.menu_entries_tls.build(:language=>'en',:name=>'Survey',:description=>'Survey',:source_lang=>'en')
    soc_home_page.save
  end

  def self.down
    lookup_types_permissions=Irm::Permission.query_by_page_controller("csi/surveys")
    lookup_types_permissions.each do |permission|
       language_permissions=Irm::PermissionsTl.query_by_permission_id(permission.id)
       language_permissions.each do |language_permission|
          language_permission.delete
       end
       permission.delete
    end
  end
end
