# -*- coding: utf-8 -*-
class InitSkmBaseRoles < ActiveRecord::Migration
  def self.up
    skm_skm_admin_role= Irm::Role.new(:role_code=>'SKM_ADMIN_ROLE',:menu_code=>'SKM_ADMIN_MENU',:not_auto_mult=>true)
    skm_skm_admin_role.roles_tls.build(:language=>'zh',:source_lang=>'en',:name=>'知识库管理角色',:description=>'知识库管理角色')
    skm_skm_admin_role.roles_tls.build(:language=>'en',:source_lang=>'en',:name=>'Knowledge manage role',:description=>'Knowledge manage role')
    skm_skm_admin_role.save
  end

  def self.down
   skm_skm_admin_role = Irm::Role.where(:role_code=>'SKM_ADMIN_ROLE',:menu_code=>'SKM_ADMIN_MENU').first
   skm_skm_admin_role.destroy if skm_skm_admin_role
  end
end
