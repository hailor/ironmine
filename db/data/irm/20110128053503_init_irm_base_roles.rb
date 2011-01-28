# -*- coding: utf-8 -*-
class InitIrmBaseRoles < ActiveRecord::Migration
  def self.up
    Irm::Role.delete_all
    Irm::RolesTl.delete_all
    irm_irm_setting_entrace_role= Irm::Role.new(:role_code=>'IRM_SETTING_ENTRACE_ROLE',:menu_code=>'IRM_SETTING_ENTRANCE_MENU',:not_auto_mult=>true)
    irm_irm_setting_entrace_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统设置顶层角色',:description=>'系统设置顶层角色')
    irm_irm_setting_entrace_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'System setting top role',:description=>'System setting top role')
    irm_irm_setting_entrace_role.save
    irm_irm_system_setting_role= Irm::Role.new(:role_code=>'IRM_SYSTEM_SETTING_ROLE',:menu_code=>'IRM_SYSTME_SETTING_MENU',:not_auto_mult=>true)
    irm_irm_system_setting_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统设置角色',:description=>'系统设置角色')
    irm_irm_system_setting_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'System setting role',:description=>'System setting role')
    irm_irm_system_setting_role.save
    irm_irm_personal_setting_role= Irm::Role.new(:role_code=>'IRM_PERSONAL_SETTING_ROLE',:menu_code=>'IRM_PERSONAL_SETTING_MENU',:not_auto_mult=>true)
    irm_irm_personal_setting_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'个人设置角色',:description=>'个人设置角色')
    irm_irm_personal_setting_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Personal setting role',:description=>'Personal setting role')
    irm_irm_personal_setting_role.save
    irm_irm_base_setting_role= Irm::Role.new(:role_code=>'IRM_BASE_SETTING_ROLE',:menu_code=>'IRM_BASE_SETTING_MENU',:not_auto_mult=>true)
    irm_irm_base_setting_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'基础设置角色',:description=>'基础设置角色')
    irm_irm_base_setting_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Base setting role',:description=>'Base setting role')
    irm_irm_base_setting_role.save
    irm_irm_advance_role= Irm::Role.new(:role_code=>'IRM_ADVANCE_ROLE',:menu_code=>'IRM_ADVANCE_MENU',:not_auto_mult=>true)
    irm_irm_advance_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'高级设置管理角色',:description=>'高级设置管理角色')
    irm_irm_advance_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Advance setting role',:description=>'Advance setting role')
    irm_irm_advance_role.save
    irm_irm_developer_role= Irm::Role.new(:role_code=>'IRM_DEVELOPER_ROLE',:menu_code=>'IRM_DEVELOPER_TOOLS_MENU',:not_auto_mult=>true)
    irm_irm_developer_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'开发人员角色',:description=>'开发人员角色')
    irm_irm_developer_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Developer role',:description=>'Developer role')
    irm_irm_developer_role.save
    irm_irm_system_bussiness_role= Irm::Role.new(:role_code=>'IRM_SYSTEM_BUSSINESS_ROLE',:menu_code=>'IRM_ENTRANCE_MENU',:not_auto_mult=>true)
    irm_irm_system_bussiness_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统业务角色',:description=>'系统业务角色')
    irm_irm_system_bussiness_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'System bussiness role',:description=>'System bussiness role')
    irm_irm_system_bussiness_role.save
    irm_irm_service_operation_role= Irm::Role.new(:role_code=>'IRM_SERVICE_OPERATION_ROLE',:menu_code=>'IRM_SERVICE_OPERATION_MENU',:not_auto_mult=>true)
    irm_irm_service_operation_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'服务运营中心(服务人员)',:description=>'服务运营中心(服务人员)')
    irm_irm_service_operation_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Service operation center(Supporter)',:description=>'Service operation center(Supporter)')
    irm_irm_service_operation_role.save
    irm_irm_change_management_role= Irm::Role.new(:role_code=>'IRM_CHANGE_MANAGEMENT_ROLE',:menu_code=>'IRM_CHANGE_MANAGEMENT_MENU',:not_auto_mult=>true)
    irm_irm_change_management_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'变更发布中心(服务人员)',:description=>'变更发布中心(服务人员)')
    irm_irm_change_management_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Change management center(Supporter)',:description=>'Change management center(Supporter)')
    irm_irm_change_management_role.save
    irm_irm_oracle_ebs_best_role= Irm::Role.new(:role_code=>'IRM_ORACLE_EBS_BEST_ROLE',:menu_code=>'IRM_ORACLE_EBS_BEST_MENU',:not_auto_mult=>true)
    irm_irm_oracle_ebs_best_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'Oracle EBS最佳实践',:description=>'Oracle EBS最佳实践')
    irm_irm_oracle_ebs_best_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Oracle EBS best practices',:description=>'Oracle EBS best practices')
    irm_irm_oracle_ebs_best_role.save
  end

  def self.down
    Irm::Role.delete_all
    Irm::RolesTl.delete_all    
  end
end
