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

  def back_url_default(default_options={})
    if params[:back_url].present?
      CGI.unescape(params[:back_url].to_s)
    else
      default_options
    end
  end

  def show_recently_object_list

    html_content = ""
    obs = Irm::RecentlyObject.where("1=1").order("updated_at DESC").limit(10)
    obs.each do |ob|
      title = eval(ob.source_type).find(ob.source_id).recently_object_name
      url_ops = eval(ob.source_type).find(ob.source_id).recently_object_url_options
      html_content << content_tag(:tr, content_tag(:td, link_to(get_list_icon + title, url_ops, {:title => title})))
    end

    raw(html_content)
  end

end
