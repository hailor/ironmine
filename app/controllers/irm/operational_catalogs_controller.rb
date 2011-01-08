class Irm::OperationalCatalogsController < ApplicationController
  def index
    @operational_catalog = Irm::OperationalCatalog.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operational_catalog }
    end
  end

  def show
    @operational_catalog = Irm::OperationalCatalog.list_all.where(:id => params[:id]).first()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @operational_catalog }
    end
  end

  def new
    @operational_catalog = Irm::OperationalCatalog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @operational_catalog }
    end
  end

  def edit
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])
  end

  def create
    @operational_catalog = Irm::OperationalCatalog.new(params[:irm_operational_catalog])
    @operational_catalog.segment1 = "" if params[:irm_operational_catalog][:segment1].blank?
    @operational_catalog.segment2 = "" if params[:irm_operational_catalog][:segment2].blank?
    @operational_catalog.segment3 = "" if params[:irm_operational_catalog][:segment3].blank?
    respond_to do |format|
      if @operational_catalog.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @operational_catalog, :status => :created, :location => @operational_catalog }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @operational_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])
    if !params[:irm_operational_catalog][:segment3]
      params[:irm_operational_catalog] = params[:irm_operational_catalog].merge({:segment3 => ""})
    end
    if !params[:irm_operational_catalog][:segment2]
      params[:irm_operational_catalog] = params[:irm_operational_catalog].merge({:segment2 => ""})
    end    
    respond_to do |format|
      if @operational_catalog.update_attributes(params[:irm_operational_catalog])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @operational_catalog.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])
    @operational_catalog.destroy

    respond_to do |format|
      format.html { redirect_to(operational_catalogs_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    operational_catalogs_scope = Irm::OperationalCatalog.list_all
    operational_catalogs,count = paginate(operational_catalogs_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(operational_catalogs.to_grid_json([:company_name, :segment1_name, :segment2_name, :segment3_name, :concat_segment_name, :status_code], count)) }
    end
  end  
end
