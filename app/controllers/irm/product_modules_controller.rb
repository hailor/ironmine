class Irm::ProductModulesController < ApplicationController
  # GET /product_modules
  # GET /product_modules.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /product_modules/1
  # GET /product_modules/1.xml
  def show
    @product_module = Irm::ProductModule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_module }
    end
  end

  # GET /product_modules/new
  # GET /product_modules/new.xml
  def new
    @product_module = Irm::ProductModule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_module }
    end
  end

  # GET /product_modules/1/edit
  def edit
    @product_module = Irm::ProductModule.multilingual.find(params[:id])
  end

  # POST /product_modules
  # POST /product_modules.xml
  def create
    @product_module = Irm::ProductModule.new(params[:irm_product_module])

    respond_to do |format|
      if @product_module.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @product_module, :status => :created, :location => @product_module }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_modules/1
  # PUT /product_modules/1.xml
  def update
    @product_module = Irm::ProductModule.find(params[:id])

    respond_to do |format|
      if @product_module.update_attributes(params[:irm_product_module])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_module.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_modules/1
  # DELETE /product_modules/1.xml
  def destroy
    @product_module = Irm::ProductModule.find(params[:id])
    @product_module.destroy

    respond_to do |format|
      format.html { redirect_to(product_modules_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @product_module = Irm::ProductModule.find(params[:id])
  end

  def multilingual_update
    @product_module = Irm::ProductModule.find(params[:id])
    @product_module.not_auto_mult=true
    respond_to do |format|
      if @product_module.update_attributes(params[:irm_product_module])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    product_modules_scope = Irm::ProductModule.multilingual.status_meaning
    product_modules,count = paginate(product_modules_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(product_modules.to_grid_json([:product_short_name,:name,:description,:installed_flag,:status_meaning, :status_code], count)) }
    end
  end

  def data_grid
    render :layout => nil
  end
end
