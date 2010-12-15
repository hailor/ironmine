# -*- coding: utf-8 -*-
module Irm::CommonHelper
  def echo
    "返回中文"
  end

  def get_global_icon
    Irm::GlobalSetting.all.first.logo.url(:original);
  end
end
