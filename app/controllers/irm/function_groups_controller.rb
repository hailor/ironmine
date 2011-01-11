class Irm::FunctionGroupsController < ApplicationController
  def index
    @function_group = Irm::FunctionGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @function_group }
    end
  end

  def show
    @function_group = Irm::FunctionGroup.multilingual.where(:id => params[:id]).status_meaning.first()

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

  def get_data
    function_groups_scope = Irm::FunctionGroup.multilingual.status_meaning
    function_groups,count = paginate(function_groups_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(function_groups.to_grid_json([:group_code,:name,:description,:status_meaning], count)) }
    end    
  end

  def select_functions
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @function_group = Irm::FunctionGroup.find(params[:group_id])
    @function_name = params[:function_name] if params[:function_name]
  end

  def add_functions
    return_url=params[:return_url]
    params[:irm_group_functions][:ids].each do |p|
      Irm::FunctionGroupMember.create({:function_code => Irm::Function.find(p).function_code, :group_code => params[:group_code]})
    end

    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"select_functions", :group_id=> params[:group_id]})
    else
      redirect_to(return_url)
    end
  end

  def get_available_functions
    functions_scope = Irm::Function.list_all.enabled.query_by_function_name(params[:function_name]).without_group(params[:group_code])
    functions,count = paginate(functions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(functions.to_grid_json([:function_code,:name,:description,:status_meaning], count)) }
    end
  end

  def get_own_functions
    functions_scope = Irm::Function.list_all.status_meaning.belong_to_group(params[:group_code])
    functions,count = paginate(functions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(functions.to_grid_json([:function_code,:name,:description,:status_meaning], count)) }
    end    
  end
  
  def remove_function
    return_url=params[:return_url]
    function = Irm::Function.where(:id => params[:function_id]).first
    function_group = Irm::FunctionGroup.where(:id => params[:group_id]).first
    function_group_member = Irm::FunctionGroupMember.where(:function_code => function.function_code, :group_code => function_group.group_code).first
    function_group_member.destroy
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:group_id]})
    else
      redirect_to(return_url)
    end
  end  
end
