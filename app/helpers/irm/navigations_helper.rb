# -*- coding: utf-8 -*-
module Irm::NavigationsHelper
  def menu_entry_name(id)
    if(id)
      Irm::MenuEntry.multilingual_colmun.query(id).first[:name]
    else
      "MenuEntry Name"
    end
  end

  def sub_entries(menu_code)
    Irm::MenuManager.sub_entries_by_menu(menu_code)
  end

  def menu_by_code(menu_code)
    Irm::MenuManager.menus[menu_code]
  end

  def level_one_current_name
    menus = @page_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0])
    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[1])}
    current_entries[:name]
  end

  # 生成一级菜单
  def level_one_menu
    menus = @page_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0])
    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[1])}
    links = ""
    entries.each do |e|
      next if e[:menu_code].eql?(menus[1])
      links << content_tag(:span,link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]}),{:class=>"menuItem"})
    end

    links.html_safe
  end
  # 生成二级菜单
  def level_two_menu
    menus = @page_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[1])

    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[2]||"NO_MENU")}

    tds = ""

    entries.each do |e|
      style = ""
      style = "currentTab" if e[:menu_code].eql?(menus[2]||"NO_MENU")
      tds << content_tag(:td,content_tag(:div,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]},{:title=>e[:description]})),{:class=>style,:nowrap=>"nowrap"})
    end
    tds.html_safe

  end


end
