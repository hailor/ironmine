class Irm::OrganizationsController < ApplicationController
  layout "uid"
  # GET /organizations
  # GET /organizations.xml
  def index
    @organization = Irm::Organization.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
    end
  end

  def show
    @organization = Irm::Organization.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/new
  # GET /organizations/new.xml
  def new
    @organization = Irm::Organization.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization }
    end
  end

  # GET /organizations/1/edit
  def edit
    @organization = Irm::Organization.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    @organization = Irm::Organization.new(params[:irm_organization])

    respond_to do |format|
      if @organization.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
      else
        format.html { render "new" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organizations/1
  # PUT /organizations/1.xml
  def update
    @organization = Irm::Organization.find(params[:id])

    respond_to do |format|
      if @organization.update_attributes(params[:irm_organization])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @organization
        format.html { render "edit" }
        format.xml  { render :xml => @organization.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @organization = Irm::Organization.find(params[:id])
  end

  def multilingual_update
    @organization = Irm::Organization.find(params[:id])
    @organization.not_auto_mult=true
    respond_to do |format|
      if @organization.update_attributes(params[:irm_organization])
        format.html { render({:action=>"show"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @organizations= Irm::Organization.multilingual.query_wrap_info(I18n::locale)
    @organizations = @organizations.match_value("#{Irm::Organization.table_name}.organization_code",params[:organization_code])
    @organizations = @organizations.match_value("v2.name",params[:company_name])
    @organizations = @organizations.match_value("#{Irm::OrganizationsTl.table_name}.name",params[:name])
    @organizations,count = paginate(@organizations)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@organizations.to_grid_json(['R',:company_name,:short_name,:name,:description,:status_meaning], count))}
    end
  end

  def belongs_to
    organizations = Irm::Organization.query_by_company_and_language(::I18n.locale,params[:company_id])
    respond_to do |format|
      format.html
      format.xml  { head :ok }
      format.js { render :json => organizations.collect{|d| {:id=>d.id,:name=>d[:name]}} }
    end
  end

  def get_by_company
    organizations_scope = Irm::Organization.multilingual.query_by_company_id(params[:belonged_company_id])
    organizations = organizations_scope.collect{|i| {:label=>i[:name],:value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>organizations.to_grid_json([:label,:value],organizations.count)}
    end
  end
end
