# -*- coding: utf-8 -*-
class InitBoJoinTypeLookup < ActiveRecord::Migration
  def self.up
    bo_attribute_relation_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'BO_ATTRIBUTE_RELATION_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    bo_attribute_relation_type.lookup_types_tls.build(:meaning=>'业务对像属性关联类型',:description=>'业务对像属性关联类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    bo_attribute_relation_type.lookup_types_tls.build(:meaning=>'BO Attribute Relation Type',:description=>'BO Attribute Relation Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    bo_attribute_relation_type.save

    left_outer_join= Irm::LookupValue.new(:lookup_type=>'BO_ATTRIBUTE_RELATION_TYPE',:lookup_code=>'LEFT_OUTER_JOIN',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    left_outer_join.lookup_values_tls.build(:meaning=>'左外连接',:description=>'左外连接',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    left_outer_join.lookup_values_tls.build(:meaning=>'Left Outer Join',:description=>'Left Outer Join',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    left_outer_join.save

    join= Irm::LookupValue.new(:lookup_type=>'BO_ATTRIBUTE_RELATION_TYPE',:lookup_code=>'JOIN',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    join.lookup_values_tls.build(:meaning=>'外连接',:description=>'外连接',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    join.lookup_values_tls.build(:meaning=>'Join',:description=>'Join',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    join.save

  end

  def self.down
    irm_role_type=Irm::LookupType.where(:lookup_level=>'GLOBAL',:lookup_type=>'BO_ATTRIBUTE_RELATION_TYPE').first

    lookup_values =  Irm::LookupValue.where(:lookup_type=>'BO_ATTRIBUTE_RELATION_TYPE')
    lookup_values.each do |lv|
      lv.destroy
    end
    irm_role_type.destroy if irm_role_type
  end
end
