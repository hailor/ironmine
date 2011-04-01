class Uid::LoginMappingsController < ApplicationController
  layout "uid"
  def index
    
  end
  
  # GET /login_mappings/1
  # GET /login_mappings/1.xml
  def show
    @login_mapping = Uid::LoginMapping.list_all.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @login_mapping }
    end
  end


  def new
    @login_mapping = Uid::LoginMapping.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @external_system }
    end
  end


  def create
    @login_mapping = Uid::LoginMapping.new(params[:uid_login_mapping])

    respond_to do |format|
      if @login_mapping.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @login_mapping, :status => :created, :location => @external_system }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @login_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /login_mappings/1/edit
  def edit
    @login_mapping = Uid::LoginMapping.find(params[:id])
  end

  # PUT /login_mappings/1
  # PUT /login_mappings/1.xml
  def update
    @login_mapping = Uid::LoginMapping.find(params[:id])

    respond_to do |format|
      if @login_mapping.update_attributes(params[:uid_login_mapping])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @login_mapping.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @login_mapping = Uid::LoginMapping.find(params[:id])
    @login_mapping.destroy
    respond_to do |format|
      format.html { redirect_to({:action=>"index"}) }
      format.xml  { head :ok }
    end
  end

  def get_data
    login_mappings_scope = Uid::LoginMapping.list_all.order(:person_id)
    login_mappings_scope = login_mappings_scope.match_value("#{Irm::Person.table_name}.login_name",params[:login_name])
    login_mappings_scope = login_mappings_scope.match_value("#{Uid::LoginMapping.table_name}.external_login_name",params[:external_login_name])
    login_mappings_scope = login_mappings_scope.match_value("#{Uid::ExternalSystem.view_name}.system_name",params[:system_name])
    login_mappings_scope = login_mappings_scope.match_value("#{Irm::Person.name_to_sql(nil,Irm::Person.table_name,'')}",
                                                              params[:person_name])
    login_mappings,count = paginate(login_mappings_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(login_mappings.to_grid_json([:id,:login_name,:external_login_name,:system_name,:person_name],count))}
    end
  end


  def not_mpping_external_logins
    external_logins_scope = Uid::ExternalLogin.not_mapping
    external_logins_scope = external_logins_scope.query_by_system_code(params[:external_system_code]) if params[:external_system_code]
    external_logins_scope = external_logins_scope.collect{|el| {:label=>el[:external_login_name],:value=>el[:external_login_name]}}
    respond_to do |format|
      format.json {render :json=>external_logins_scope.to_grid_json([:label,:value],external_logins_scope.count)}
    end
  end

end