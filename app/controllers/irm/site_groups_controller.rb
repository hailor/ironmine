class Irm::SiteGroupsController < ApplicationController
  # GET /site_groups
  # GET /site_groups.xml
  def index
    @site_group = Irm::SiteGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site_groups }
    end
  end

  # GET /site_groups/1
  # GET /site_groups/1.xml
  def show
    @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site_group }
    end
  end

  # GET /site_groups/new
  # GET /site_groups/new.xml
  def new
    @site_group = Irm::SiteGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site_group }
    end
  end

  # GET /site_groups/1/edit
  def edit
    @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /site_groups
  # POST /site_groups.xml
  def create
    @site_group = Irm::SiteGroup.new(params[:irm_site_group])

    respond_to do |format|
      if @site_group.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @site_group, :status => :created, :location => @site_group }
      else
        @error = @site_group
        format.html { render "new" }
        format.xml  { render :xml => @site_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /site_groups/1
  # PUT /site_groups/1.xml
  def update
    @site_group = Irm::SiteGroup.find(params[:id])

    respond_to do |format|
      if @site_group.update_attributes(params[:irm_site_group])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @site_group
        format.html { render "new" }
        format.xml  { render :xml => @site_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @site_group = Irm::SiteGroup.find(params[:id])
  end

  def multilingual_update
    @site_group = Irm::SiteGroup.find(params[:id])
    @site_group.not_auto_mult=true
    respond_to do |format|
      if @site_group.update_attributes(params[:irm_site_group])
        format.html { redirect_to({:action=>"show"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @site_groups= Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale)
    @site_groups = @site_groups.match_value("#{Irm::SiteGroupsTl.table_name}.name",params[:name])
    @site_groups = @site_groups.match_value("#{Irm::SiteGroup.table_name}.group_code",params[:group_code])
    @site_groups,count = paginate(@site_groups)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@site_groups.to_grid_json(['R',:region_name,:group_code,:name,:description,:status_meaning], count))}
    end
  end

  def add_site
    @site = Irm::Site.new
    @current_site_group_code = params[:site_group_code]
    @current_site_group_id = params[:site_group_id]
  end

  def create_site
    @site = Irm::Site.new(params[:irm_site])

    respond_to do |format|
      if @site.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "irm/common/_successful_message" }
        format.xml  { render :xml => @site, :status => :created, :location => @site_group }
      else
        @error = @site_group
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit_site
    @site = Irm::Site.multilingual.find(params[:id])
    @current_site_group_code = params[:site_group_code]
    @current_site_group_id = params[:site_group_id]
  end

  def update_site
    @site = Irm::Site.find(params[:id])

    respond_to do |format|
      if @site.update_attributes(params[:irm_site])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @site_group
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def current_site_group
    @site_group = Irm::SiteGroup.multilingual.find(params[:id])
  end

  #根据 site group 得到 site
  def get_current_group_site
    @sites = Irm::Site.multilingual.query_by_site_group_code(params[:group_code]).query_wrap_info(I18n.locale)
    @sites,count = paginate(@sites)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@sites.to_grid_json(['R',:site_code,:name,:description,:status_meaning], count))}
    end
  end

  def belongs_to
    sites = Irm::Site.query_by_site_group_code_and_language(::I18n.locale,params[:site_group_code])
    respond_to do |format|
      format.html
      format.xml  { head :ok }
      format.js { render :json => sites.collect{|d| {:id=>d.site_code,:name=>d[:name]}} }
    end
  end
end
