# -*- coding: utf-8 -*-
class AddOtherFunctions < ActiveRecord::Migration
  def self.up
    
    irm_irm_wf_task= Irm::FunctionGroup.new(:group_code=>'IRM_WF_TASK',:not_auto_mult=>true)
    irm_irm_wf_task.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'任务',:description=>'任务')
    irm_irm_wf_task.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Workflow Task',:description=>'Workflow Task')
    irm_irm_wf_task.save
    
    irm_view_my_info= Irm::Function.new(:group_code=>'IRM_PUBLIC',:function_code=>'VIEW_MY_INFO',:default_flag=>'N',:login_flag => 'Y', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_my_info.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看个人信息',:description=>'查看个人信息')
    irm_view_my_info.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View My Info',:description=>'View My Info')
    irm_view_my_info.save
    irm_edit_my_info= Irm::Function.new(:group_code=>'IRM_PUBLIC',:function_code=>'EDIT_MY_INFO',:default_flag=>'N',:login_flag => 'Y', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_my_info.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑个人信息',:description=>'编辑个人信息')
    irm_edit_my_info.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit My Info',:description=>'Edit My Info')
    irm_edit_my_info.save

    #--------------------------------------------------------------------------------------------------------------------------------------------
    irm_irm_bulletin= Irm::FunctionGroup.new(:group_code=>'IRM_BULLETIN',:not_auto_mult=>true)
    irm_irm_bulletin.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'公告',:description=>'公告')
    irm_irm_bulletin.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Bulletin',:description=>'Bulletin')
    irm_irm_bulletin.save
    
    irm_view_bulletins= Irm::Function.new(:group_code=>'IRM_BULLETIN',:function_code=>'VIEW_BULLETINS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_bulletins.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看公告',:description=>'查看公告')
    irm_view_bulletins.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Bulletins',:description=>'View Bulletins')
    irm_view_bulletins.save
    irm_new_bulletins= Irm::Function.new(:group_code=>'IRM_BULLETIN',:function_code=>'NEW_BULLETINS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_new_bulletins.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建公告',:description=>'新建公告')
    irm_new_bulletins.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Bulletins',:description=>'New Bulletins')
    irm_new_bulletins.save
    irm_edit_bulletins= Irm::Function.new(:group_code=>'IRM_BULLETIN',:function_code=>'EDIT_BULLETINS',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_bulletins.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑公告',:description=>'编辑公告')
    irm_edit_bulletins.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Bulletins',:description=>'Edit Bulletins')
    irm_edit_bulletins.save
  end

  def self.down
  end
end
