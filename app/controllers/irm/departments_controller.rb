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
    @department = Irm::Department.find(params[:id])
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Irm::Department.new(params[:irm_department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to(@department, :notice => 'Department was successfully created.') }
        format.xml  { render :xml => @department, :status => :created, :location => @department }
      else
        format.html { render :action => "new" }
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
        format.html { redirect_to(@department, :notice => 'Department was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
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
end
