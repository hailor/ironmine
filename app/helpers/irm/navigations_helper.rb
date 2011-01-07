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

  def breadcrumbs
    links = ""
    pre_entry = Irm::MenuEntry.multilingual.query(params[:pre_entry_id]).first
    current_entry = Irm::MenuEntry.multilingual.query(params[:menu_entry_id]).first
    pre_entry_url = Irm::MenuManager.permission_url_options(pre_entry[:permission_code])
    current_entry_url = Irm::MenuManager.permission_url_options(current_entry[:permission_code])
    links << (link_to(pre_entry[:name],{:menu_entry_id=>params[:pre_entry_id],
                                        :controller=>pre_entry_url[:page_controller],
                                        :action=>pre_entry_url[:page_action],
                                        :menu_code=>pre_entry[:sub_menu_code]},:zone=>"toptoolbarcontent")).html_safe
    links << ">"
    links << (link_to(current_entry[:name],{:controller=>current_entry_url[:page_controller],
                                            :action=>current_entry_url[:page_action],
                                            :menu_entry_id=>params[:menu_entry_id],
                                            :pre_entry_id=>params[:pre_entry_id],
                                            :menu_code=>current_entry[:sub_menu_code]},
                                            :zone=>"secondtoolbarcontent")).html_safe
    content_tag(:div,links.html_safe,{:class=>"breadcrumbs",:id=>"breadcrumbs"}).html_safe
  end

  def page_functions(menu_code)
    return nil unless menu_code
    generate_functions(menu_code)
  end

  def generate_functions(menu_code)
    info = ""
    if menu_code.is_a?(Hash)
      info << content_tag(:h2,menu_code[:name],{:class=>"menutitle"})
      menu_code = menu_code[:menu_code]
    end
    entries = Irm::MenuManager.sub_entries_by_menu(menu_code)
    functions = ""
    entries.each do |e|
      if(e[:entry_type].eql?("MENU"))
        functions<<content_tag(:span,generate_functions(e),{:class=>"menuitem"}).html_safe
      else
        functions<<content_tag(:span,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action]},{:zone=>"system_content",:title=>e[:description]}),{:class=>"menuitem"}).html_safe
      end
    end
    info << content_tag(:div,functions.html_safe,{:class=>"meuncontent"})
    content_tag(:div,info.html_safe,{:class=>"menu"}).html_safe
  end


  def level_one_menu

    menus = Irm::MenuManager.menus_by_permission({:page_controller=>params[:controller]})
    return nil unless menus&&menus.size>1
    entries = Irm::MenuManager.sub_entries_by_menu(menus[0])
    menu_id = "#{menus[0].downcase}_menu"

    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[1])}

    lis = ""
    entries.each do |e|
      next if e[:menu_code].eql?(menus[1])
      lis << content_tag(:li,link_to(e[:description],{:controller=>e[:page_controller],:action=>e[:page_action]},{:class=>"yui3-menuitem-content"}),{:class=>"yui3-menuitem"})
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

  def level_two_menu
    menus = Irm::MenuManager.menus_by_permission({:page_controller=>params[:controller]})
    return nil unless menus&&menus.size>2
    entries = Irm::MenuManager.sub_entries_by_menu(menus[1])

    current_entries = entries.detect{|e| e[:menu_code].eql?(menus[2])}

    tds = ""

    entries.each do |e|
      style = ""
      style = "currentTab" if e[:menu_code].eql?(menus[2])
      tds << content_tag(:td,content_tag(:div,link_to(e[:name],{:controller=>e[:page_controller],:action=>e[:page_action]},{:title=>e[:description]})),{:class=>style,:nowrap=>"nowrap"})
    end
    tds.html_safe

  end

  def sidebar_menu
    
  end
end
