class Uid::ExternalSystemsController < ApplicationController
  layout "uid"
  # GET /external_systems
  # GET /external_systems.xml
  def index
    @external_systems = Uid::ExternalSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @external_systems }
    end
  end

  # GET /external_systems/1
  # GET /external_systems/1.xml
  def show
    @external_system = Uid::ExternalSystem.multilingual.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @external_system }
    end
  end

  # GET /external_systems/new
  # GET /external_systems/new.xml
  def new
    @external_system = Uid::ExternalSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @external_system }
    end
  end

  # GET /external_systems/1/edit
  def edit
    @external_system = Uid::ExternalSystem.multilingual.find(params[:id])
  end

  # POST /external_systems
  # POST /external_systems.xml
  def create
    @external_system = Uid::ExternalSystem.new(params[:uid_external_system])

    respond_to do |format|
      if @external_system.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @external_system, :status => :created, :location => @external_system }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @external_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /external_systems/1
  # PUT /external_systems/1.xml
  def update
    @external_system = Uid::ExternalSystem.find(params[:id])

    respond_to do |format|
      if @external_system.update_attributes(params[:uid_external_system])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @external_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /external_systems/1
  # DELETE /external_systems/1.xml
  def destroy
    @external_system = Uid::ExternalSystem.find(params[:id])
    @external_system.destroy

    respond_to do |format|
      format.html { redirect_to(external_systems_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @external_system = Uid::ExternalSystem.find(params[:id])
  end

  def multilingual_update
    @external_system = Uid::ExternalSystem.find(params[:id])
    @external_system.not_auto_mult=true
    respond_to do |format|
      if @external_system.update_attributes(params[:uid_external_system])
        format.html { redirect_to(@external_system, :notice => 'External system was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @external_system.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    external_systems_scope = Uid::ExternalSystem.multilingual.status_meaning
    external_systems_scope = external_systems_scope.match_value("uid_external_systems.system_name",params[:system_name])
    external_systems_scope = external_systems_scope.match_value("uid_external_systems.external_system_code",params[:external_system_code])
    external_systems_scope = external_systems_scope.match_value("uid_external_systems.external_hostname",params[:hostname])
    external_systems_scope = external_systems_scope.match_value("uid_external_systems.external_ip_address",params[:external_ip_address])
    external_systems,count = paginate(external_systems_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(external_systems.to_grid_json([:external_system_code,:external_hostname,:external_ip_address,
                                                                         :system_name,:system_description,:status_meaning],count))}
    end
  end
end