# -*- coding: utf-8 -*-
class WfFieldUpdateValueTypeLookup < ActiveRecord::Migration
  def self.up
    wf_field_update_value_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'WF_FIELD_UPDATE_VALUE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_field_update_value_type.lookup_types_tls.build(:lookup_type_id=>wf_field_update_value_type.id,:meaning=>'工作流字段更新值类型',:description=>'工作流字段更新值类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_type.lookup_types_tls.build(:lookup_type_id=>wf_field_update_value_type.id,:meaning=>'Workflow field update value type',:description=>'Workflow field update value type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_type.save
    wf_field_update_value_typenull_value= Irm::LookupValue.new(:lookup_type=>'WF_FIELD_UPDATE_VALUE_TYPE',:lookup_code=>'NULL_VALUE',:start_date_active=>'2011-03-05',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_field_update_value_typenull_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typenull_value.id,:meaning=>'空值(null)',:description=>'空值(null)',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typenull_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typenull_value.id,:meaning=>'Null Vaule',:description=>'Null Vaule',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typenull_value.save
    wf_field_update_value_typeformula_value= Irm::LookupValue.new(:lookup_type=>'WF_FIELD_UPDATE_VALUE_TYPE',:lookup_code=>'FORMULA_VALUE',:start_date_active=>'2011-03-06',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_field_update_value_typeformula_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typeformula_value.id,:meaning=>'使用公式设置新值',:description=>'使用公式设置新值',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typeformula_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typeformula_value.id,:meaning=>'Formula Value',:description=>'Formula Value',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typeformula_value.save
    wf_field_update_value_typeoptions_value= Irm::LookupValue.new(:lookup_type=>'WF_FIELD_UPDATE_VALUE_TYPE',:lookup_code=>'OPTIONS_VALUE',:start_date_active=>'2011-03-07',:status_code=>'ENABLED',:not_auto_mult=>true)
    wf_field_update_value_typeoptions_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typeoptions_value.id,:meaning=>'从列中选择新值',:description=>'从列中选择新值',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typeoptions_value.lookup_values_tls.build(:lookup_value_id=>wf_field_update_value_typeoptions_value.id,:meaning=>'Options Value',:description=>'Options Value',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    wf_field_update_value_typeoptions_value.save
  end

  def self.down
  end
end
