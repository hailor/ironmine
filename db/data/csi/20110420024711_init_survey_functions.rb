# -*- coding: utf-8 -*-
class InitSurveyFunctions < ActiveRecord::Migration
  def self.up
    csi_csi_survey= Irm::FunctionGroup.new(:group_code=>'CSI_SURVEY',:not_auto_mult=>true)
    csi_csi_survey.function_groups_tls.build(:language=>'zh',:source_lang=>'en',:name=>'调查问卷',:description=>'调查问卷')
    csi_csi_survey.function_groups_tls.build(:language=>'en',:source_lang=>'en',:name=>'Survey',:description=>'Survey')
    csi_csi_survey.save

    csi_view_survey= Irm::Function.new(:group_code=>'CSI_SURVEY',:function_code=>'VIEW_SURVEY',:default_flag=>'N ',:public_flag=>'N',:not_auto_mult=>true)
    csi_view_survey.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看调查问卷',:description=>'查看调查问卷')
    csi_view_survey.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Survey',:description=>'View Survey')
    csi_view_survey.save
    csi_new_survey= Irm::Function.new(:group_code=>'CSI_SURVEY',:function_code=>'NEW_SURVEY',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    csi_new_survey.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'发起调查',:description=>'发起调查')
    csi_new_survey.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Initiate Survey',:description=>'Initiate Survey')
    csi_new_survey.save
    csi_edit_survey= Irm::Function.new(:group_code=>'CSI_SURVEY',:function_code=>'EDIT_SURVEY',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    csi_edit_survey.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'编辑调查问卷',:description=>'编辑调查问卷')
    csi_edit_survey.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Edit Survey',:description=>'Edit Survey')
    csi_edit_survey.save
    csi_view_survey_result= Irm::Function.new(:group_code=>'CSI_SURVEY',:function_code=>'VIEW_SURVEY_RESULT',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    csi_view_survey_result.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'查看调查结果',:description=>'查看调查结果')
    csi_view_survey_result.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'View Survey Result',:description=>'View Survey Result')
    csi_view_survey_result.save
    csi_reply_survey= Irm::Function.new(:group_code=>'CSI_SURVEY',:function_code=>'REPLY_SURVEY',:default_flag=>'N',:public_flag=>'N',:not_auto_mult=>true)
    csi_reply_survey.functions_tls.build(:language=>'zh',:source_lang=>'en',:name=>'参与调查',:description=>'参与调查')
    csi_reply_survey.functions_tls.build(:language=>'en',:source_lang=>'en',:name=>'Join Survey',:description=>'Join Survey')
    csi_reply_survey.save
  end

  def self.down
  end
end
