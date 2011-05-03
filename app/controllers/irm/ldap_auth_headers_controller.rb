class Irm::LdapAuthHeadersController < ApplicationController
  # GET /ldap_auth_headers
  # GET /ldap_auth_headers.xml
  def index
    @ldap_auth_headers = LdapAuthHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_auth_headers }
    end
  end

  # GET /ldap_auth_headers/1
  # GET /ldap_auth_headers/1.xml
  def show
    @ldap_auth_header = LdapAuthHeader.query_auth_info.find(params[:id])
    puts  @ldap_auth_header.ldap_source.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/new
  # GET /ldap_auth_headers/new.xml
  def new
    @ldap_auth_header = LdapAuthHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/1/edit
  def edit
    @ldap_auth_header = LdapAuthHeader.find(params[:id])
  end

  # POST /ldap_auth_headers
  # POST /ldap_auth_headers.xml
  def create
    @ldap_auth_header = LdapAuthHeader.new(params[:irm_ldap_auth_header])
    @ldap_auth_header.company_id = Irm::Company.current.id
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
    @ldap_auth_header = LdapAuthHeader.find(params[:id])

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
    @ldap_auth_header = LdapAuthHeader.find(params[:id])
    @ldap_auth_header.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_auth_headers_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @ldap_auth_header = LdapAuthHeader.find(params[:id])
  end

  def multilingual_update
    @ldap_auth_header = LdapAuthHeader.find(params[:id])
    @ldap_auth_header.not_auto_mult=true
    respond_to do |format|
      if @ldap_auth_header.update_attributes(params[:ldap_auth_header])
        format.html { redirect_to({:action=>"index"}, :notice => 'Ldap auth header was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_auth_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    ldap_auth_headers_scope = Irm::LdapAuthHeader.query_auth_info
    ldap_auth_headers_scope = ldap_auth_headers_scope.match_value("ldap_auth_header.name",params[:name])
    ldap_auth_headers,count = paginate(ldap_auth_headers_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_auth_headers.to_grid_json([:ldap_source,:name,:auth_cn,:description,:status_code],count))}
    end
  end
end
