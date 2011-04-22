# -*- coding: utf-8 -*-
class InitServiceCatalogPriority < ActiveRecord::Migration
  def self.up
    slm_catalog_priority=Irm::LookupType.new(:lookup_level=>'GLOBAL',:lookup_type=>'SLM_CATALOG_PRIORITY',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_catalog_priority.lookup_types_tls.build(:lookup_type_id=>slm_catalog_priority.id,:meaning=>'服务目录优先级',:description=>'服务目录优先级',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority.lookup_types_tls.build(:lookup_type_id=>slm_catalog_priority.id,:meaning=>'Catalog Priority',:description=>'Catalog Priority',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority.save

    slm_catalog_priority_organization= Irm::LookupValue.new(:lookup_type=>'SLM_CATALOG_PRIORITY',:lookup_code=>'HIGH',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_catalog_priority_organization.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_organization.id,:meaning=>'高',:description=>'高',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_organization.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_organization.id,:meaning=>'High',:description=>'High',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_organization.save
    slm_catalog_priority_role= Irm::LookupValue.new(:lookup_type=>'SLM_CATALOG_PRIORITY',:lookup_code=>'MIDDLE',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_catalog_priority_role.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_role.id,:meaning=>'中',:description=>'中',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_role.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_role.id,:meaning=>'Middle',:description=>'Middle',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_role.save
    slm_catalog_priority_site= Irm::LookupValue.new(:lookup_type=>'SLM_CATALOG_PRIORITY',:lookup_code=>'LOW',:start_date_active=>'2011-02-20',:status_code=>'ENABLED',:not_auto_mult=>true)
    slm_catalog_priority_site.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_role.id,:meaning=>'低',:description=>'低',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_site.lookup_values_tls.build(:lookup_value_id=>slm_catalog_priority_role.id,:meaning=>'Low',:description=>'Low',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    slm_catalog_priority_site.save
  end

  def self.down
  end
end
