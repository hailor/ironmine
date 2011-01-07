class Icm::IncidentStatusesController < ApplicationController
  def index
    @incident_status = Icm::IncidentStatus.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_status }
    end
  end

  def show
    @incident_status = Icm::IncidentStatus.multilingual.list_all(I18n::locale).find(params[:id])
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
    @incident_status = Icm::IncidentStatus.multilingual.list_all(I18n::locale).find(params[:id])
  end

  def create
    @incident_status = Icm::IncidentStatus.new(params[:icm_incident_status])
    respond_to do |format|
      if @incident_status.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "index" }
      else
         format.html { render "new" }
      end
    end
  end

  def update
    @incident_status = Icm::IncidentStatus.find(params[:id])

    respond_to do |format|
      if @incident_status.update_attributes(params[:icm_incident_status])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "index" }
      else
        format.html { render "edit" }
      end
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
    @incident_statuses = Icm::IncidentStatus.multilingual.list_all(I18n::locale)
    @incident_statuses,count = paginate(@incident_statuses)
    respond_to do |format|
      format.json  {render :json => to_jsonp(@incident_statuses.to_grid_json(['0',:company_name,:incident_status_code,:name,:description,:status_meaning], count)) }
    end
  end    
end
