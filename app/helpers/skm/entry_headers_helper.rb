module Skm::EntryHeadersHelper
  def show_last_ten_entry_header
    entry_headers = Skm::EntryHeader.list_all.published.current_entry.order("updated_at DESC").limit(10)
    html_content = ""
    entry_headers.each do |e|
      html_content << content_tag(:tr, content_tag(:td, link_to(e.entry_title, {:controller => "skm/entry_headers", :action => "show", :id => e.id})))
    end
    raw(html_content)
  end
end