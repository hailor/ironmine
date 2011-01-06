class Irm::FunctionGroupsController < ApplicationController
  def index
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def show
    @function_group = Irm::FunctionGroup.multilingual.where(:id => params[:id]).first()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def new
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def edit
    @function_group = Irm::FunctionGroup.multilingual.find(params[:id])
  end

  def create
    @function_group = Irm::FunctionGroup.new(params[:irm_function_group])
    respond_to do |format|
      if @function_group.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @function_group, :status => :created, :location => @function_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @function_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @function_group = Irm::FunctionGroup.find(params[:id])

    respond_to do |format|
      if @function_group.update_attributes(params[:irm_function_group])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @function_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @function_group = Irm::FunctionGroup.find(params[:id])
    @function_group.destroy

    respond_to do |format|
      format.html { redirect_to(function_groups_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @function_group = Irm::FunctionGroup.find(params[:id])
  end

  def multilingual_update
    @function_group = Irm::FunctionGroup.find(params[:id])
    @function_group.not_auto_mult=true
    respond_to do |format|
      if @function_group.update_attributes(params[:irm_function_group])
        format.html { redirect_to({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    function_groups_scope = Irm::FunctionGroup.multilingual
    function_groups,count = paginate(function_groups_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(function_groups.to_grid_json([:group_code,:name,:description,:status_code], count)) }
    end    
  end

  def function_index
    @function_group = Irm::FunctionGroup.multilingual.find(params[:function_group_id])
  end

  def get_own_functions
    @function_group = Irm::FunctionGroup.find(params[:function_group_id])
    @functions = @function_group.functions.multilingual
    respond_to do |format|
      format.json  {render :json => @functions.to_dhtmlxgrid_json(['0',:function_code,:name,:description], @functions.size) }
    end
  end

  def get_available_functions
    @function_group = Irm::FunctionGroup.find(params[:function_group_id])
    @available_functions = Irm::Function.multilingual.query_by_status_code(Irm::Constant::ENABLED) - @own_functions = @function_group.functions.multilingual
    respond_to do |format|
      format.json  {render :json => @available_functions.to_dhtmlxgrid_json(['0',:function_code,:name,:description], @available_functions.size) }
    end
  end

  def edit_own_functions
    @function_group = Irm::FunctionGroup.find(params[:function_group_id])
  end

  def update_functions
    @function_group = Irm::FunctionGroup.find(params[:function_group_id])
    @functions = Irm::Function.where("id IN (?)", params[:ids].split(","))

    @function_group.functions.delete(@function_group.functions - @functions)
    @function_group.functions << @functions - @function_group.functions

    respond_to do |format|
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
    end
  end
end
