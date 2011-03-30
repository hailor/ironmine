class Irm::SettingController < ApplicationController
  def index

  end

  def common
    self.class.layout "setting"
    @setting_menus = Irm::MenuManager.parent_menus_by_menu(params[:mc],session[:top_menu])+[params[:mc]]
    session[:top_role] = @setting_menus[0] if @setting_menus[0]
  end
end
