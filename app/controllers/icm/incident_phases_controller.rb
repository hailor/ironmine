class Icm::IncidentPhasesController < ApplicationController
  def index
    @incident_phase = Icm::IncidentPhase.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incident_phase }
    end
  end

  def show
    @incident_phase = Icm::IncidentPhase.multilingual.find(params[:id])
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
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @incident_phase, :status => :created, :location => @incident_phase }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_phase.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @incident_phase = Icm::IncidentPhase.find(params[:id])

    respond_to do |format|
      if @incident_phase.update_attributes(params[:icm_incident_phase])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident_phase.errors, :status => :unprocessable_entity }
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

  def get_data
    incident_phases_scope = Icm::IncidentPhase.multilingual.status_meaning
    incident_phases_scope = incident_phases_scope.match_value("#{Icm::IncidentPhase.table_name}.phase_code",params[:phase_code])
    incident_phases_scope = incident_phases_scope.match_value("#{Icm::IncidentPhasesTl.table_name}.name",params[:name])
    incident_phases,count = paginate(incident_phases_scope)

    respond_to do |format|
      format.json  {render :json => to_jsonp(incident_phases.to_grid_json([:name,:phase_code,:display_sequence,:status_meaning], count)) }
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
        format.html { render({:action=>"show"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end  
end
