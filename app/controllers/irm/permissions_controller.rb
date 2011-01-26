class Irm::PermissionsController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @permission = Irm::Permission.list_all.where(:id => params[:id]).first()
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  def new
    @permission = Irm::Permission.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @permission }
    end
  end

  def edit
    @permission = Irm::Permission.multilingual.find(params[:id])
  end

  def create
    @permission = Irm::Permission.new(params[:irm_permission])
    respond_to do |format|
      if @permission.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @permission, :status => :created, :location => @permission }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @permission.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @permission = Irm::Permission.find(params[:id])

    respond_to do |format|
      if @permission.update_attributes(params[:irm_permission])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @permission.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @permission = Irm::Permission.find(params[:id])
    @permission.destroy

    respond_to do |format|
      format.html { redirect_to(permissions_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_data
    permissions_scope = Irm::Permission.list_all.status_meaning
    permissions_scope = permissions_scope.match_value("#{Irm::Permission.table_name}.permission_code",params[:permission_code])
    permissions_scope = permissions_scope.match_value("#{Irm::Permission.table_name}.page_controller",params[:page_controller])
    permissions_scope = permissions_scope.match_value("#{Irm::PermissionsTl.table_name}.name",params[:name])


    permissions,count = paginate(permissions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(permissions.to_grid_json([:name,:product_module_name,:status_meaning,:permission_code,:page_controller,:page_action, :status_code], count)) }
    end
  end

  def function_get_data
    permissions_scope = Irm::Permission.list_all.status_meaning.belong_to_function(params[:function_code])
    permissions,count = paginate(permissions_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(permissions.to_grid_json([:name,:product_module_name,:status_meaning,:permission_code,:page_controller,:page_action, :status_code], count)) }
    end
  end

  def data_grid
    render :layout => nil
  end
end
