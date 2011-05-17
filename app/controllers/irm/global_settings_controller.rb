class Irm::GlobalSettingsController < ApplicationController
  # GET /global_settings
  # GET /global_settings.xml
  def index
    @global_setting = Irm::GlobalSetting.list_all.first
    @settings = Irm::SystemParameter.select_all.query_by_type("GLOBAL_SETTING")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @global_setting }
    end
  end

  # GET /global_settings/1/edit
  def edit
    @global_setting = Irm::GlobalSetting.all.first
    @settings = Irm::SystemParameter.select_all.query_by_type("GLOBAL_SETTING")
  end


  # PUT /global_settings/1
  # PUT /global_settings/1.xml
  def update
    @global_setting = Irm::GlobalSetting.find(params[:id])
#    respond_to do |format|
#      if @global_setting.update_attributes(params[:irm_global_setting])
#        nil
#      else
#        @error = @global_setting
#        format.html { render "error_message"}
#      end
#    end
    login_page_logo = Irm::SystemParameter.query_by_code("LOGIN_PAGE_LOGO").first
    app_top_logo = Irm::SystemParameter.query_by_code("APP_TOP_LOGO").first
    respond_to do |format|
      if @global_setting.update_attributes(params[:irm_global_setting]) &&
          login_page_logo.update_attribute(:img, params[:LOGIN_PAGE_LOGO]) &&
          app_top_logo.update_attribute(:img, params[:APP_TOP_LOGO])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @global_setting.errors, :status => :unprocessable_entity }
      end
    end    
  end

  def crop
    @global_setting = Irm::GlobalSetting.all.first
    render "crop"
  end
end
