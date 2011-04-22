class Slm::ServiceCatalogsController < ApplicationController
  # GET /service_catalogs
  # GET /service_catalogs.xml
  def index
    @service_catalogs = Slm::ServiceCatalog.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_catalogs }
    end
  end

  # GET /service_catalogs/1
  # GET /service_catalogs/1.xml
  def show
    @service_catalog = Slm::ServiceCatalog.multilingual.status_meaning.query_by_category_code(I18n::locale).
                       query_by_owner_id.query_by_priority_code(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_catalog }
    end
  end

  # GET /service_catalogs/new
  # GET /service_catalogs/new.xml
  def new
    @service_catalog = Slm::ServiceCatalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_catalog }
    end
  end

  # GET /service_catalogs/1/edit
  def edit
    @service_catalog = Slm::ServiceCatalog.multilingual.find(params[:id])
  end

  # POST /service_catalogs
  # POST /service_catalogs.xml
  def create
    @service_catalog = Slm::ServiceCatalog.new(params[:slm_service_catalog])

    respond_to do |format|
      if @service_catalog.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @service_catalog, :status => :created, :location => @service_catalog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_catalogs/1
  # PUT /service_catalogs/1.xml
  def update
    @service_catalog = Slm::ServiceCatalog.find(params[:id])

    respond_to do |format|
      if @service_catalog.update_attributes(params[:slm_service_catalog])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_catalogs/1
  # DELETE /service_catalogs/1.xml
  def destroy
    @service_catalog = Slm::ServiceCatalog.find(params[:id])
    @service_catalog.destroy

    respond_to do |format|
      format.html { redirect_to(service_catalogs_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @service_catalog = Slm::ServiceCatalog.find(params[:id])
  end

  def multilingual_update
    @service_catalog = Slm::ServiceCatalog.find(params[:id])
    @service_catalog.not_auto_mult=true
    respond_to do |format|
      if @service_catalog.update_attributes(params[:slm_service_catalog])
        format.html { redirect_to({:action=>"index"}, :notice => 'Service catalog was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    service_catalogs_scope = Slm::ServiceCatalog.multilingual.status_meaning
    service_catalogs_scope = service_catalogs_scope.match_value("slm_service_catalogs_tl.name",params[:name])
    service_catalogs_scope = service_catalogs_scope.match_value("slm_service_catalogs.catalog_code",params[:catalog_code])
    service_catalogs,count = paginate(service_catalogs_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(service_catalogs.to_grid_json([:catalog_code,:name,
                                                                         :description,:status_meaning],count))}
    end
  end
end
