class Slm::ServiceBreaksController < ApplicationController
  def index
  end

  # GET /service_breaks/new
  # GET /service_breaks/new.xml
  def new
    @service_break = Slm::ServiceBreak.new
    @service_catalog_id = params[:service_catalog_id]
    @return_url=request.env['HTTP_REFERER']

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_breaks }
    end
  end

  # GET /service_breaks/1/edit
  def edit
    @service_break = Slm::ServiceBreak.find(params[:id])
    @service_catalog_id = params[:service_catalog_id]
    @return_url=request.env['HTTP_REFERER']
  end

  # POST /service_breaks
  # POST /service_breaks.xml
  def create
    @service_break = Slm::ServiceBreak.new(params[:slm_service_break])
    return_url = params[:return_url]

    respond_to do |format|
      if @service_break.save
        format.html { redirect_to(return_url, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @service_breaks, :status => :created, :location => @service_breaks }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_breaks.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_breaks/1
  # PUT /service_breaks/1.xml
  def update
    @service_break = Slm::ServiceBreak.find(params[:id])
    return_url = params[:return_url]

    respond_to do |format|
      if @service_break.update_attributes(params[:slm_service_break])
        format.html { redirect_to(return_url, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_breaks.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_breaks/1
  # DELETE /service_breaks/1.xml
  def destroy
    @service_break = Slm::ServiceBreak.find(params[:id])
    @service_break.destroy

    respond_to do |format|
      format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_deleted)) }
      format.xml  { head :ok }
    end
  end

  def get_data
    service_breaks_scope = Slm::ServiceBreak.query_by_status_meaning(I18n::locale)
    service_breaks,count = paginate(service_breaks_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(service_breaks.to_grid_json([:seq_number,:start_date,
                                                                       :end_date,:meaning],count))}
    end
  end
  
end