class Irm::OperationalCatalogsController < ApplicationController
  def index
    @operational_catalog = Irm::OperationalCatalog.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @operational_catalog }
    end
  end

  def show
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])

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
    @operational_catalog = Irm::OperationalCatalog.multilingual.find(params[:id])
  end

  def create
    @operational_catalog = Irm::OperationalCatalog.new(params[:irm_operational_catalog])
    respond_to do |format|
      if @operational_catalog.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }        
      else
         @error = @operational_catalog
         format.html { render "error_message" }
      end
    end
  end

  def update
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])

    respond_to do |format|
      if @operational_catalog.update_attributes(params[:irm_operational_catalog])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @operational_catalog
        format.html { render "error_message" }
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

  def multilingual_edit
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])
  end

  def multilingual_update
    @operational_catalog = Irm::OperationalCatalog.find(params[:id])
    @operational_catalog.not_auto_mult=true
    respond_to do |format|
      if @operational_catalog.update_attributes(params[:irm_operational_catalog])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @operational_catalogs = Irm::OperationalCatalog.list_all
    respond_to do |format|
      format.json  {render :json => @operational_catalogs.to_dhtmlxgrid_json(['0',:catalog_type_name,:catalog_code, :name,:segment1_name, :segment2_name, :segment3_name,:status_code,
                                                                    {:value => 'M', :controller => 'irm/operational_catalogs',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @operational_catalogs.size) }
    end
  end
end
