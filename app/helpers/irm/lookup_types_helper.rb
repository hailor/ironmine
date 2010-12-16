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

  def available_condition
    Irm::Condition.query_by_status_code("ENABLED").multilingual
  end

  def available_action
    Irm::Action.query_by_status_code("ENABLED").multilingual
  end

  def available_company_type
    Irm::LookupValue.query_by_lookup_type("COMPANY_TYPE").multilingual
  end

  def available_time_zone
    Irm::LookupValue.query_by_lookup_type("TIMEZONE").multilingual
  end

  def available_mail_template
    Irm::MailTemplate.query_by_status_code("ENABLED").multilingual
  end

end
