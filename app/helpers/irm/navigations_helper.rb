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

  # 生成一级菜单
  def level_one_menu
    menus = @page_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0])
    menu_id = "#{menus[0].downcase}_menu"

    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[1])}

    lis = ""
    entries.each do |e|
      next if e[:menu_code].eql?(menus[1])
      lis << content_tag(:li,link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id],:level=>1},{:class=>"yui3-menuitem-content"}),{:class=>"yui3-menuitem"})
    end

    menu_content = content_tag(:div,content_tag(:div,content_tag(:ul,lis.html_safe),{:class=>"yui3-menu-content"}),{:id=>"#{menus[0].downcase}",:class=>"yui3-menu"})
    menus_label = link_to(content_tag(:em,current_entries[:name]),{},{:href=>"##{menus[0].downcase}",:class=>"yui3-menu-label"})

    menu = content_tag(:div,content_tag(:div,content_tag(:ul,content_tag(:li,menus_label+menu_content),{:class=>"first-of-type"}),{:class=>"yui3-menu-content"}),{:style=>"display:none",:id=>"#{menu_id}",:class=>"yui3-menu yui3-menu-horizontal yui3-menubuttonnav"}).html_safe
    script = %Q(GY.use('node-menunav', function(Y) {
        var menu = Y.one("##{menu_id}");
        menu.plug(Y.Plugin.NodeMenuNav,{ autoSubmenuDisplay: false, mouseOutHideDelay: 0 });
        menu.setStyle("display","block");
    });)
    (menu+javascript_tag(script)).html_safe

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
