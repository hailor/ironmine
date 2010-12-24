class Icm::IncidentStatusesController < ApplicationController
  def index
    @incident_status = Icm::IncidentStatus.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_status }
    end
  end

  def show
    @incident_status = Icm::IncidentStatus.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident_status }
    end
  end

  def new
    @incident_status = Icm::IncidentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_status }
    end
  end

  def edit
    @incident_status = Icm::IncidentStatus.multilingual.find(params[:id])
  end

  def create
    @incident_status = Icm::IncidentStatus.new(params[:icm_incident_status])
    respond_to do |format|
      if @incident_status.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @incident_status
         format.html { render "error_message" }
      end
    end
  end

  def update
    @incident_status = Icm::IncidentStatus.find(params[:id])

    respond_to do |format|
      if @incident_status.update_attributes(params[:icm_incident_status])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @incident_status
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @incident_status = Icm::IncidentStatus.find(params[:id])
    @incident_status.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @incident_status = Icm::IncidentStatus.find(params[:id])
  end

  def multilingual_update
    @incident_status = Icm::IncidentStatus.find(params[:id])
    @incident_status.not_auto_mult=true
    respond_to do |format|
      if @incident_status.update_attributes(params[:icm_incident_status])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @incident_statuses = Icm::IncidentStatus.multilingual.list_all
    respond_to do |format|
      format.json  {render :json => @incident_statuses.to_dhtmlxgrid_json(['0',:name,
                                                                     :incident_status_code,:company_name,
                                                                    {:value => 'M', :controller => 'icm/incident_statuses',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @incident_statuses.size) }
    end
  end    
end
