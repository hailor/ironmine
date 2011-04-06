# -*- coding: utf-8 -*-
class AlterRoleTypeLookup < ActiveRecord::Migration
  def self.up
    irm_role_type=Irm::LookupType.where(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_ROLE_TYPE').first
    irm_role_type.destroy if irm_role_type
    lookup_values =  Irm::LookupValue.where(:lookup_type=>'IRM_ROLE_TYPE')
    lookup_values.each do |lv|
      lv.destroy
    end

    irm_role_type=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'IRM_ROLE_TYPE',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_type.lookup_types_tls.build(:lookup_type_id=>irm_role_type.id,:meaning=>'角色类型',:description=>'角色类型',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_type.lookup_types_tls.build(:lookup_type_id=>irm_role_type.id,:meaning=>'Role type',:description=>'Role type',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_type.save

    irm_role_typehelp_desk= Irm::LookupValue.new(:lookup_type=>'IRM_ROLE_TYPE',:lookup_code=>'HELP_DESK',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_typehelp_desk.lookup_values_tls.build(:meaning=>'服务台',:description=>'服务台',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typehelp_desk.lookup_values_tls.build(:meaning=>'Help Desk',:description=>'Help Desk',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typehelp_desk.save

    irm_role_typecustomer= Irm::LookupValue.new(:lookup_type=>'IRM_ROLE_TYPE',:lookup_code=>'CUSTOMER',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_role_typecustomer.lookup_values_tls.build(:meaning=>'客户',:description=>'客户',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typecustomer.lookup_values_tls.build(:meaning=>'Customer',:description=>'Customer',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_role_typecustomer.save

  end

  def self.down
  end
end
