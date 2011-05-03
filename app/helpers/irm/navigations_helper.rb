# -*- coding: utf-8 -*-
module Irm::NavigationsHelper

  def sub_entries(menu_code)
    Irm::MenuManager.sub_entries_by_menu(menu_code)
  end

  def menu_by_code(menu_code)
    Irm::MenuManager.menus[menu_code]
  end

  # 生成二级菜单
  def level_two_menu
    return unless @page_menus
    menus = @page_menus.dup
    return nil unless menus&&menus.size>0
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0])

    tds = ""

    entries.each do |e|
      style = ""
      style = "currentTab" if e[:menu_code].eql?(menus[1]||"NO_MENU")
      tds << content_tag(:td,content_tag(:div,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action],:top_menu=>e[:menu_code],:mi=>e[:menu_entry_id]},{:title=>e[:description]})),{:class=>style,:nowrap=>"nowrap"})
    end
    tds.html_safe

  end

  def function_nav(menu_code)
    render :partial=>"irm/navigations/function_nav",:locals=>{:menu_code=>menu_code}
  end


end
