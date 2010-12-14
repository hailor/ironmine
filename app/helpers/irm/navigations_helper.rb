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
end
