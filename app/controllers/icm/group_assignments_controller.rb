class Icm::GroupAssignmentsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end    
  end

  def new
    @group_assignment = Icm::GroupAssignment.new
#    @return_url= request.env['HTTP_REFERER']

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group_assignment }
    end    
  end

  def create
    @group_assignment = Icm::GroupAssignment.new(params[:icm_group_assignment])
    respond_to do |format|
      if @group_assignment.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @group_assignment, :status => :created, :location => @group_assignment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group_assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def edit
    @group_assignment = Icm::GroupAssignment.find(params[:id])
  end

  def update
    @group_assignment = Icm::GroupAssignment.find(params[:id])

    respond_to do |format|
      if @group_assignment.update_attributes(params[:icm_group_assignment])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group_assignment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group_assignment = Icm::GroupAssignment.find(params[:id])
    @group_assignment.destroy

    respond_to do |format|
      format.html { redirect_to({:action => "index"}) }
      format.xml  { head :ok }
    end    
  end

  def get_data
    group_assignments_scope = Icm::GroupAssignment.list_all
    group_assignments,count = paginate(group_assignments_scope)

    respond_to do |format|
      format.json  {render :json => to_jsonp(group_assignments.to_grid_json([:company_name,:department_name,:site_name, :site_group_name, :person_name, :support_group_name, :status_code], count)) }
    end    
  end

  def get_customer_departments
    departments_scope = Irm::Department.multilingual.enabled.where("organization_id = ?", params[:customer_organization_id])
    departments = departments_scope.collect{|i| {:label=>i[:name], :value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>departments.to_grid_json([:label, :value],departments.count)}
    end
  end

  def get_customer_sites

  end

  def get_customer_site_groups

  end

  def get_customer_people
    people_scope = Irm::Person.enabled.where("department_id = ?", params[:customer_department_id])
    people = people_scope.collect{|i| {:label=>i[:last_name] + i[:first_name], :value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>people.to_grid_json([:label,:value],people.count)}
    end    
  end

  def get_customer_organizations
    organizations_scope = Irm::Organization.multilingual.enabled.where("company_id = ?", params[:customer_company_id])
    organizations = organizations_scope.collect{|i| {:label=>i[:name], :value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>organizations.to_grid_json([:label,:value],organizations.count)}
    end    
  end
end