# -*- coding: utf-8 -*-
module Irm::LookupTypesHelper
  def available_active_status
    [["启用", "ENABLED"],["失效", "OFFLINE"]]
  end    
end
