class Irm::RegionsController < ApplicationController
  # GET /regions
  # GET /regions.xml
  def index
    @region = Irm::Region.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @region }
    end
  end

  def show
    @region = Irm::Region.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @region }
    end
  end



  # GET /regions/new
  # GET /regions/new.xml
  def new
    @region = Irm::Region.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @region }
    end
  end

  # GET /regions/1/edit
  def edit
    @region = Irm::Region.multilingual.find(params[:id])
  end

  # POST /regions
  # POST /regions.xml
  def create
    @region = Irm::Region.new(params[:irm_region])

    respond_to do |format|
      if @region.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @region, :status => :created, :location => @region }
      else
        @error = @region
        format.html { render "new" }
        format.xml  { render :xml => @region.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /regions/1
  # PUT /regions/1.xml
  def update
    @region = Irm::Region.find(params[:id])

    respond_to do |format|
      if @region.update_attributes(params[:irm_region])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @region
        format.html { render "edit" }
        format.xml  { render :xml => @region.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def multilingual_edit
    @region = Irm::Region.find(params[:id])
  end

  def multilingual_update
    @region = Irm::Region.find(params[:id])
    @region.not_auto_mult=true
    respond_to do |format|
      if @region.update_attributes(params[:irm_region])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @regions= Irm::Region.multilingual.query_wrap_info(I18n::locale)
    @regions,count = paginate(@regions)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@regions.to_grid_json(['R',:region_code,:name,:description,:status_meaning], count))}
    end
  end
end
