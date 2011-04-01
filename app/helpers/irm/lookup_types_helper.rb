# -*- coding: utf-8 -*-
module Irm::LookupTypesHelper
  def available_active_status
    Irm::LookupValue.query_by_lookup_type("ACTIVE_STATUS").multilingual.collect{|m| [m[:meaning], m.lookup_code]}
#    [["启用", "ENABLED"],["失效", "OFFLINE"]]
  end

  def available_entity
    Irm::LookupValue.query_by_lookup_type("ENTITY_CODE").multilingual
  end

  def available_status
    Irm::LookupValue.query_by_lookup_type("SYSTEM_STATUS_CODE").multilingual
  end



  def available_company_type
    Irm::LookupValue.query_by_lookup_type("COMPANY_TYPE").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end

  def available_time_zone
    Irm::LookupValue.query_by_lookup_type("TIMEZONE").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end

  def available_country
    Irm::LookupValue.query_by_lookup_type("COUNTRY").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end

  def available_province
    Irm::LookupValue.query_by_lookup_type("PROVINCE").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end

  def available_city
    Irm::LookupValue.query_by_lookup_type("CITY").multilingual.collect{|i| [i[:meaning],i[:lookup_code]]}
  end

def available_external_login_source_type
    Irm::LookupValue.query_by_lookup_type("EXTERNAL_LOGIN_SOURCE_TYPE").multilingual
  end


  def available_system_yes_no
    Irm::LookupValue.query_by_lookup_type("SYSTEM_YES_NO").multilingual
  end

  def available_support_role
    Irm::LookupValue.query_by_lookup_type("IRM_SUPPORT_ROLE").multilingual
  end
end
