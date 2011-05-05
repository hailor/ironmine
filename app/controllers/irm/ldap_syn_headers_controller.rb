class Irm::LdapSynHeadersController < ApplicationController
  # GET /ldap_syn_headers
  # GET /ldap_syn_headers.xml
  def index
    @ldap_syn_headers = Irm::LdapSynHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_syn_headers }
    end
  end

  # GET /ldap_syn_headers/1
  # GET /ldap_syn_headers/1.xml
  def show
    @ldap_syn_header = Irm::LdapSynHeader.list_all.find(params[:id])
    #@ldap_syn_header = Irm::LdapSynHeader.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_syn_header }
    end
  end

  # GET /ldap_syn_headers/new
  # GET /ldap_syn_headers/new.xml
  def new
    @ldap_syn_header = Irm::LdapSynHeader.new(:status_code=>"OFFLINE")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_syn_header }
    end
  end

  # GET /ldap_syn_headers/1/edit
  def edit
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])
  end

  # POST /ldap_syn_headers
  # POST /ldap_syn_headers.xml
  def create
    @ldap_syn_header = Irm::LdapSynHeader.new(params[:irm_ldap_syn_header])
    @ldap_syn_header.comp_object="IRM_COMPANIES_VL"
    @ldap_syn_header.org_object="IRM_ORGANIZATIONS_VL"
    @ldap_syn_header.dept_object="IRM_DEPARTMENTS_VL"

    respond_to do |format|
      if @ldap_syn_header.save
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @ldap_syn_header, :status => :created, :location => @ldap_syn_header }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_syn_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_syn_headers/1
  # PUT /ldap_syn_headers/1.xml
  def update
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])

    respond_to do |format|
      if @ldap_syn_header.update_attributes(params[:irm_ldap_syn_header])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_syn_headers/1
  # DELETE /ldap_syn_headers/1.xml
  def destroy
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])
    @ldap_syn_header.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_syn_headers_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])
  end

  def multilingual_update
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])
    @ldap_syn_header.not_auto_mult=true
    respond_to do |format|
      if @ldap_syn_header.update_attributes(params[:ldap_syn_header])
        format.html { redirect_to({:action => "show"}, :notice => 'Ldap syn header was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  #同步方法
  def syn_execute
    @ldap_syn_header = Irm::LdapSynHeader.find(params[:id])
    @ldap_syn_header.syn_type;
  end

  def get_data
    ldap_syn_headers_scope = Irm::LdapSynHeader.query_syn_info(I18n::locale)
    ldap_syn_headers_scope = ldap_syn_headers_scope.match_value("ldap_syn_header.name",params[:name])
    ldap_syn_headers,count = paginate(ldap_syn_headers_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_syn_headers.to_grid_json([:ldap_source_name,:name,:base_dn,:status_code],count))}
    end
  end
end
