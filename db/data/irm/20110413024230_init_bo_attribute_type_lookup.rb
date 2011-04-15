# -*- coding: utf-8 -*-
class InitBoAttributeTypeLookup < ActiveRecord::Migration
  def self.up
    bo_attribute_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'BO_ATTRIBUTE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    bo_attribute_type.lookup_types_tls.build(:meaning=>'业务对像属性类型',:description=>'业务对像属性类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    bo_attribute_type.lookup_types_tls.build(:meaning=>'Business Object Attribute Type',:description=>'Business Object Attribute Type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    bo_attribute_type.save

    relation_column= Irm::LookupValue.new(:lookup_type=>'BO_ATTRIBUTE_TYPE',:lookup_code=>'RELATION_COLUMN',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    relation_column.lookup_values_tls.build(:meaning=>'关联列',:description=>'关联列',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    relation_column.lookup_values_tls.build(:meaning=>'Relation Column',:description=>'Relation Column',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    relation_column.save

    puts  relation_column.errors

    model_column= Irm::LookupValue.new(:lookup_type=>'BO_ATTRIBUTE_TYPE',:lookup_code=>'MODEL_ATTRIBUTE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    model_column.lookup_values_tls.build(:meaning=>'Model属性',:description=>'Model属性',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    model_column.lookup_values_tls.build(:meaning=>'Model Attribute',:description=>'Customer',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    model_column.save

    puts  model_column.errors


    table_column= Irm::LookupValue.new(:lookup_type=>'BO_ATTRIBUTE_TYPE',:lookup_code=>'TABLE_COLUMN',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    table_column.lookup_values_tls.build(:meaning=>'表格列',:description=>'表格列',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    table_column.lookup_values_tls.build(:meaning=>'Table Column',:description=>'Table Column',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    table_column.save

    puts  table_column.errors
  end

  def self.down
    irm_role_type=Irm::LookupType.where(:lookup_level=>'GLOBAL',:lookup_type=>'BO_ATTRIBUTE_TYPE').first

    lookup_values =  Irm::LookupValue.where(:lookup_type=>'BO_ATTRIBUTE_TYPE')
    lookup_values.each do |lv|
      lv.destroy
    end
    irm_role_type.destroy if irm_role_type
  end
end
