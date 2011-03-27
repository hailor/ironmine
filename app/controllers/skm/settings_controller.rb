class Skm::SettingsController < ApplicationController
  def index
    @settings = Irm::SystemParameter.select_all.query_by_type("SKM_SETTING").collect{|p| [p[:name], p.parameter_code, p.content_type, p.value, p.id]}
  end

  def edit
    @settings = Irm::SystemParameter.select_all.query_by_type("SKM_SETTING").collect{|p| [p[:name], p.parameter_code, p.content_type, p.value, p.id]}
  end

  def update
    navi_display = Irm::SystemParameter.query_by_code("SKM_SIDEBAR_NAVI_DISPLAY").first
    file_link_display = Irm::SystemParameter.query_by_code("SKM_SIDEBAR_FILE_LINK_DISPLAY").first
    respond_to do |format|
      if navi_display.update_attribute(:value, params[:SKM_SIDEBAR_NAVI_DISPLAY]) &&
          file_link_display.update_attribute(:value, params[:SKM_SIDEBAR_FILE_LINK_DISPLAY])
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_updated)) }
      end
    end
  end
end