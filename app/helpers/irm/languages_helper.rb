# -*- coding: utf-8 -*-
module Irm::LanguagesHelper
  def available_status
    [["归档", "ARCHIVE"],["删除", "DELETE"],["启用", "ENABLED"],["已过时", "OBSOLETE"],["离线", "OFFLINE"],["建议", "PROPOSED"]]
  end
end
