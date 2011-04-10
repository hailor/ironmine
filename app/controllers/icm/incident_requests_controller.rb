class Icm::IncidentRequestsController < ApplicationController
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

  # GET /incident_requests/1/edit
  def edit
    @incident_request = Icm::IncidentRequest.find(params[:id])
  end

  # POST /incident_requests
  # POST /incident_requests.xml
  def create
    @incident_request = Icm::IncidentRequest.new(params[:icm_incident_request])
    #加入创建事故单的默认参数
    prepared_for_create(@incident_request)
    respond_to do |format|
      if @incident_request.save
        process_files(@incident_request)
        publish_create_incident_request(@incident_request)
        #如果没有填写support_group, 插入Delay Job任务
        if @incident_request.support_group_id.nil? || @incident_request.support_group_id.blank?
          Delayed::Job.enqueue(Irm::Jobs::IcmGroupAssignmentJob.new(@incident_request.id))
        end
        format.html { redirect_to({:controller=>"icm/incident_journals",:action=>"new",:request_id=>@incident_request.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @incident_request, :status => :created, :location => @incident_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def short_create
    @incident_request = Icm::IncidentRequest.new(params[:icm_incident_request])
    @incident_request.urgence_code = "GLOBAL_NORMAL"
    @incident_request.incident_status_code = "NEW_INCIDENT"
    @incident_request.request_type_code = "REQUESTED_TO_PERFORM"
    @incident_request.service_code = "ORAL_EBS_INV"
    @incident_request.report_source_code = "CUSTOMER_SUBMIT"
    @incident_request.impact_range_code = "GLOBAL_LOW"
    #加入创建事故单的默认参数
    prepared_for_create(@incident_request)
    respond_to do |format|
      if @incident_request.save
        publish_create_incident_request(@incident_request)
        format.html { redirect_to({:controller=>"icm/incident_journals",:action=>"new",:request_id=>@incident_request.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @incident_request, :status => :created, :location => @incident_request }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_request.errors, :status => :unprocessable_entity }
      end
    end      
  end
  
  # PUT /incident_requests/1
  # PUT /incident_requests/1.xml
  def update
    @incident_request = Icm::IncidentRequest.find(params[:id])

    respond_to do |format|
      if @incident_request.update_attributes(params[:icm_incident_request])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @incident_request.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    incident_requests_scope = Icm::IncidentRequest.list_all.query_by_company_ids(session[:accessable_companies]).order("last_response_date desc,last_request_date desc,weight_value,company_id")
    #incident_requests_scope = incident_requests_scope.match_value("incident_request.name",params[:name])
    incident_requests,count = paginate(incident_requests_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(incident_requests.to_grid_json([:request_number,:title,:requested_name,:need_customer_reply,
                                                                          :company_name,:impact_range_name,
                                                                          :contact_name,:last_response_date,
                                                                          :priority_name,:incident_status_name,:submitted_date],count,{:date_to_distance=>[:last_response_date]}))}
      format.xml { render :xml => incident_requests }
    end
  end

  def get_help_desk_data
    incident_requests_scope = Icm::IncidentRequest.list_all.query_by_company_ids(session[:accessable_companies]).order("last_request_date desc,last_response_date desc,weight_value,company_id,id")
    incident_requests,count = paginate(incident_requests_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(incident_requests.to_grid_json([:request_number,:company_name,:title,:requested_name,:need_customer_reply,
                                                                          :urgence_name,:impact_range_name,
                                                                          :contact_name,:last_request_date,
                                                                          :priority_name,:incident_status_name,:submitted_date],count,{:date_to_distance=>[:last_request_date]}))}
      format.xml { render :xml => incident_requests }
    end
  end
  def save_as_skm

  end

  private
  def prepared_for_create(incident_request)
    incident_request.submitted_by = Irm::Person.current.id
    incident_request.submitted_date = Time.now
    incident_request.last_request_date = Time.now
    incident_request.last_response_date = 1.minute.ago
    incident_request.company_id = Irm::Person.find(incident_request.requested_by).company_id
    if incident_request.incident_status_code.nil?||incident_request.incident_status_code.blank?
      incident_request.incident_status_code = Icm::IncidentStatus.query_by_default_flag(Irm::Constant::SYS_YES).query_by_close_flag(Irm::Constant::SYS_NO).order_display.first.incident_status_code
    end
    if incident_request.request_type_code.nil?||incident_request.request_type_code.blank?
      incident_request.request_type_code = "REQUESTED_TO_CHANGE"
    end

    if incident_request.report_source_code.nil?||incident_request.report_source_code.blank?
      incident_request.report_source_code = "CUSTOMER_SUBMIT"
    end
    if incident_request.contact_id.nil?||incident_request.contact_id.blank?
      incident_request.contact_id = incident_request.requested_by
      incident_request.contact_number = Irm::Person.find(incident_request.requested_by).mobile_phone
    end
  end


  def process_files(ref_request)
    @files = []
    params[:files].each do |key,value|
      @files << Irm::AttachmentVersion.create({:source_id=>ref_request.id,
                                               :source_type=>ref_request.class.name,
                                               :data=>value[:file],
                                               :description=>value[:description]}) if(value[:file]&&!value[:file].blank?)
    end if params[:files]

    @files.each do|f|
      puts f.errors
    end
  end

  def publish_create_incident_request(incident_request)
    incident_request.reload
    incident_request = Icm::IncidentRequest.list_all.find(incident_request.id)
    request_url = url_for({:host=>Irm::Constant::DEFAULT_HOST,
             :controller=>"icm/incident_journals",
             :action =>"new",
             :request_id=>incident_request.id})
    Irm::EventManager.publish(:event_code=>"INCIDENT_REQUEST_NEW",
                              :params=>{:to_person_ids=>[incident_request.submitted_by,incident_request.requested_by],
                                        :request=>incident_request.attributes.merge({:url=>request_url})})
  end
end
