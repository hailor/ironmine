class Irm::LocationsController < ApplicationController
  def index
  end

  def show
    @location= Irm::Location.query_by_status_code(I18n::locale).query_site_info(I18n::locale,params[:company_id]).find(params[:id])
  end

  def edit
    @return_url=request.env['HTTP_REFERER']
    @company_id = params[:company_id]
    @location = Irm::Location.find(params[:id])
  end

  def new
    @return_url=request.env['HTTP_REFERER']
    @location=Irm::Location.new
    @company_id = params[:company_id]
  end

  def create
    @location = Irm::Location.new(params[:irm_location])

    respond_to do |format|
      if @location.save
        format.html { redirect_to(params[:return_url],:notice => (t :successfully_created))}
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        @error = @location
        format.html { render "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @locations= Irm::Location.query_by_status_code(I18n::locale).query_site_info(I18n::locale,params[:company_id])
    @locations,count = paginate(@locations)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@locations.to_grid_json(['R',:organization_name,:department_name,:site_group_name, :site_name,:status_meaning], count))}
    end
  end
  
  def update
    @location = Irm::Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:irm_location])
        format.html { redirect_to(params[:return_url],:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error=@location
        format.html { render "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

end
