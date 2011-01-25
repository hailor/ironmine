class Irm::SettingController < ApplicationController
  def index

  end

  def common
    @setting_menus = Irm::MenuManager.parent_menus_by_menu(params[:mc])+[params[:mc]]
  end
end
