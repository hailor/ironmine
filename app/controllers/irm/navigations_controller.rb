# 用于存放IRM模块对应的菜单页面
class Irm::NavigationsController < ApplicationController
  # 顶级菜单对应的菜单页面
  def entrance
    entrance = Irm::MenuManager.menu_showable({:sub_menu_code=>"IRM_ENTRANCE_MENU"})
    redirect_to :controller => entrance[:page_controller], :action => entrance[:page_action]
  end
  # 我的工作空间
  def workspace
    
  end
  # 我的工作空间->我的主页
  def my_page
    
  end
  # 我的工作空间->我的设置
  def my_setting

  end
  # 管理
  def admin

  end
  # 管理->基础设置
  def base_setting

  end
  # 管理->基础设置
  def base_setting

  end
  # 管理->高级设置
  def advance_setting

  end
  # 管理->事件管理设置
  def icm_setting

  end

  # 公共菜单页面
  # 当菜单项没有对应的permission时，使用common页面
  def common
    @page_menus = Irm::MenuManager.parent_menus_by_menu(params[:mc])    
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
