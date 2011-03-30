# -*- coding: utf-8 -*-
class InitExternalLoginsSourceType < ActiveRecord::Migration
  def self.up
    source_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'EXTERNAL_LOGIN_SOURCE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    source_type.lookup_types_tls.build(:lookup_type_id=>source_type.id,:meaning=>'SOURCE_TYPE',:description=>'SOURCE_TYPE',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    source_type.lookup_types_tls.build(:lookup_type_id=>source_type.id,:meaning=>'SOURCE_TYPE',:description=>'SOURCE_TYPE',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    source_type.save

    input_source_value=Irm::LookupValue.new(:lookup_type=>'EXTERNAL_LOGIN_SOURCE_TYPE',
                                               :lookup_code=>"Input",
                                               :start_date_active=>Time.now,
                                               :status_code=>'ENABLED',
                                               :not_auto_mult=>true)
    input_source_value.lookup_values_tls.build(:lookup_value_id=>input_source_value.id,
                                               :meaning=>'录入',:description=>'录入',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    input_source_value.lookup_values_tls.build(:lookup_value_id=>input_source_value.id,
                                               :meaning=>'Input',:description=>'Input',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    input_source_value.save

    interface_source_value=Irm::LookupValue.new(:lookup_type=>'EXTERNAL_LOGIN_SOURCE_TYPE',
                                               :lookup_code=>"Interface",
                                               :start_date_active=>Time.now,
                                               :status_code=>'ENABLED',:not_auto_mult=>true)
    interface_source_value.lookup_values_tls.build(:lookup_value_id=>interface_source_value.id,
                                                   :meaning=>'接口',:description=>'接口',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    interface_source_value.lookup_values_tls.build(:lookup_value_id=>interface_source_value.id,
                                                   :meaning=>'Interface',:description=>'Interface',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    interface_source_value.save
  end

  def self.down
  end
end
