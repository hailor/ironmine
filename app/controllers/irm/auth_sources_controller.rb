class Irm::AuthSourcesController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @auth_source = Irm::AuthSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @auth_source }
    end
  end

  def new
    @auth_source = Irm::AuthSource.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @auth_source }
    end
  end

  def edit
    @auth_source = Irm::AuthSource.find(params[:id])
  end

  def create
    @auth_source = Irm::AuthSource.new(params[:irm_auth_source])
    @auth_source.company_id = Irm::Company.current.id
    respond_to do |format|
      if @auth_source.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @auth_source, :status => :created, :location => @auth_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @auth_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @auth_source = Irm::AuthSource.find(params[:id])

    respond_to do |format|
      if @auth_source.update_attributes(params[:irm_auth_source])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @auth_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @auth_source = Irm::AuthSource.find(params[:id])
    @auth_source.destroy

    respond_to do |format|
      format.html { redirect_to(auth_source_url) }
      format.xml  { head :ok }
    end
  end

  def get_data
    auth_sources_scope = Irm::AuthSource.where("1=1")
    auth_sources_scope = auth_sources_scope.match_value("#{Irm::AuthSource.table_name}.name",params[:name])
    auth_sources_scope = auth_sources_scope.match_value("#{Irm::AuthSource.table_name}.host",params[:host])
    auth_sources_scope = auth_sources_scope.match_value("#{Irm::AuthSource.table_name}.account",params[:account])
    auth_sources_scope = auth_sources_scope.match_value("#{Irm::AuthSource.table_name}.attr_login",params[:attr_login])
    auth_sources,count = paginate(auth_sources_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(auth_sources.to_grid_json([:name, :host, :port, :account, :base_dn,:attr_login, :status_meaning, :status_code], count)) }
    end    
  end
end
