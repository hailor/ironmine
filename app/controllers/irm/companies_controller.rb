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
    @attr.merge!(:home_page=>params[:home_page])
    @attr.merge!(:hotline=>params[:hotline])
    @attr.merge!(:time_zone=>params[:time_zone])
    @attr.merge!(:cost_center_code=>params[:cost_center_code])
    @attr.merge!(:currency_code=>params[:currency_code])
    @attr.merge!(:status_code=>params[:status_code])
    @attr.merge!(:budget_code=>params[:budget_code])
    
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

  def base_info
    @company_info = Irm::Company.find(params[:company_id])
  end
end
