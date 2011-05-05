class Irm::LdapAuthHeadersController < ApplicationController
  # GET /ldap_auth_headers
  # GET /ldap_auth_headers.xml
  def index
    @ldap_auth_headers = Irm::LdapAuthHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_auth_headers }
    end
  end

  # GET /ldap_auth_headers/1
  # GET /ldap_auth_headers/1.xml
  def show
    @ldap_auth_header = Irm::LdapAuthHeader.list_all.find(params[:id])
    puts  @ldap_auth_header.ldap_source.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/new
  # GET /ldap_auth_headers/new.xml
  def new
    @ldap_auth_header = Irm::LdapAuthHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/1/edit
  def edit
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])
  end

  # POST /ldap_auth_headers
  # POST /ldap_auth_headers.xml
  def create
    @ldap_auth_header = Irm::LdapAuthHeader.new(params[:irm_ldap_auth_header])
    respond_to do |format|
      if @ldap_auth_header.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @ldap_auth_header, :status => :created, :location => @ldap_auth_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_auth_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_auth_headers/1
  # PUT /ldap_auth_headers/1.xml
  def update
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])

    respond_to do |format|
      if @ldap_auth_header.update_attributes(params[:irm_ldap_auth_header])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_auth_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_auth_headers/1
  # DELETE /ldap_auth_headers/1.xml
  def destroy
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])
    @ldap_auth_header.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_auth_headers_url) }
      format.xml  { head :ok }
    end
  end


  def get_data
    ldap_auth_headers_scope = Irm::LdapAuthHeader.list_all
    ldap_auth_headers_scope = ldap_auth_headers_scope.match_value("#{Irm::LdapAuthHeader.table_name}.name",params[:ldap_source_name])
    ldap_auth_headers,count = paginate(ldap_auth_headers_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_auth_headers.to_grid_json([:ldap_source_name,:name,:auth_cn,:description,:status_code],count))}
    end
  end

  def get_by_ldap_source
    ldap_auth_headers_scope = Irm::LdapAuthHeader.enabled.query_by_ldap_source(params[:belonged_ldap_source_id])
    ldap_auth_headers = ldap_auth_headers_scope.collect{|i| {:label=>i[:name],:value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>ldap_auth_headers.to_grid_json([:label,:value],ldap_auth_headers.count)}
    end
  end
end
