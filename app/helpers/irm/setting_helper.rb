# -*- coding: utf-8 -*-
module Irm::SettingHelper
  def menu_entry_name(id)
    if(id)
      Irm::MenuEntry.multilingual_colmun.query(id).first[:name]
    else
      "MenuEntry Name"
    end
  end


  # 生成设置一级菜单
  def setting_menu
    menus = @setting_menus.dup
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0],true)
    links = ""
    entries.each do |e|
      links << content_tag(:span,link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]}),{:class=>"menuItem"})
    end

    links.html_safe
  end

  # 生成左侧菜单
  def sidebar_menu
    # 当前页面选中的权限
    # 将controller的index也加入选中列表
    permssions = []
    permssions << Irm::MenuManager.permission_by_url(params[:controller],params[:action])[:permission_code].downcase if  Irm::MenuManager.permission_by_url(params[:controller],params[:action]||"index")
    permssions << Irm::MenuManager.permission_by_url(params[:controller],"index")[:permission_code].downcase if  Irm::MenuManager.permission_by_url(params[:controller],"index")
    # 当前页面对应的菜单
    menus = @setting_menus.dup
    #如果菜单菜单中只有一个菜单则返回
    return nil unless menus&&menus.size>1
    parent_menu_code = menus[1]
    content = content_tag(:div, content_tag(:div, raw(content_tag(:img,"", {:width => 205, :height => 1, :title => "", :src => "/images/s.gif"}) + generate_sidebar_menu(parent_menu_code)), {:id => "AutoNumber5"}),{:id=>"MenuNavTree",:class=>"mTreeSelection"})
    script = %Q(
      GY.use("irm",function(Y){
        var current_permissions = [#{permssions.collect{|x| "'#{x}'"}.join(",")}];
        var current_menus = [#{menus.collect{|x| "'#{x.downcase}'"}.join(",")}];
        Y.irm.navTree("MenuNavTree",current_permissions,current_menus);
      });
    )
    (content+javascript_tag(script)).html_safe
  end

  # 递归生成子菜单
  def generate_sidebar_menu(menu_code,level=1)
    next_level = level+1
    info = ""
    entries = Irm::MenuManager.sub_entries_by_menu(menu_code,true)
    functions = ""
    if level == 1
      entries.each do |e|
        functions << content_tag(:div,content_tag(:h2,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id],:level=>1},{:title=>e[:description], :class => "setupSection"})),{:class=>"setupNavtree"})
        if(e[:entry_type].eql?("MENU"))
          functions << content_tag(:div,generate_sidebar_menu(e[:menu_code],next_level),{:id=>"#{e[:menu_code].downcase}_child"})
        end
      end
    else
      entries.each do |e|
        if(e[:entry_type].eql?("MENU"))
          icon_link = link_to("",{},{:href=>"javascript:void(0)",:real=>"#{e[:menu_code].downcase}",:class=>"NavIconLink NavTreeCol",:id=>"#{e[:menu_code].downcase}_icon"})
          font_link = link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]},{:title=>e[:description],:class=>"setupFolder",:id=>"#{e[:menu_code].downcase}_font"})
          child_div = content_tag(:div,generate_sidebar_menu(e[:menu_code],next_level),{:style=>"display:none;",:class=>"childContainer",:id=>"#{e[:menu_code].downcase}_child"})
          functions << content_tag(:div,icon_link+font_link+child_div,{:mi=>"#{e[:menu_code].downcase}",:class=>"parent",:id=>"#{e[:menu_code].downcase}"})
        else
          functions << content_tag(:div,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action]}),{:mi=>"#{e[:permission_code].downcase}",:class=>"setupLeaf"})
        end
      end
    end
    functions.html_safe
  end

  # 展开菜单下的 子项
  def generate_entries_table(menu_code)
    return nil unless menu_code
    entries = Irm::MenuManager.sub_entries_by_menu(menu_code,true)
    odd_index = (0..entries.length).reject{|i| i%2 ==1}
    content = ""
    odd_index.each do |i|
      tr = ""
      e = entries[i]
      tr << content_tag(:td,("•"+link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]})).html_safe,{:width=>"50%"}) if e
      e = entries[i+1]
      tr << content_tag(:td,("•"+link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action],:mc=>e[:menu_code],:mi=>e[:menu_entry_id]})).html_safe,{:width=>"50%"}) if e
      content << content_tag(:tr,tr.html_safe)
    end
    raw content

  end


  # 展开菜单子项
  def generate_entries_table_ext(entry)
    if(entry[:entry_type].eql?("MENU"))
       generate_entries_table(entry[:menu_code])
    else
      tr = content_tag(:td,("•"+link_to(entry[:description],{:controller=>entry[:page_controller],:action=>entry[:page_action],:mc=>entry[:menu_code],:mi=>entry[:menu_entry_id]})).html_safe,{:width=>"50%"}) if entry
      content_tag(:tr,tr.html_safe).html_safe
    end
  end
end
