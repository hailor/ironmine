# -*- coding: utf-8 -*-
module Irm::PageHelper
  def page_td_formitem(obj, options = {})
    options = options.merge({:class => "formitem"})
    content_tag(:td, obj, options)
  end

  def page_td_formlabel(obj, options = {})
    options = options.merge({:class => "formlabel"})
    content_tag(:td, obj, options)
  end
end