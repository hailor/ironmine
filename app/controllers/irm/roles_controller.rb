class Irm::RolesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @role = Irm::Role.list_all.where(:id => params[:id]).first()
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def new
    @role = Irm::Role.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def edit
    @role = Irm::Role.multilingual.find(params[:id])
  end

  def create
    @role = Irm::Role.new(params[:irm_role])
    respond_to do |format|
      if @role.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @role = Irm::Role.find(params[:id])

    respond_to do |format|
      if @role.update_attributes(params[:irm_role])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @role = Irm::Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to(roles_url) }
      format.xml  { head :ok }
    end
  end
  
  def get_data
    roles_scope = Irm::Role.list_all
    roles_scope = roles_scope.match_value("#{Irm::Role.table_name}.role_code",params[:role_code])
    roles_scope = roles_scope.match_value("#{Irm::RolesTl.table_name}.name",params[:name])    
    roles,count = paginate(roles_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(roles.to_grid_json([:name,:role_code,:status_code, :menu_name, :description], count)) }
    end
  end
  
  def data_grid
    render :layout => nil
  end

  def multilingual_edit
    @role = Irm::Role.find(params[:id])
  end

  def multilingual_update
    @role = Irm::Role.find(params[:id])
    @role.not_auto_mult = true
    respond_to do |format|
      if @role.update_attributes(params[:irm_role])
        format.html { redirect_to({:action=>"show"}, :notice => 'Role was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "multilingual_edit" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end  
end
