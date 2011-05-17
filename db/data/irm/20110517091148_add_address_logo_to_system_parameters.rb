#-*- coding: utf-8 -*-
class AddAddressLogoToSystemParameters < ActiveRecord::Migration
  def self.up
    address_logo = Irm::SystemParameter.new(:parameter_code=>'ADDRESS_BAR_LOGO',
                                               :content_type=>'GLOBAL_SETTING',
                                               :data_type=>'IMAGE',
                                               :value => "Y",
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    address_logo.system_parameters_tls.build(:system_parameter_id=>address_logo.id,
                                               :name=>'地址栏LOGO',
                                               :description=>'地址栏LOGO',
                                               :language=>'zh',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    address_logo.system_parameters_tls.build(:system_parameter_id=>address_logo.id,
                                               :name=>'Address bar logo',
                                               :description=>'Address bar logo',
                                               :language=>'en',
                                               :status_code=>'ENABLED',
                                               :source_lang=>'en')
    address_logo.save
  end

  def self.down
  end
end
