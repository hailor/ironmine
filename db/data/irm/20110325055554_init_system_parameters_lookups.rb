# -*- coding: utf-8 -*-
class InitSystemParametersLookups < ActiveRecord::Migration
  def self.up
    irm_sys_para_content_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_SYS_PARA_CONTENT_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_content_type.lookup_types_tls.build(:lookup_type_id=>irm_sys_para_content_type.id,:meaning=>'参数类型',:description=>'参数类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_type.lookup_types_tls.build(:lookup_type_id=>irm_sys_para_content_type.id,:meaning=>'Parameter Content Type',:description=>'Parameter Content Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_type.save
    irm_sys_para_data_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_type.lookup_types_tls.build(:lookup_type_id=>irm_sys_para_data_type.id,:meaning=>'参数数据类型',:description=>'参数数据类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_type.lookup_types_tls.build(:lookup_type_id=>irm_sys_para_data_type.id,:meaning=>'Parameter Data Type',:description=>'Parameter Data Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_type.save

    irm_sys_para_content_typeglobal_setting= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_CONTENT_TYPE',:lookup_code=>'GLOBAL_SETTING',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_content_typeglobal_setting.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_content_typeglobal_setting.id,:meaning=>'全局设置',:description=>'全局设置',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_typeglobal_setting.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_content_typeglobal_setting.id,:meaning=>'Global setting',:description=>'Global setting',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_typeglobal_setting.save
    irm_sys_para_content_typeskm_setting= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_CONTENT_TYPE',:lookup_code=>'SKM_SETTING',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_content_typeskm_setting.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_content_typeskm_setting.id,:meaning=>'知识库设置',:description=>'知识库设置',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_typeskm_setting.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_content_typeskm_setting.id,:meaning=>'Service knowledge setting',:description=>'Service knowledge setting',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_content_typeskm_setting.save
  end

  def self.down
  end
end
