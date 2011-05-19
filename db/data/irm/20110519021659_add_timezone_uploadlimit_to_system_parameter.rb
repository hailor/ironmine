# -*- coding: utf-8 -*-
class AddTimezoneUploadlimitToSystemParameter < ActiveRecord::Migration
  def self.up
    irm_sys_para_data_typenumber= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'NUMBER',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typenumber.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typenumber.id,:meaning=>'数字',:description=>'数字',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typenumber.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typenumber.id,:meaning=>'Number',:description=>'Number',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typenumber.save

    time_zone = Irm::SystemParameter.new(:parameter_code=>'TIMEZONE',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'SELECT',
                                               :value => 'GMT_P0800_6',
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    time_zone.system_parameters_tls.build(:system_parameter_id=>time_zone.id,
                                               :name=>'时区',
                                               :description=>'时区',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    time_zone.system_parameters_tls.build(:system_parameter_id=>time_zone.id,
                                               :name=>'Timezone',
                                               :description=>'Timezone',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    time_zone.save

    upload_file_limit = Irm::SystemParameter.new(:parameter_code=>'UPLOAD_FILE_LIMIT',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'NUMBER',
                                               :value => '10000',
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    upload_file_limit.system_parameters_tls.build(:system_parameter_id=>upload_file_limit.id,
                                               :name=>'上传文件大小限制(KB)',
                                               :description=>'上传文件大小限制(KB)',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    upload_file_limit.system_parameters_tls.build(:system_parameter_id=>upload_file_limit.id,
                                               :name=>'Upload file limit(KB)',
                                               :description=>'Upload file limit(KB)',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    upload_file_limit.save
  end

  def self.down
  end
end
