# -*- coding: utf-8 -*-
class InitWfMailAlertFunctionMenu < ActiveRecord::Migration
  def self.up
    irm_menu_entiry_44= Irm::MenuEntry.new(:menu_code=>'WORKFLOW',:sub_menu_code=>nil,:page_controller=>'irm/wf_mail_alerts',:display_sequence=>50,:display_flag=>'Y',:not_auto_mult=>true)
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件警告',:description=>'邮件警告')
    irm_menu_entiry_44.menu_entries_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Alert',:description=>'Mail Alert')
    irm_menu_entiry_44.save
    irm_view_wf_mail_alerts= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'VIEW_WF_MAIL_ALERTS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_view_wf_mail_alerts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'邮件警告',:description=>'邮件警告')
    irm_view_wf_mail_alerts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Mail Alert',:description=>'Mail Alert')
    irm_view_wf_mail_alerts.save
    irm_create_wf_mail_alerts= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'CREATE_WF_MAIL_ALERTS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_create_wf_mail_alerts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'新建邮件警告',:description=>'新建邮件警告')
    irm_create_wf_mail_alerts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'New Mail Alert',:description=>'New Mail Alert')
    irm_create_wf_mail_alerts.save
    irm_edit_wf_mail_alerts= Irm::Function.new(:group_code=>'IRM_WORKFLOW',:function_code=>'EDIT_WF_MAIL_ALERTS',:default_flag=>'N',:login_flag => 'N', :public_flag=>'N',:not_auto_mult=>true)
    irm_edit_wf_mail_alerts.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑邮件警告',:description=>'编辑邮件警告')
    irm_edit_wf_mail_alerts.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Mail Alert',:description=>'Edit Mail Alert')
    irm_edit_wf_mail_alerts.save
  end

  def self.down
  end
end
