# -*- coding: utf-8 -*-
class AddOtherFunctions3 < ActiveRecord::Migration
  def self.up
    skm_view_skm_entries= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'VIEW_SKM_ENTRIES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    skm_view_skm_entries.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看知识库文章',:description=>'查看知识库文章')
    skm_view_skm_entries.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Skm Entries',:description=>'View Skm Entries')
    skm_view_skm_entries.save
    skm_edit_skm_entries= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'EDIT_SKM_ENTRIES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    skm_edit_skm_entries.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑知识库文章',:description=>'编辑知识库文章')
    skm_edit_skm_entries.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Skm Entries',:description=>'Edit Skm Entries')
    skm_edit_skm_entries.save
    skm_create_skm_entries= Irm::Function.new(:group_code=>'SKM_SETTING',:function_code=>'CREATE_SKM_ENTRIES',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    skm_create_skm_entries.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建知识库文章',:description=>'新建知识库文章')
    skm_create_skm_entries.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create Skm Entries',:description=>'Create Skm Entries')
    skm_create_skm_entries.save
  end

  def self.down
  end
end
