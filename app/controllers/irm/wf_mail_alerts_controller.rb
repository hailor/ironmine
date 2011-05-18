class Irm::WfMailAlertsController < Irm::WfActionController
  # GET /wf_mail_alerts
  # GET /wf_mail_alerts.xml
  def index
    @wf_mail_alerts = Irm::WfMailAlert.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_mail_alerts }
    end
  end

  # GET /wf_mail_alerts/1
  # GET /wf_mail_alerts/1.xml
  def show
    @wf_mail_alert = Irm::WfMailAlert.list_all.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_mail_alert }
    end
  end

  # GET /wf_mail_alerts/new
  # GET /wf_mail_alerts/new.xml
  def new
    @wf_mail_alert = Irm::WfMailAlert.new(:bo_code=>get_bo_code_from_source_str(params[:source_str]))

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_mail_alert }
    end
  end

  # GET /wf_mail_alerts/1/edit
  def edit
    @wf_mail_alert = Irm::WfMailAlert.find(params[:id])
  end

  # POST /wf_mail_alerts
  # POST /wf_mail_alerts.xml
  def create
    @wf_mail_alert = Irm::WfMailAlert.new(params[:irm_wf_mail_alert])
    @wf_mail_alert.sync_mail_recipients(params[:recipients]) if params[:recipients].present?
    respond_to do |format|
      if @wf_mail_alert.save
        create_for_source(params[:source_str],@wf_mail_alert)
        format.html {
          if(params[:save_and_new])
            redirect_to(({:action => "new"}).merge(get_default_url_options([:back_url,:source_str])), :notice => t(:successfully_created))
          else
            redirect_back_or_default({:action=>"index"})
          end

        }
        format.xml  { render :xml => @wf_mail_alert, :status => :created, :location => @wf_mail_alert }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_mail_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_mail_alerts/1
  # PUT /wf_mail_alerts/1.xml
  def update
    @wf_mail_alert = Irm::WfMailAlert.find(params[:id])
    if params[:recipients].present?
      Irm::WfMailRecipient.where(:wf_mail_alert_id=>params[:id]).delete_all
      @wf_mail_alert.sync_mail_recipients(params[:recipients])
    end
    respond_to do |format|
      if @wf_mail_alert.update_attributes(params[:irm_wf_mail_alert])
        format.html {
          if(params[:save_and_new])
            redirect_to(({:action => "new"}).merge(get_default_url_options([:back_url,:source_str])), :notice => t(:successfully_updated))
          else
            redirect_back_or_default({:action=>"index"})
          end
        }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_mail_alert.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_mail_alerts/1
  # DELETE /wf_mail_alerts/1.xml
  def destroy
    @wf_mail_alert = Irm::WfMailAlert.find(params[:id])
    @wf_mail_alert.destroy

    respond_to do |format|
      format.html { redirect_to(wf_mail_alerts_url) }
      format.xml  { head :ok }
    end
  end


  def get_data
    wf_mail_alerts_scope = Irm::WfMailAlert.list_all
    wf_mail_alerts_scope = wf_mail_alerts_scope.match_value("irm_wf_mail_alerts.name",params[:name])
    wf_mail_alerts,count = paginate(wf_mail_alerts_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(wf_mail_alerts.to_grid_json([:name,:bo_name,:mail_template_name,:mail_alert_code,:from_email],count))}
    end
  end

end
