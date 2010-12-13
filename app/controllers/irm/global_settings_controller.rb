class Irm::GlobalSettingsController < ApplicationController
  # GET /global_settings
  # GET /global_settings.xml
  def index
    @global_setting = Irm::GlobalSetting.all.first

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @global_setting }
    end
  end

  # GET /global_settings/1/edit
  def edit
    @global_setting = Irm::GlobalSetting.all.first
  end


  # PUT /global_settings/1
  # PUT /global_settings/1.xml
  def update
    @global_setting = Irm::GlobalSetting.find(params[:id])
    respond_to do |format|
      if @global_setting.update_attributes(params[:irm_global_setting])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
        format.js do
          puts("++++++++++++++++++++++ format.js")
          responds_to_parent do
            puts("++++++++++++++++++++++ responds_to_parent do")
            render :update do |page|
              puts("++++++++++++++++++++++ render update")
              page.replace_html :logo, image_tag(@global_setting.logo.url(:medium))
              page[:edit_setting_form].reset
            end
          end
        end
      else
        @error = @global_setting
        format.html { render "error_message" }
      end      
    end
  end

end
