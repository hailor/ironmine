class Irm::CompaniesController < ApplicationController
  # GET /Companies
  # GET /Companies.xml
  def index
    @company = Irm::Company.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /Companies/new
  # GET /Companies/new.xml
  def new
    @company = Irm::Company.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @company }
    end
  end

  # GET /Companies/1/edit
  def edit
    @company = Irm::Company.multilingual.find(params[:id])
  end

  # POST /Companies
  # POST /Companies.xml
  def create
    @company = Irm::Company.new(params[:irm_company])

    respond_to do |format|
      if @company.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @company, :status => :created, :location => @company }
      else
        @error = @company
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /Companies/1
  # PUT /Companies/1.xml
  def update
    @company = Irm::Company.find(params[:id])
    @attr = params[:irm_company]
    
    respond_to do |format|
      if @company.update_attributes(@attr)
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @company
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @company.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @company = Irm::Company.find(params[:id])
  end

  def multilingual_update
    @company = Irm::Company.find(params[:id])
    @company.not_auto_mult=true
    respond_to do |format|
      if @company.update_attributes(params[:irm_company])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @companies= Irm::Company.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@companies.to_dhtmlxgrid_json(['R',:company_type_meaning,:short_name,:name,:description, :status_meaning,
                                                             {:value => 'M', :controller => 'irm/companies',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_company_list', :script => ''}], @companies.size)}
    end
  end

  def site_info
    @company_id = params[:company_id]
  end

  def get_company_site
    @company_id = params[:company_id]
    @company_sites= Irm::Location.query_site_info(I18n::locale,@company_id)
    respond_to do |format|
      format.json {render :json=>@company_sites.to_dhtmlxgrid_json(['R',:organization_name,:department_name,:site_group_name,:site_name,:status_meaning], @company_sites.size)}
    end
  end

  def add_site_info
    @company_id = params[:company_id]
    @location=Irm::Location.new
  end

  def create_location
     @location = Irm::Location.new(params[:irm_location])

    respond_to do |format|
      if @location.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        @error = @location
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update_location
     @location = Irm::location.new(params[:irm_location])

    respond_to do |format|
      if @location.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
      else
        @error = @location
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit_location
    @location = Irm::Location.find(params[:id])
    @location_id = params[:id]
  end

  def update_location
    @location = Irm::Location.find(params[:id])
    @attr = params[:irm_location]

    respond_to do |format|
      if @location.update_attributes(@attr)
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @location
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_company_info
    @companies=Irm::Company.multilingual
    respond_to do |format|
      format.json { render :json => @companies.collect{|d| [d.id,d[:name]]}}
    end
  end

  def support_group
    @company_id = params[:company_id]
  end

  def get_support_group
    company_id = params[:company_id]
    @support_group= Irm::SupportGroup.multilingual.query_by_company(I18n::locale,company_id)
    respond_to do |format|
      format.json {render :json=>@support_group.to_dhtmlxgrid_json(['R',:name,:description,:status_meaning], @support_group.size)}
    end
  end

  def get_choose_company
    @companies= Irm::Company.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@companies.to_dhtmlxgrid_json(['R',:name,:status_meaning], @companies.size)}
    end
  end

end
