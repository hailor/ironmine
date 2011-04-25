class Irm::WfSettingsController < ApplicationController
  # GET /wf_settings
  # GET /wf_settings.xml
  def index
    redirect_to({:action => "edit"})
  end

  # GET /wf_settings/1/edit
  def edit
    @wf_setting = Irm::WfSetting.first
    @wf_setting = Irm::WfSetting.create unless @wf_setting
  end

  # PUT /wf_settings/1
  # PUT /wf_settings/1.xml
  def update
    @wf_setting = Irm::WfSetting.first

    respond_to do |format|
      if @wf_setting.update_attributes(params[:irm_wf_setting])
        format.html { redirect_to({:action => "edit"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_setting.errors, :status => :unprocessable_entity }
      end
    end
  end

end
