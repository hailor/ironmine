# -*- coding: utf-8 -*-
class InitIrmBaseRole < ActiveRecord::Migration
  def self.up
    Irm::Role.delete_all
    Irm::RolesTl.delete_all
    Irm::PersonRole.delete_all
    irm_irm_personal_info_setting_role= Irm::Role.new(:role_code=>'IRM_PERSONAL_INFO_SETTING_ROLE',:menu_code=>'IRM_PERSONAL_SETTING_MENU',:role_type=>'SETTING',:not_auto_mult=>true)
    irm_irm_personal_info_setting_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置',:description=>'个人设置')
    irm_irm_personal_info_setting_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Setting personal info',:description=>'Setting personal info')
    irm_irm_personal_info_setting_role.save
    irm_irm_system_manager= Irm::Role.new(:role_code=>'IRM_SYSTEM_MANAGER',:menu_code=>'IRM_SYSTEM_SETTING_MENU',:role_type=>'SETTING',:not_auto_mult=>true)
    irm_irm_system_manager.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统管理员',:description=>'系统管理员')
    irm_irm_system_manager.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'System manager',:description=>'System manager')
    irm_irm_system_manager.save
    irm_icm_manager= Irm::Role.new(:role_code=>'ICM_MANAGER',:menu_code=>'ICM_ADMIN_INCIDENT_MENU',:role_type=>'SETTING',:not_auto_mult=>true)
    irm_icm_manager.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理员',:description=>'事故管理员')
    irm_icm_manager.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident manager',:description=>'Incident manager')
    irm_icm_manager.save
    irm_skm_manager= Irm::Role.new(:role_code=>'SKM_MANAGER',:menu_code=>'SKM_ADMIN_MENU',:role_type=>'SETTING',:not_auto_mult=>true)
    irm_skm_manager.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理员',:description=>'知识库管理员')
    irm_skm_manager.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service knowledge manager',:description=>'Service knowledge manager')
    irm_skm_manager.save
    icm_irm_supporter= Irm::Role.new(:role_code=>'IRM_SUPPORTER',:menu_code=>'IRM_SERVICE_OPERATION_MENU',:role_type=>'BUSSINESS',:not_auto_mult=>true)
    icm_irm_supporter.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务台人员',:description=>'服务台人员')
    icm_irm_supporter.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Help desk supporter',:description=>'Help desk supporter')
    icm_irm_supporter.save
    skm_irm_customer= Irm::Role.new(:role_code=>'IRM_CUSTOMER',:menu_code=>'IRM_SERVICE_OPERATION_MENU',:role_type=>'BUSSINESS',:not_auto_mult=>true)
    skm_irm_customer.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'提单人员',:description=>'提单人员')
    skm_irm_customer.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Requester',:description=>'Requester')
    skm_irm_customer.save
    irm_irm_publiced_role= Irm::Role.new(:role_code=>'IRM_PUBLICED_ROLE',:menu_code=>'IRM_PUBLIC_ENTRANCE_MENU',:role_type=>'HIDDEN',:not_auto_mult=>true)
    irm_irm_publiced_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'对外公开角色',:description=>'对外公开角色')
    irm_irm_publiced_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Public role',:description=>'Public role')
    irm_irm_publiced_role.save
    irm_irm_logined_role= Irm::Role.new(:role_code=>'IRM_LOGINED_ROLE',:menu_code=>'IRM_LOGIN_ENTRANCE_MENU',:role_type=>'HIDDEN',:not_auto_mult=>true)
    irm_irm_logined_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'登录可访问角色',:description=>'登录可访问角色')
    irm_irm_logined_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Loing role',:description=>'Loing role')
    irm_irm_logined_role.save
    irm_irm_developer= Irm::Role.new(:role_code=>'IRM_DEVELOPER',:menu_code=>'IRM_DEVELOPER_TOOLS_MENU',:role_type=>'SETTING',:not_auto_mult=>true)
    irm_irm_developer.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员',:description=>'开发人员')
    irm_irm_developer.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer',:description=>'Developer')
    irm_irm_developer.save
    
  end

  def self.down
  end
end
