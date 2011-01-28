class Irm::SettingController < ApplicationController
  def index

  end

  def common
    @setting_menus = Irm::MenuManager.parent_menus_by_menu(params[:mc],session[:top_menu])+[params[:mc]]
    session[:top_menu] = @setting_menus[1] if @setting_menus[1]
  end
end
