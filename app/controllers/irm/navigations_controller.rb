# 用于存放IRM模块对应的菜单页面
class Irm::NavigationsController < ApplicationController
    layout "navigations"
    skip_before_filter :check_permission,:menu_setup, :menu_entry_setup
  # 顶级菜单对应的菜单页面
  def index
    redirect_entrance
  end

  def change_role
    session[:role_id] = params[:role_id] if params[:role_id]
    Irm::Role.current= Irm::Role.enabled.find(session[:role_id])
    session[:top_menu] = params[:top_menu] if params[:top_menu]
    redirect_entrance
  end

  def access_deny
    
  end

  def combo
    contents = ""
    params.keys.each do |k|
     next unless k.to_s.end_with?(".js")||k.to_s.end_with?(".css")
     contents << IO.read("#{Rails.root}/public#{k.to_s}")
    end
    render :text=> contents
  end

end
