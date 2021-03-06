class Irm::DepartmentsController < ApplicationController
  layout "uid"
  # GET /departments
  # GET /departments.xml
  def index
    @department = Irm::Department.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @departments }
    end
  end

  def show
    @department = Irm::Department.query_wrap_info(I18n::locale).multilingual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @department }
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
    @department = Irm::Department.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /departments
  # POST /departments.xml
  def create
    @department = Irm::Department.new(params[:irm_department])

    respond_to do |format|
      if @department.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @department, :status => :created, :location => @department }
      else
        format.html { render "new" }
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
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render "edit" }
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
        format.html { render({:action=>"show"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @departments= Irm::Department.multilingual.query_wrap_info(I18n::locale)
    @departments = @departments.match_value("v2.company_name",params[:company_name])
    @departments = @departments.match_value("v3.organization_name",params[:organization_name])
    @departments = @departments.match_value("#{Irm::Department.table_name}.short_name",params[:short_name])
    @departments = @departments.match_value("#{Irm::DepartmentsTl.table_name}.name",params[:name])
    @departments,count = paginate(@departments)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@departments.to_grid_json(['R',:company_name,:organization_name,:short_name,:name,:description,:status_meaning], count))}
    end
  end

  def belongs_to
    departments = Irm::Department.query_by_company_and_organization(::I18n.locale,params[:company_id],params[:organization_id])
    respond_to do |format|
      format.html
      format.xml  { head :ok }
      format.js   { render :json => departments.collect{|d| {:id=>d.id,:name=>d[:name]}} }
    end
  end

  def get_by_organization
    departments_scope = Irm::Department.multilingual.multilingual.enabled.where("organization_id = ?", params[:organization_id])
    department = departments_scope.collect{|i| {:label=>i[:name], :value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>department.to_grid_json([:label,:value], department.count)}
    end
  end
end