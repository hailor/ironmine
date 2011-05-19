class Irm::RolesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @role = Irm::Role.multilingual.with_role_type.with_report_group.with_menu.find(params[:id])
    @fgs = Irm::FunctionGroup.multilingual.enabled
    @fs = @role.functions.multilingual.group_by{|i| i.group_code}
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def new
    @role = Irm::Role.new
    @role_function_ids = []
    @fgs = Irm::FunctionGroup.multilingual.enabled
    fs = Irm::Function.multilingual.enabled.where(:public_flag=>Irm::Constant::SYS_NO,:login_flag=>Irm::Constant::SYS_NO)
    @fs = fs.group_by{|i| i.group_code}
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @role }
    end
  end

  def edit
    @role = Irm::Role.multilingual.find(params[:id])
    @role_function_ids = @role.role_functions.collect{|i| i.function_id}
    @fgs = Irm::FunctionGroup.multilingual.enabled
    fs = Irm::Function.multilingual.enabled.where(:public_flag=>Irm::Constant::SYS_NO,:login_flag=>Irm::Constant::SYS_NO)
    @fs = fs.group_by{|i| i.group_code}
  end

  def create
    @role = Irm::Role.new(params[:irm_role])
    @role_function_ids = params[:role][:functions] if params[:role]
    @role_function_ids||= []
    @role_function_ids.each do |fid|
      @role.role_functions.build(:function_id=>fid)
    end
    respond_to do |format|
      if @role.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @role, :status => :created, :location => @role }
      else
        @fgs = Irm::FunctionGroup.multilingual.enabled
        fs = Irm::Function.multilingual.enabled.where(:public_flag=>Irm::Constant::SYS_NO,:login_flag=>Irm::Constant::SYS_NO)
        @fs = fs.group_by{|i| i.group_code}
        format.html { render :action => "new" }
        format.xml  { render :xml => @role.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @role = Irm::Role.find(params[:id])
    @role_function_ids = params[:role][:functions] if params[:role]
    @role_function_ids||= []
    Irm::RoleFunction.where(:role_id=>@role.id).delete_all
    @role_function_ids.each do |fid|
      @role.role_functions.build(:function_id=>fid)
    end
    respond_to do |format|
      if @role.update_attributes(params[:irm_role])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        @fgs = Irm::FunctionGroup.multilingual.enabled
        fs = Irm::Function.multilingual.enabled.where(:public_flag=>Irm::Constant::SYS_NO,:login_flag=>Irm::Constant::SYS_NO)
        @fs = fs.group_by{|i| i.group_code}
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
    roles_scope = Irm::Role.multilingual
    roles_scope = roles_scope.match_value("#{Irm::Role.table_name}.role_code",params[:role_code])
    roles_scope = roles_scope.match_value("#{Irm::RolesTl.table_name}.name",params[:name])    
    roles,count = paginate(roles_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(roles.to_grid_json([:name,:role_code,:status_code, :description], count)) }
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
