# -*- coding: utf-8 -*-
class InitCsiBasePermissions < ActiveRecord::Migration
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

    csi_surveys_create= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_CREATE',:page_controller=>'csi/surveys',:page_action=>'create',:not_auto_mult=>true)
    csi_surveys_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_surveys_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_surveys_create.save
    csi_surveys_create_result= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_CREATE_RESULT',:page_controller=>'csi/surveys',:page_action=>'create_result',:not_auto_mult=>true)
    csi_surveys_create_result.permissions_tls.build(:language=>'zh',:name=>'创建问卷结果',:description=>'创建问卷结果',:source_lang=>'en')
    csi_surveys_create_result.permissions_tls.build(:language=>'en',:name=>'Create Result',:description=>'Create Result',:source_lang=>'en')
    csi_surveys_create_result.save
    csi_surveys_edit= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_EDIT',:page_controller=>'csi/surveys',:page_action=>'edit',:not_auto_mult=>true)
    csi_surveys_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_surveys_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_surveys_edit.save
    csi_surveys_get_data= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_GET_DATA',:page_controller=>'csi/surveys',:page_action=>'get_data',:not_auto_mult=>true)
    csi_surveys_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    csi_surveys_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    csi_surveys_get_data.save
    csi_surveys_index= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_INDEX',:page_controller=>'csi/surveys',:page_action=>'index',:not_auto_mult=>true)
    csi_surveys_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    csi_surveys_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    csi_surveys_index.save
    csi_surveys_new= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_NEW',:page_controller=>'csi/surveys',:page_action=>'new',:not_auto_mult=>true)
    csi_surveys_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_surveys_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_surveys_new.save
    csi_surveys_password= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_PASSWORD',:page_controller=>'csi/surveys',:page_action=>'password',:not_auto_mult=>true)
    csi_surveys_password.permissions_tls.build(:language=>'zh',:name=>'输入密码',:description=>'输入密码',:source_lang=>'en')
    csi_surveys_password.permissions_tls.build(:language=>'en',:name=>'Password',:description=>'Password',:source_lang=>'en')
    csi_surveys_password.save
    csi_surveys_reply= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_REPLY',:page_controller=>'csi/surveys',:page_action=>'reply',:not_auto_mult=>true)
    csi_surveys_reply.permissions_tls.build(:language=>'zh',:name=>'答题',:description=>'答题',:source_lang=>'en')
    csi_surveys_reply.permissions_tls.build(:language=>'en',:name=>'Reply',:description=>'Reply',:source_lang=>'en')
    csi_surveys_reply.save
    csi_surveys_show= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_SHOW',:page_controller=>'csi/surveys',:page_action=>'show',:not_auto_mult=>true)
    csi_surveys_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    csi_surveys_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    csi_surveys_show.save
    csi_surveys_show_result= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_SHOW_RESULT',:page_controller=>'csi/surveys',:page_action=>'show_result',:not_auto_mult=>true)
    csi_surveys_show_result.permissions_tls.build(:language=>'zh',:name=>'显示结果',:description=>'显示结果',:source_lang=>'en')
    csi_surveys_show_result.permissions_tls.build(:language=>'en',:name=>'Show Result',:description=>'Show Result',:source_lang=>'en')
    csi_surveys_show_result.save
    csi_surveys_thanks= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_THANKS',:page_controller=>'csi/surveys',:page_action=>'thanks',:not_auto_mult=>true)
    csi_surveys_thanks.permissions_tls.build(:language=>'zh',:name=>'感谢',:description=>'感谢',:source_lang=>'en')
    csi_surveys_thanks.permissions_tls.build(:language=>'en',:name=>'Thanks',:description=>'Thanks',:source_lang=>'en')
    csi_surveys_thanks.save
    csi_surveys_update= Irm::Permission.new(:permission_code=>'CSI_SURVEYS_UPDATE',:page_controller=>'csi/surveys',:page_action=>'update',:not_auto_mult=>true)
    csi_surveys_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_surveys_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_surveys_update.save
    csi_survey_subjects_create= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_CREATE',:page_controller=>'csi/survey_subjects',:page_action=>'create',:not_auto_mult=>true)
    csi_survey_subjects_create.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_subjects_create.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_subjects_create.save
    csi_survey_subjects_destroy= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_DESTROY',:page_controller=>'csi/survey_subjects',:page_action=>'destroy',:not_auto_mult=>true)
    csi_survey_subjects_destroy.permissions_tls.build(:language=>'zh',:name=>'删除',:description=>'删除',:source_lang=>'en')
    csi_survey_subjects_destroy.permissions_tls.build(:language=>'en',:name=>'Destroy',:description=>'Destroy',:source_lang=>'en')
    csi_survey_subjects_destroy.save
    csi_survey_subjects_edit= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_EDIT',:page_controller=>'csi/survey_subjects',:page_action=>'edit',:not_auto_mult=>true)
    csi_survey_subjects_edit.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_subjects_edit.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_subjects_edit.save
    csi_survey_subjects_get_data= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_GET_DATA',:page_controller=>'csi/survey_subjects',:page_action=>'get_data',:not_auto_mult=>true)
    csi_survey_subjects_get_data.permissions_tls.build(:language=>'zh',:name=>'取数',:description=>'取数',:source_lang=>'en')
    csi_survey_subjects_get_data.permissions_tls.build(:language=>'en',:name=>'Get Data',:description=>'Get Data',:source_lang=>'en')
    csi_survey_subjects_get_data.save
    csi_survey_subjects_index= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_INDEX',:page_controller=>'csi/survey_subjects',:page_action=>'index',:not_auto_mult=>true)
    csi_survey_subjects_index.permissions_tls.build(:language=>'zh',:name=>'首页',:description=>'首页',:source_lang=>'en')
    csi_survey_subjects_index.permissions_tls.build(:language=>'en',:name=>'Index',:description=>'Index',:source_lang=>'en')
    csi_survey_subjects_index.save
    csi_survey_subjects_new= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_NEW',:page_controller=>'csi/survey_subjects',:page_action=>'new',:not_auto_mult=>true)
    csi_survey_subjects_new.permissions_tls.build(:language=>'zh',:name=>'创建',:description=>'创建',:source_lang=>'en')
    csi_survey_subjects_new.permissions_tls.build(:language=>'en',:name=>'New',:description=>'New',:source_lang=>'en')
    csi_survey_subjects_new.save
    csi_survey_subjects_show= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_SHOW',:page_controller=>'csi/survey_subjects',:page_action=>'show',:not_auto_mult=>true)
    csi_survey_subjects_show.permissions_tls.build(:language=>'zh',:name=>'查看',:description=>'查看',:source_lang=>'en')
    csi_survey_subjects_show.permissions_tls.build(:language=>'en',:name=>'Show',:description=>'Show',:source_lang=>'en')
    csi_survey_subjects_show.save
    csi_survey_subjects_update= Irm::Permission.new(:permission_code=>'CSI_SURVEY_SUBJECTS_UPDATE',:page_controller=>'csi/survey_subjects',:page_action=>'update',:not_auto_mult=>true)
    csi_survey_subjects_update.permissions_tls.build(:language=>'zh',:name=>'编辑',:description=>'编辑',:source_lang=>'en')
    csi_survey_subjects_update.permissions_tls.build(:language=>'en',:name=>'Edit',:description=>'Edit',:source_lang=>'en')
    csi_survey_subjects_update.save    
  end

  def self.down
  end
end
