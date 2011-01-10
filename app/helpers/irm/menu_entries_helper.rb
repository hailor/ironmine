# -*- coding: utf-8 -*-
module Irm::MenuEntriesHelper
  def page_title(title = "", description = "")
    title_tags = ""
    if @current_menu_entry && @current_menu_entry.permission_code
      permission = Irm::Permission.list_all.where(:id => @current_permission.id).first
      if @current_menu_entry.icon
        title_tags << content_tag(:img, "", :src => '/images/s.gif', :class => @current_menu_entry.icon + " pageTitleIcon")
      end
      if title.blank?
        title_tags << title
      else
        title_tags << content_tag(:h1, "", :class => "pageType")  
      end
      if description.blank?
        title_tags << description
      else
        title_tags << content_tag(:h2, permission[:name], :class => "pageDescription")  
      end
    end
    content = raw(content_tag(:div, raw(title_tags), :class => "content"))
    pt_body = raw(content_tag(:div, content, :class => "ptBody"))
    b_page_title = raw(content_tag(:div, pt_body, :class => "bPageTitle"))
    raw(b_page_title)
  end
end