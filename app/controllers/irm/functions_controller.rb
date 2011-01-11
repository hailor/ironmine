class Irm::FunctionsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @function = Irm::Function.multilingual.status_meaning.where(:id => params[:id]).first()

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @function }
    end
  end

  def new
    @function = Irm::Function.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @function }
    end
  end

  def edit
    @function = Irm::Function.multilingual.find(params[:id])
  end

  def create
    @function = Irm::Function.new(params[:irm_function])
    respond_to do |format|
      if @function.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @function, :status => :created, :location => @function }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @function.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @function = Irm::Function.find(params[:id])

    respond_to do |format|
      if @function.update_attributes(params[:irm_function])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @function.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @function = Irm::Function.find(params[:id])
    @function.destroy

    respond_to do |format|
      format.html { redirect_to(functions_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    functions_scope = Irm::Function.multilingual.status_meaning
    functions,count = paginate(functions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(functions.to_grid_json([:function_code,:name,:description,:status_meaning], count)) }
    end        
  end

  def edit_own_permissions
    @function = Irm::Function.find(params[:function_id])
  end

  def update_permissions
    @function = Irm::Function.find(params[:function_id])
    @permissions = Irm::Permission.where("id IN (?)", params[:ids].split(","))

    @function.permissions.delete(@function.permissions - @permissions)
    @function.permissions << @permissions - @function.permissions

    respond_to do |format|
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "successful_info" }
    end
  end

  def select_permissions
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @function = Irm::Function.find(params[:function_id])
    @permission_name = params[:permission_name] if params[:permission_name]
  end

  def add_permissions
    return_url=params[:return_url]
#    permissions = Irm::Permission.where("id IN (?)", params[:irm_function_permissions][:permission_code])
    params[:irm_function_permissions][:ids].each do |p|
      Irm::FunctionMember.create({:permission_code => Irm::Permission.find(p).permission_code, :function_code => params[:function_code]})
    end
     
    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"select_permissions", :function_id=> params[:function_id]})
    else
      redirect_to(return_url)
    end
  end

  def get_available_permissions
    permissions_scope = Irm::Permission.list_all.enabled.query_by_permission_name(params[:permission_name]).without_function(params[:function_code])
    permissions,count = paginate(permissions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(permissions.to_grid_json([:name,:product_module_name, :permission_code_a, :status_meaning,:permission_code,:page_controller,:page_action], count)) }
    end
  end

  def remove_permission
    return_url=params[:return_url]
    permission = Irm::Permission.where(:id => params[:permission_id]).first
    function = Irm::Function.where(:id => params[:function_id]).first
    function_member = Irm::FunctionMember.where(:permission_code => permission.permission_code, :function_code => function.function_code).first
    function_member.destroy
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:function_id]})
    else
      redirect_to(return_url)
    end    
  end
end
