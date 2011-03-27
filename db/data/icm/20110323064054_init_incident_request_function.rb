# -*- coding: utf-8 -*-
class InitIncidentRequestFunction < ActiveRecord::Migration
  def self.up
    Irm::Function.delete_all
    Irm::FunctionsTl.delete_all
    Irm::FunctionGroup.delete_all
    Irm::FunctionGroupsTl.delete_all
    Irm::Role.delete_all
    Irm::RolesTl.delete_all
    irm_irm_system_home_page= Irm::FunctionGroup.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:not_auto_mult=>true)
    irm_irm_system_home_page.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'系统主页',:description=>'系统主页')
    irm_irm_system_home_page.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'System home page',:description=>'System home page')
    irm_irm_system_home_page.save
    icm_icm_incident_request= Irm::FunctionGroup.new(:group_code=>'ICM_INCIDENT_REQUEST',:not_auto_mult=>true)
    icm_icm_incident_request.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'事故单',:description=>'事故单')
    icm_icm_incident_request.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Incident request',:description=>'Incident request')
    icm_icm_incident_request.save
    
    irm_home_page= Irm::Function.new(:group_code=>'IRM_SYSTEM_HOME_PAGE',:function_code=>'HOME_PAGE',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_home_page.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'首页',:description=>'首页')
    irm_home_page.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Home page',:description=>'Home page')
    irm_home_page.save
    irm_view_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'VIEW_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看事故单',:description=>'查看事故单')
    irm_view_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View incident request',:description=>'View incident request')
    irm_view_incident_request.save
    irm_create_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CREATE_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'创建事故单',:description=>'创建事故单')
    irm_create_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create incident request',:description=>'Create incident request')
    irm_create_incident_request.save
    irm_edit_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'EDIT_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_edit_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑事故单',:description=>'编辑事故单')
    irm_edit_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit incident request',:description=>'Edit incident request')
    irm_edit_incident_request.save
    irm_reply_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'REPLY_INCIDENT_REQUEST',:default_flag=>'Y',:public_flag=>'N',:not_auto_mult=>true)
    irm_reply_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'回复事故单',:description=>'回复事故单')
    irm_reply_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Reply incident request',:description=>'Reply incident request')
    irm_reply_incident_request.save
    irm_assign_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'ASSIGN_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_assign_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'分配事故单',:description=>'分配事故单')
    irm_assign_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Assign incident request',:description=>'Assign incident request')
    irm_assign_incident_request.save
    irm_close_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CLOSE_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_close_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'关闭事故单',:description=>'关闭事故单')
    irm_close_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Close incident request',:description=>'Close incident request')
    irm_close_incident_request.save
    irm_pass_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'PASS_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_pass_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'转交事故单',:description=>'转交事故单')
    irm_pass_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Pass incident request',:description=>'Pass incident request')
    irm_pass_incident_request.save
    irm_view_all_incident_request= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'VIEW_ALL_INCIDENT_REQUEST',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_view_all_incident_request.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看所有事故单',:description=>'查看所有事故单')
    irm_view_all_incident_request.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View all incident request',:description=>'View all incident request')
    irm_view_all_incident_request.save
    irm_create_icdt_rqst_for_other= Irm::Function.new(:group_code=>'ICM_INCIDENT_REQUEST',:function_code=>'CREATE_ICDT_RQST_FOR_OTHER',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    irm_create_icdt_rqst_for_other.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'为他人提交事故单',:description=>'为他人提交事故单')
    irm_create_icdt_rqst_for_other.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Create incident request for other',:description=>'Create incident request for other')
    irm_create_icdt_rqst_for_other.save
  end

  def self.down
  end
end
