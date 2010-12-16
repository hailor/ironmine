class Irm::OrganizationsController < ApplicationController
  # GET /organizations
  # GET /organizations.xml
  def index
    @organization = Irm::Organization.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organizations }
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
    @organization = Irm::Organization.multilingual.find(params[:id])
  end

  # POST /organizations
  # POST /organizations.xml
  def create
    @organization = Irm::Organization.new(params[:irm_organization])

    respond_to do |format|
      if @organization.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "irm/common/_successful_message" }
        format.xml  { render :xml => @organization, :status => :created, :location => @organization }
      else
        @error = @organization
        format.html { render "irm/common/error_message" }
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
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @organization
        format.html { render "irm/common/error_message" }
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
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @organizations= Irm::Organization.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@organizations.to_dhtmlxgrid_json(['R',:company_name,:short_name,:name,:description,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/organizations',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_organization_list', :script => ''}], @organizations.size)}
    end
  end

  def belongs_to
    organizations = Irm::Organization.query_by_company_id(::I18n.locale,params[:company_id])
    respond_to do |format|
      format.html
      format.xml  { head :ok }
      format.js { render :json => organizations.collect{|d| {:id=>d.id,:name=>d[:name]}} }
    end
  end
end
