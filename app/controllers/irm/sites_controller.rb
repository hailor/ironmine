class Irm::SitesController < ApplicationController
  # GET /sites
  # GET /sites.xml
  def index
    @site = Irm::Site.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Irm::Site.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @site = Irm::Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Irm::Site.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Irm::Site.new(params[:irm_site])

    respond_to do |format|
      if @site.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "index" }
        format.xml  { render :xml => @site, :status => :created, :location => @site }
      else
        @error = @site
        format.html { render "new" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sites/1
  # PUT /sites/1.xml
  def update
    @site = Irm::Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:irm_site])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "index" }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end
end
