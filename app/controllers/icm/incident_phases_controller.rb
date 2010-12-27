class Icm::IncidentPhasesController < ApplicationController
  def index
    @incident_phase = Icm::IncidentPhase.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_phase }
    end
  end

  def show
    @incident_phase = Icm::IncidentPhase.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident_phase }
    end
  end

  def new
    @incident_phase = Icm::IncidentPhase.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_phase }
    end
  end

  def edit
    @incident_phase = Icm::IncidentPhase.multilingual.find(params[:id])
  end

  def create
    @incident_phase = Icm::IncidentPhase.new(params[:icm_incident_phase])
    respond_to do |format|
      if @incident_phase.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @incident_phase
         format.html { render "error_message" }
      end
    end
  end

  def update
    @incident_phase = Icm::IncidentPhase.find(params[:id])

    respond_to do |format|
      if @incident_phase.update_attributes(params[:icm_incident_phase])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @incident_phase
        format.html { render "error_message" }
      end
    end
  end

  def destroy
    @incident_phase = Icm::IncidentPhase.find(params[:id])
    @incident_phase.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @incident_phase = Icm::IncidentPhase.find(params[:id])
  end

  def multilingual_update
    @incident_phase = Icm::IncidentPhase.find(params[:id])
    @incident_phase.not_auto_mult=true
    respond_to do |format|
      if @incident_phase.update_attributes(params[:icm_incident_phase])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @incident_phases = Icm::IncidentPhase.multilingual.list_all
    respond_to do |format|
      format.json  {render :json => @incident_phases.to_dhtmlxgrid_json(['0',:company_name,:name,:phase_code,
                                                                    {:value => 'M', :controller => 'icm/incident_phases',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @incident_phases.size) }
    end
  end   
end
