# -*- coding: utf-8 -*-
module Irm::NavigationsHelper

  def sub_entries(menu_code)
    Irm::MenuManager.sub_entries_by_menu(menu_code)
  end

  def menu_by_code(menu_code)
    Irm::MenuManager.menus[menu_code]
  end

  def current_role_name
    if Irm::Person.current&&Irm::Role.current
      Irm::Role.multilingual.find(Irm::Role.current.id)[:name]
    end
  end

  # 生成一级菜单
  def list_roles
    if Irm::Person.current.nil?
      return "".html_safe
    end
    roles = Irm::Role.multilingual.not_hidden.query_by_person(Irm::Person.current.id)
    return nil unless roles&&roles.size>0
    links = ""
    roles.each do |r|
      next if Irm::Role.current&&r.id.eql?(Irm::Role.current.id)
      links << content_tag(:span,link_to(r[:name],{:controller=>"irm/navigations",:action=>"change_role",:role_id=>r.id,:top_menu=>r.menu_code}),{:class=>"menuItem"})
    end

    links.html_safe
  end
  # 生成二级菜单
  def level_two_menu
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


end
