# 用于存放IRM模块对应的菜单页面
class Irm::NavigationsController < ApplicationController
  layout "menu"
  #顶级菜单对应的菜单页面
  def entrance

  end
  #我的工作空间对应的菜单页面
  def workspace
    
  end
  #我的主页对应的菜单页面
  def my_page
    
  end

  def my_setting

  end
end
