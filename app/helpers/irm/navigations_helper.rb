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
    Irm::MenuManager.roles[@page_menus[0]][I18n.locale.to_sym][:description]
  end

  # 生成一级菜单
  def level_one_menu
    roles = Irm::Person.current.allowed_roles.collect{|r| r if r[:role_type].eql?("BUSSINESS")}.compact
    return nil unless roles&&roles.size>0
    links = ""
    roles.each do |r|
      next if r[:role_code].eql?(@page_menus[0])
      role = Irm::MenuManager.roles[r[:role_code]]
      url = Irm::MenuManager.role_showable(r[:role_code])
      links << content_tag(:span,link_to(role[I18n.locale][:description],{:controller=>url[:page_controller],:action=>url[:page_action],:mc=>role[:menu_code],:top_role=>role[:role_code]}),{:class=>"menuItem"}) if url
    end

    links.html_safe
  end
  # 生成二级菜单
  def level_two_menu
    menus = @page_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[1])

    tds = ""

    entries.each do |e|
      style = ""
      style = "currentTab" if e[:menu_code].eql?(menus[2]||"NO_MENU")
      tds << content_tag(:td,content_tag(:div,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]},{:title=>e[:description]})),{:class=>style,:nowrap=>"nowrap"})
    end
    tds.html_safe

  end


end
