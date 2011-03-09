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

  def page_td_sep(options = {})
    content_tag(:td, raw(content_tag(:hr)), options)
  end

  def required_icon
    content_tag(:span, "*", {:style => "color:red;"})
  end

  def btn_add_icon
    content_tag(:img, "", {:class => "btn_add", :src => "/images/s.gif"})
  end

  def btn_edit_icon
    content_tag(:img, "", {:class => "btn_edit", :src => "/images/s.gif", :title => t(:edit)})
  end

  def btn_show_icon
    content_tag(:img, "", {:class => "btn_show", :src => "/images/s.gif", :title => t(:show)})
  end

  def btn_delete_icon
    content_tag(:img, "", {:class => "btn_delete", :src => "/images/s.gif", :title => t(:delete)})
  end

  def btn_remove_icon
    content_tag(:img, "", {:class => "btn_remove", :src => "/images/s.gif", :title => t(:remove)})
  end

  def icon_link_add(args = {}, block = {})
    link_to(btn_add_icon, args, {})
  end

  def icon_link_show(args = {}, block = {})
    link_to(btn_show_icon, args, {})
  end

  def icon_link_edit(args = {}, block = {})
    link_to(btn_edit_icon, args, {})
  end

  def icon_link_delete(args = {}, block = {})
    link_to(btn_delete_icon, args, {})
  end

  def icon_link_remove(*args,&block)
    link_to(btn_remove_icon, args.first,args.second,block)
  end
end