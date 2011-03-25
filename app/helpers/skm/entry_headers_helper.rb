module Skm::EntryHeadersHelper
  def show_last_ten_entry_header
    entry_headers = Skm::EntryHeader.list_all.published.current_entry.order("updated_at DESC").limit(10)
    html_content = ""
    entry_headers.each do |e|
      html_content << content_tag(:tr, content_tag(:td, link_to(e.entry_title, {:controller => "skm/entry_headers", :action => "show", :id => e.id})))
    end
    raw(html_content)
  end

  def show_skm_sidebar_navigate
    setting = Skm::Setting.where("1=1").first
    html_content = ""
    base_content = ""
    if Skm::Setting.where("1=1").first.sidebar_flag == Irm::Constant::SYS_YES

      if setting.sidebar_file_menu_flag == Irm::Constant::SYS_YES
        html_content << content_tag(:tr, content_tag(:td, link_to(t(:label_skm_file_management), {:controller => "skm/file_managements", :action => "index"})))
      end

      base_content = content_tag(:div,
                                 content_tag(:div,
                                             content_tag(:h2,  t(:label_skm_navigate_menu)),
                                             :class => "sidebarModuleHeader") +
                                     content_tag(:div, content_tag(:table, content_tag(:tbody, raw(html_content))), :class => "sidebarModuleBody"),
                                 :class => "sidebarModule")
    end
    raw(base_content)
  end
end