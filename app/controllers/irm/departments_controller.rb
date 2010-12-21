class Irm::DepartmentsController < ApplicationController
  # GET /departments
  # GET /departments.xml
  def index
    @department = Irm::Department.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end
  end

  # GET /departments/new
  # GET /departments/new.xml
  def new
    @department = Irm::Department.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @department }
    end
  end

  # GET /departments/1/edit
  def edit
    @department = Irm::Department.multilingual.find(params[:id])
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Irm::Department.new(params[:irm_department])

    respond_to do |format|
      if @department.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "irm/common/_successful_message" }
        format.xml  { render :xml => @department, :status => :created, :location => @department }
      else
        @error = @department
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /departments/1
  # PUT /departments/1.xml
  def update
    @department = Irm::Department.find(params[:id])

    respond_to do |format|
      if @department.update_attributes(params[:irm_department])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @department
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @department.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @department = Irm::Department.find(params[:id])
  end

  def multilingual_update
    @department = Irm::Department.find(params[:id])
    @department.not_auto_mult=true
    respond_to do |format|
      if @department.update_attributes(params[:irm_department])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @departments= Irm::Department.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@departments.to_dhtmlxgrid_json(['R',:company_name,:organization_name,:short_name,:name,:description,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/departments',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_department_list', :script => ''}], @departments.size)}
    end
  end

  def belongs_to
    departments = Irm::Department.query_by_company_and_organization(::I18n.locale,params[:company_id],params[:organization_id])
    respond_to do |format|
      format.html
      format.xml  { head :ok }
      format.js { render :json => departments.collect{|d| {:id=>d.id,:name=>d[:name]}} }
    end
  end
end