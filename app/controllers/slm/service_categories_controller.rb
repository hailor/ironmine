class Slm::ServiceCategoriesController < ApplicationController
  # GET /service_categories
  # GET /service_categories.xml
  def index
    @service_categories = Slm::ServiceCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_categories }
    end
  end

  # GET /service_categories/1
  # GET /service_categories/1.xml
  def show
    @service_category = Slm::ServiceCategory.multilingual.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_category }
    end
  end

  # GET /service_categories/new
  # GET /service_categories/new.xml
  def new
    @service_category = Slm::ServiceCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_category }
    end
  end

  # GET /service_categories/1/edit
  def edit
    @service_category = Slm::ServiceCategory.multilingual.find(params[:id])
  end

  # POST /service_categories
  # POST /service_categories.xml
  def create
    @service_category = Slm::ServiceCategory.new(params[:slm_service_category])

    respond_to do |format|
      if @service_category.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @service_category, :status => :created, :location => @service_category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_categories/1
  # PUT /service_categories/1.xml
  def update
    @service_category = Slm::ServiceCategory.find(params[:id])

    respond_to do |format|
      if @service_category.update_attributes(params[:slm_service_category])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_categories/1
  # DELETE /service_categories/1.xml
  def destroy
    @service_category = Slm::ServiceCategory.find(params[:id])
    @service_category.destroy

    respond_to do |format|
      format.html { redirect_to(service_categories_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @service_category = Slm::ServiceCategory.find(params[:id])
  end

  def multilingual_update
    @service_category = Slm::ServiceCategory.find(params[:id])
    @service_category.not_auto_mult=true
    respond_to do |format|
      if @service_category.update_attributes(params[:service_category])
        format.html { redirect_to({:action=>"index"}, :notice => 'Service category was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_category.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    service_categories_scope = Slm::ServiceCategory.multilingual.status_meaning
    service_categories_scope = service_categories_scope.match_value("slm_service_categories_tl.name",params[:name])
    service_categories_scope = service_categories_scope.match_value("slm_service_categories.category_code",params[:category_code])
    service_categories,count = paginate(service_categories_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(service_categories.to_grid_json([:category_code,:name,:description,:status_meaning],count))}
    end
  end
end
