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
    system_parameters = Irm::SystemParameter.query_by_type("GLOBAL_SETTING")

    respond_to do |format|
      if true

        system_parameters.each do |s|
          if s.data_type == "IMAGE"
            if params[s[:parameter_code].to_sym] && !params[s[:parameter_code].to_sym].blank?
                s.update_attribute(:img, params[s[:parameter_code].to_sym])

            end
          elsif s.data_type == "TEXT"
            if params[s[:parameter_code].to_sym]
              s.update_attribute(:value, params[s[:parameter_code].to_sym])
            end
          else
            if params[s[:parameter_code].to_sym]
              s.update_attribute(:value, params[s[:parameter_code].to_sym])
            end
          end
        end
        #重置系统设置缓存
        Irm::SystemParametersManager.reset_system_parameters

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
