class Irm::FunctionGroupsController < ApplicationController
  def index
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def show
    @function_group = Irm::FunctionGroup.find(params[:id])

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
        flash[:successful_message] = (t :successfully_created)
        format.html { render "successful_info" }
      else
         @error = @function_group
         format.html { render "error_message" }
      end
    end
  end

  def update
    @function_group = Irm::FunctionGroup.find(params[:id])

    respond_to do |format|
      if @function_group.update_attributes(params[:irm_function_group])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
      else
        @error = @function_group
        format.html { render "error_message" }
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
    @function_groups = Irm::FunctionGroup.multilingual.all
    respond_to do |format|
      format.json  {render :json => @function_groups.to_dhtmlxgrid_json(['0',:group_code,:name,:description, :status_code,
                                                                    {:value => 'M', :controller => 'irm/function_groups',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'data_area', :script => ''}
                                                                    ], @function_groups.size) }
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
