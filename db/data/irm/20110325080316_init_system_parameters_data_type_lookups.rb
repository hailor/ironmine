# -*- coding: utf-8 -*-
class InitSystemParametersDataTypeLookups < ActiveRecord::Migration
  def self.up
    irm_sys_para_data_typefile= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'FILE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typefile.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typefile.id,:meaning=>'文件',:description=>'文件',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typefile.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typefile.id,:meaning=>'File',:description=>'File',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typefile.save
    irm_sys_para_data_typetext= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'TEXT',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typetext.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typetext.id,:meaning=>'文本',:description=>'文本',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typetext.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typetext.id,:meaning=>'Text',:description=>'Text',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typetext.save
    irm_sys_para_data_typetext_area= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'TEXT_AREA',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typetext_area.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typetext_area.id,:meaning=>'多行文本',:description=>'多行文本',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typetext_area.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typetext_area.id,:meaning=>'Text Area',:description=>'Text Area',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typetext_area.save
    irm_sys_para_data_typeselect= Irm::LookupValue.new(:lookup_type=>'IRM_SYS_PARA_DATA_TYPE',:lookup_code=>'SELECT',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_sys_para_data_typeselect.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typeselect.id,:meaning=>'下拉列表',:description=>'下拉列表',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typeselect.lookup_values_tls.build(:lookup_value_id=>irm_sys_para_data_typeselect.id,:meaning=>'Combo Box',:description=>'Combo Box',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_sys_para_data_typeselect.save
  end

  def self.down
  end
end
