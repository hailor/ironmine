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
end
