class Icm::IncidentJournalsController < ApplicationController

  before_filter :setup_up_incident_request
  before_filter :backup_incident_request ,:only=>[:create,:update_close]

  def index
   redirect_to :action=>"new"
  end

  # GET /incident_journals/new
  # GET /incident_journals/new.xml
  def new
    @incident_journal = @incident_request.incident_journals.build()

    @incident_reply = Icm::IncidentReply.new()
    respond_to do |format|
      format.html { render :layout=>"application_right"}
      format.xml  { render :xml => @incident_journal }
    end
  end


  # POST /incident_journals
  # POST /incident_journals.xml
  def create
    @incident_reply = Icm::IncidentReply.new(params[:icm_incident_reply])
    @incident_journal = @incident_request.incident_journals.build(params[:icm_incident_journal])
    perform_create
    respond_to do |format|
      if @incident_reply.valid? && @incident_request.update_attributes(@incident_reply.attributes)
        process_change_attributes(@incident_reply.attributes.keys,@incident_request,@incident_request_bak,@incident_journal)
        process_files(@incident_journal)
        publish_create_incident_journal(@incident_journal)
        format.html { redirect_to({:action => "new"}, :notice => 'Incident journal was successfully created.') }
        format.xml  { render :xml => @incident_journal, :status => :created, :location => @incident_journal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @incident_journal.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit_close
    @incident_journal = @incident_request.incident_journals.build()
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @incident_journal }
    end
  end


  def update_close

    @incident_journal = @incident_request.incident_journals.build(params[:icm_incident_journal])
    perform_create
    respond_to do |format|
      if @incident_journal.valid?&&@incident_request.update_attributes(params[:icm_incident_request])
        process_change_attributes([:incident_status_code,:close_reason_code],@incident_request,@incident_request_bak,@incident_journal)
        process_files(@incident_journal)
        publish_create_incident_journal(@incident_journal)
        format.html { redirect_to({:action => "new"}) }
        format.xml  { render :xml => @incident_journal, :status => :created, :location => @incident_journal }
      else
        format.html { render :action => "edit_close" }
        format.xml  { render :xml => @incident_journal.errors, :status => :unprocessable_entity }
      end
    end
  end


  def get_entry_header_data
    entry_headers_scope = Skm::EntryHeader.list_all.published.current_entry
    entry_headers_scope = entry_headers_scope.match_value("#{Skm::EntryHeader.table_name}.entry_title",params[:entry_title]) if params[:entry_title]
    entry_headers,count = paginate(entry_headers_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(entry_headers.to_grid_json([:entry_status_code, :full_title, :entry_title, :keyword_tags,:doc_number,:version_number, :published_date_f], count)) }
    end
  end

  private
  def setup_up_incident_request
    @incident_request = Icm::IncidentRequest.list_all.find(params[:request_id])    
  end

  def backup_incident_request
    @incident_request_bak = @incident_request.dup  
  end

  def perform_create
    @incident_journal.replied_by=Irm::Person.current.id
  end

  def process_change_attributes(attributes,new_value,old_value,ref_journal)
    attributes.each do |key|
      ovalue = old_value.send(key)
      nvalue = new_value.send(key)
        Icm::IncidentHistory.create({:journal_id=>ref_journal.id,
                                     :property_key=>key.to_s,
                                     :old_value=>ovalue,
                                     :new_value=>nvalue}) if !ovalue.eql?(nvalue)
    end
  end

  def process_files(ref_journal)
    @files = []
    params[:files].each do |key,value|
      @files << Irm::AttachmentVersion.create({:source_id=>ref_journal.id,
                                               :source_type=>ref_journal.class.name,
                                               :data=>value[:file],
                                               :description=>value[:description]}) if(value[:file]&&!value[:file].blank?)
    end if params[:files]
  end
  def publish_create_incident_journal(incident_journal)
    incident_journal.reload
    incident_journal = Icm::IncidentJournal.select_all.with_replied_by.find(incident_journal.id)
    incident_request = Icm::IncidentRequest.list_all.find(incident_journal.incident_request_id)
    Irm::EventManager.publish(:event_code=>"INCIDENT_JOURNAL_NEW",
                              :params=>{:to_person_ids=>[incident_request.submitted_by,incident_request.requested_by,incident_journal.replied_by],
                                        :journal=>incident_journal.attributes.merge(:change_message=>"not change"),:request=>incident_request.attributes})
  end
end
