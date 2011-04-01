# -*- coding: utf-8 -*-
module Irm::CommonHelper
  def echo
    "返回中文"
  end

  def get_global_icon
    Irm::GlobalSetting.all.first.logo.url(:original);
  end

  #用户登录时会传入back_url参数,下面的函数用来将back_url包装成隐藏字段
  def back_url_hidden_field_tag
    #back_url = params[:back_url] || request.env['HTTP_REFERER']
    back_url = params[:back_url]
    back_url = CGI.unescape(back_url.to_s)
    hidden_field_tag('back_url', CGI.escape(back_url)) unless back_url.blank?
  end

  def show_recently_object_list
    result_list = []
    entry_headers = Skm::EntryHeader.list_all.published.current_entry.order("updated_at DESC").limit(10)
    surveys = Csi::Survey.find_recently_ten
    entry_headers.each do |eh|
      result_list << {:controller => "skm/entry_headers", :action => "show", :id => eh.id, :title => eh.entry_title, :updated_at => eh.updated_at}
    end
    surveys.each do |sv|
      result_list << {:controller => "csi/surveys", :action => "show", :id => sv.id, :title => sv.title, :updated_at => sv.updated_at}
    end

    result_list = result_list.sort{|x, y| y[:updated_at] <=> x[:updated_at] }
    html_content = ""
    counter = 0
    result_list.each do |e|
      html_content << content_tag(:tr, content_tag(:td, link_to(get_list_icon + e[:title], {:controller => e[:controller], :action => e[:action], :id => e[:id]}, {:title => e[:title]})))
      break if (counter += 1) == 10
    end

    raw(html_content)
  end
end
