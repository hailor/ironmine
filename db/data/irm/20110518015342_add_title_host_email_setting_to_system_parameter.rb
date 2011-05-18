#-*- coding: utf-8 -*-
class AddTitleHostEmailSettingToSystemParameter < ActiveRecord::Migration
  def self.up
    app_title = Irm::SystemParameter.new(:parameter_code=>'APPLICATION_TITLE',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'TEXT',
                                               :value => "",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    app_title.system_parameters_tls.build(:system_parameter_id=>app_title.id,
                                               :name=>'应用标题',
                                               :description=>'应用标题',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    app_title.system_parameters_tls.build(:system_parameter_id=>app_title.id,
                                               :name=>'Application title',
                                               :description=>'Application title',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    app_title.save

    host_name = Irm::SystemParameter.new(:parameter_code=>'HOST_NAME',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'TEXT',
                                               :value => "",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    host_name.system_parameters_tls.build(:system_parameter_id=>host_name.id,
                                               :name=>'主机名',
                                               :description=>'主机名',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    host_name.system_parameters_tls.build(:system_parameter_id=>host_name.id,
                                               :name=>'Host name',
                                               :description=>'Host name',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    host_name.save

    host_path = Irm::SystemParameter.new(:parameter_code=>'HOST_PATH',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'TEXT',
                                               :value => "",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    host_path.system_parameters_tls.build(:system_parameter_id=>host_path.id,
                                               :name=>'主机地址',
                                               :description=>'主机地址',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    host_path.system_parameters_tls.build(:system_parameter_id=>host_path.id,
                                               :name=>'Host path',
                                               :description=>'Host path',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    host_path.save

    emission_email_address = Irm::SystemParameter.new(:parameter_code=>'EMISSION_EMAIL_ADDRESS',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'TEXT',
                                               :value => "",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    emission_email_address.system_parameters_tls.build(:system_parameter_id=>emission_email_address.id,
                                               :name=>'系统邮件发件人地址',
                                               :description=>'系统邮件发件人地址',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    emission_email_address.system_parameters_tls.build(:system_parameter_id=>emission_email_address.id,
                                               :name=>'Emission email address',
                                               :description=>'Emission email address',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    emission_email_address.save
  end

  def self.down
  end
end
