# -*- coding: utf-8 -*-
module Irm::LookupTypesHelper
  def available_active_status
    [["启用", "ENABLED"],["失效", "OFFLINE"]]
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

end
