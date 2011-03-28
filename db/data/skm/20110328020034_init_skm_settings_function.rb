# -*- coding: utf-8 -*-
class InitSkmSettingsFunction < ActiveRecord::Migration
  def self.up
    skm_view_skm_settings= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_SKM_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_view_skm_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看知识库设置',:description=>'查看知识库设置')
    skm_view_skm_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View SKM Settings',:description=>'View SKM Settings')
    skm_view_skm_settings.save
    skm_edit_skm_settings= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_SKM_SETTINGS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    skm_edit_skm_settings.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识库设置',:description=>'编辑知识库设置')
    skm_edit_skm_settings.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit SKM Settings',:description=>'Edit SKM Settings')
    skm_edit_skm_settings.save
  end

  def self.down
  end
end
