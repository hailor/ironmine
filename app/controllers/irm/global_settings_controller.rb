class Irm::GlobalSettingsController < ApplicationController
  # GET /global_settings
  # GET /global_settings.xml
  def index
    @global_setting = Irm::GlobalSetting.list_all.first

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
#    respond_to do |format|
#      if @global_setting.update_attributes(params[:irm_global_setting])
#        nil
#      else
#        @error = @global_setting
#        format.html { render "error_message"}
#      end
#    end
    respond_to do |format|
      if @global_setting.update_attributes(params[:irm_global_setting])
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
