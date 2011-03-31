class Uid::ExternalLoginsController < ApplicationController
  layout "uid"
  # GET /external_logins
  # GET /external_logins.xml
  def index
    @external_logins = Uid::ExternalLogin.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @external_logins }
    end
  end

  # GET /external_logins/1
  # GET /external_logins/1.xml
  def show
    @external_login = Uid::ExternalLogin.query_by_system(::I18n.locale).
                           query_by_source_type(::I18n.locale).status_meaning.
                           find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @external_login }
    end
  end

  # GET /external_logins/new
  # GET /external_logins/new.xml
  def new
    @external_login = Uid::ExternalLogin.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @external_login }
    end
  end

  # GET /external_logins/1/edit
  def edit
    @external_login = Uid::ExternalLogin.find(params[:id])
  end

  # POST /external_logins
  # POST /external_logins.xml
  def create
    @external_login = Uid::ExternalLogin.new(params[:uid_external_login])

    respond_to do |format|
      if @external_login.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @external_login, :status => :created, :location => @external_login }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @external_login.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /external_logins/1
  # PUT /external_logins/1.xml
  def update
    @external_login = Uid::ExternalLogin.find(params[:id])

    respond_to do |format|
      if @external_login.update_attributes(params[:uid_external_login])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @external_login.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /external_logins/1
  # DELETE /external_logins/1.xml
  def destroy
    @external_login = Uid::ExternalLogin.find(params[:id])
    @external_login.destroy

    respond_to do |format|
      format.html { redirect_to(:action=>"index") }
      format.xml  { head :ok }
    end
  end


  def get_data
    external_logins_scope = Uid::ExternalLogin.query_by_system(::I18n.locale).status_meaning
    external_logins_scope = external_logins_scope.match_value("v1.system_name",params[:system_name])
    external_logins_scope = external_logins_scope.match_value("#{Uid::ExternalLogin.table_name}.external_login_name",
                                                              params[:external_login_name])
    external_logins,count = paginate(external_logins_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(external_logins.to_grid_json([:system_name,:external_login_name,:active_start_date,
                                                                        :active_end_date,:status_meaning],count))}
    end
  end


  def options
    external_logins_scope = Uid::ExternalLogin.where("1=1")
    external_logins_scope = external_logins_scope.query_by_system_code(params[:external_system_code]) if params[:external_system_code]
    external_logins_scope = external_logins_scope.collect{|el| {:label=>el[:external_login_name],:value=>el[:external_login_name]}}
    respond_to do |format|
      format.json {render :json=>external_logins_scope.to_grid_json([:label,:value],external_logins_scope.count)}
    end
  end

end
