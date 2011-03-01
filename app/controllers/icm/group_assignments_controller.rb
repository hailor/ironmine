class Icm::GroupAssignmentsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end    
  end

  def new
    
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    
  end

  def get_data
    group_assignments_scope = Icm::GroupAssignment.list_all
    group_assignments,count = paginate(group_assignments_scope)

    respond_to do |format|
      format.json  {render :json => to_jsonp(group_assignments.to_grid_json([:company_name,:department_name,:site_name, :site_group_name, :person_name, :support_group_name, :status_code], count)) }
    end    
  end
end