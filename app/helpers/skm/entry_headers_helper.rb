module Skm::EntryHeadersHelper
  def show_last_ten_entry_header
    entry_headers = Skm::EntryHeader.list_all.published.current_entry.order("updated_at DESC").limit(10)
    html_content = ""
    entry_headers.each do |e|
      html_content << content_tag(:tr,
                                  content_tag(:td, link_to(get_list_icon + e.entry_title, {:controller => "skm/entry_headers", :action => "show", :id => e.id}, {:title => e.entry_title})))
    end
    raw(html_content)
  end

  def show_skm_sidebar_navigate
    html_content = ""
    base_content = ""
    if Irm::SystemParameter.query_by_code("SKM_SIDEBAR_NAVI_DISPLAY").first.value == Irm::Constant::SYS_YES

      if Irm::SystemParameter.query_by_code("SKM_SIDEBAR_FILE_LINK_DISPLAY").first.value == Irm::Constant::SYS_YES
        html_content << content_tag(:tr, content_tag(:td, link_to(raw(get_img_icon("img1", {:class => "mruIcon", :title => t(:label_incident_request)}, "Small")) + t(:label_skm_file_management), {:controller => "skm/file_managements", :action => "index"})))
      end
      #显示 我的收藏
      html_content << content_tag(:tr, content_tag(:td, link_to(raw(get_img_icon("img18", {:class => "mruIcon", :title => t(:label_skm_entry_header_my_favorites)}, "Small")) + t(:label_skm_entry_header_my_favorites), {:controller => "skm/entry_headers", :action => "my_favorites"})))
      #显示 我的草稿
      html_content << content_tag(:tr, content_tag(:td, link_to(raw(get_img_icon("img6", {:class => "mruIcon", :title => t(:label_incident_request)}, "Small")) + t(:label_skm_my_drafts), {:controller => "skm/entry_headers", :action => "my_drafts"})))
      base_content = content_tag(:div,
                                 content_tag(:div,
                                             content_tag(:h2,  t(:label_skm_navigate_menu)),
                                             :class => "sidebarModuleHeader") +
                                     content_tag(:div, content_tag(:table, content_tag(:tbody, raw(html_content))), :class => "sidebarModuleBody"),
                                 :class => "sidebarModule")


    end
    raw(base_content)
  end

  def list_exist_attachments_during_create(attachments)
    html = ""
    if attachments && attachments.any?
      attachments.each do |a|
        d1 = content_tag(:td, "", :class => "dataCol")
        d2 = content_tag(:td, link_to(t(:delete), {:controller => "skm/entry_headers", :action => "remove_exits_attachment_during_create", :att_id => a.latest_version_id}, :remote => "true"), :class => "dataCol")
        d3 = content_tag(:td, a.file_name, :class => "dataCol")
        d4 = content_tag(:td, a.category_name, :class => "dataCol")
        d5 = content_tag(:td, a.description, :class => "dataCol")
        r = content_tag(:tr, d1 + d2 + d3 + d4 + d5)
        html << r
      end
    end
    raw(html)
  end
end