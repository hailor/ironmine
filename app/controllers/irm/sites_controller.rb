class Irm::SitesController < ApplicationController
  # GET /sites
  # GET /sites.xml
  def index
    if !params[:site_group_code].blank?
      @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).
                     query_by_group_code(params[:site_group_code]).first
    else
      @site_group= Irm::SiteGroup.new
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1
  # GET /sites/1.xml
  def show
    @site = Irm::Site.multilingual.query_wrap_info(I18n::locale).find(params[:id])
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/new
  # GET /sites/new.xml
  def new
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]
    @site_group_code = params[:site_group_code]
    @site_group = Irm::SiteGroup.multilingual.query_by_group_code(@site_group_code).first
    if !@site_group.blank?
      @site_group_name = @site_group[:name]
    end
    @site = Irm::Site.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @site }
    end
  end

  # GET /sites/1/edit
  def edit
    @site = Irm::Site.multilingual.query_wrap_info(I18n::locale).find(params[:id])
    @return_url=request.env['HTTP_REFERER']
    @_from=params[:_from]
  end

  # POST /sites
  # POST /sites.xml
  def create
    @site = Irm::Site.new(params[:irm_site])

    respond_to do |format|
      if @site.save
        if !params[:site_group_code].blank?
          @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).
                         query_by_group_code(params[:site_group_code]).first
        else
          @site_group= Irm::SiteGroup.new
        end
        format.html {
          if(params[:_from]=="site_group")
            redirect_to params[:return_url]
          else
            format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
          end
          }
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
        if !params[:site_group_code].blank?
          @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).
                         query_by_group_code(params[:site_group_code]).first
        else
          @site_group= Irm::SiteGroup.new
        end
        format.html {
          if(params[:_from]=="site_group")
            redirect_to params[:return_url]
          else
            render "index"
          end
        }
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
      else
        format.html { render "edit" }
        format.xml  { render :xml => @site.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @sites= Irm::Site.query_by_site_group_code_and_language(I18n::locale,params[:site_group_code]).
        query_wrap_info(I18n::locale)
    @sites,count = paginate(@sites)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@sites.to_grid_json(['R',:site_code,:name,:description,:status_meaning], count))}
    end
  end

  def select_site
    if !params[:site_group_code].blank?
      @site_group = Irm::SiteGroup.multilingual.query_wrap_info(I18n::locale).
                     query_by_group_code(params[:site_group_code]).first
    else
      @site_group= Irm::SiteGroup.new
    end
    render :action => "index"
  end
end
