# -*- coding: utf-8 -*-
class InitServiceChoiceType < ActiveRecord::Migration
  def self.up
    slm_choice_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SLM_CHOICE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_choice_type.lookup_types_tls.build(:lookup_type_id=>slm_choice_type.id,:meaning=>'服务选择类型',:description=>'服务选择类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type.lookup_types_tls.build(:lookup_type_id=>slm_choice_type.id,:meaning=>'Service Choice Type',:description=>'Service Choice Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type.save

    slm_choice_type_user= Irm::LookupValue.new(:lookup_type=>'SLM_CHOICE_TYPE',:lookup_code=>'USER',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_choice_type_user.lookup_values_tls.build(:lookup_value_id=>slm_choice_type_user.id,:meaning=>'用户',:description=>'用户',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type_user.lookup_values_tls.build(:lookup_value_id=>slm_choice_type_user.id,:meaning=>'User',:description=>'High',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type_user.save
    slm_choice_type_role= Irm::LookupValue.new(:lookup_type=>'SLM_CHOICE_TYPE',:lookup_code=>'Role',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_choice_type_role.lookup_values_tls.build(:lookup_value_id=>slm_choice_type_role.id,:meaning=>'角色',:description=>'角色',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type_role.lookup_values_tls.build(:lookup_value_id=>slm_choice_type_role.id,:meaning=>'Role',:description=>'Role',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_choice_type_role.save
  end

  def self.down
  end
end
