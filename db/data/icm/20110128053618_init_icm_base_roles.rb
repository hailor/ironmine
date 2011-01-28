# -*- coding: utf-8 -*-
class InitIcmBaseRoles < ActiveRecord::Migration
  def self.up
    icm_icm_admin_setting_role= Irm::Role.new(:role_code=>'ICM_ADMIN_SETTING_ROLE',:menu_code=>'ICM_ADMIN_SETTING_MENU',:not_auto_mult=>true)
    icm_icm_admin_setting_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故管理角色',:description=>'事故管理角色')
    icm_icm_admin_setting_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident setting role',:description=>'Incident setting role')
    icm_icm_admin_setting_role.save
  end

  def self.down
   icm_icm_admin_setting_role = Irm::Role.where(:role_code=>'ICM_ADMIN_SETTING_ROLE',:menu_code=>'ICM_ADMIN_SETTING_MENU').first
   icm_icm_admin_setting_role.destroy if icm_icm_admin_setting_role
  end
end
