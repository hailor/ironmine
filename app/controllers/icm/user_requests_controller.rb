class Icm::UserRequestsController < ApplicationController
  # GET /incident_requests
  # GET /incident_requests.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /incident_requests/1
  # GET /incident_requests/1.xml
  def show
    @incident_request = Icm::IncidentRequest.list_all.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @incident_request }
    end
  end

  # GET /incident_requests/new
  # GET /incident_requests/new.xml
  def new
    @incident_request = Icm::IncidentRequest.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_request }
    end
  end


  # POST /incident_requests
  # POST /incident_requests.xml
  def create
    @incident_request = Icm::IncidentRequest.new(params[:icm_incident_request])
    #加入创建事故单的默认参数
    prepared_for_create(@incident_request)
    respond_to do |format|
      if @incident_request.save
        format.html { redirect_to({:controller=>"icm/user_journals",:action=>"new",:request_id=>@incident_request.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @incident_request, :status => :created, :location => @incident_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_request.errors, :status => :unprocessable_entity }
      end
    end
  end


  def get_data
    incident_requests_scope = Icm::IncidentRequest.list_all.query_by_submitted(Irm::Person.current.id)
    incident_requests_scope = incident_requests_scope.match_value("#{Icm::IncidentRequest.table_name}.title",params[:title])
    incident_requests_scope = incident_requests_scope.match_value("#{Icm::IncidentRequest.table_name}.request_number",params[:request_number])    
    incident_requests,count = paginate(incident_requests_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(incident_requests.to_grid_json([:request_number,:title,
                                                                          :request_type_name,:service_name,:requested_name,
                                                                          :urgence_name,:impact_range_name,
                                                                          :contact_name,:contact_number,
                                                                          :report_source_name,:priority_name,:incident_status_name],count))}
      format.xml { render :xml => incident_requests }
    end
  end

  private
  def prepared_for_create(incident_request)
    incident_request.submitted_by = Irm::Person.current.id
    incident_request.requested_by = Irm::Person.current.id
    incident_request.incident_status_code = Icm::IncidentStatus.query_by_close_flag(Irm::Constant::SYS_NO).order_display.first.incident_status_code
    incident_request.submitted_date = Time.now
    incident_request.report_source_code = "CUSTOMER_SUBMIT"
  end
end
