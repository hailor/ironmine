# -*- coding: utf-8 -*-
class AddLogoSettingToSystemParameters < ActiveRecord::Migration
  def self.up
    irm_sys_para_data_typeimage= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'IMAGE',:start_date_active=>'2011-05-11',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typeimage.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typeimage.id,:meaning=>'图片',:description=>'图片',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typeimage.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typeimage.id,:meaning=>'Image',:description=>'Image',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typeimage.save
  end

  def self.down
  end
end
