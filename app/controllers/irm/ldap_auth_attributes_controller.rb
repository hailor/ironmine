class Irm::LdapAuthAttributesController < ApplicationController
  # GET /ldap_auth_attributes
  # GET /ldap_auth_attributes.xml
  def index
    @ldap_auth_attributes = Irm::LdapAuthAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_auth_attributes }
    end
  end

  # GET /ldap_auth_attributes/1
  # GET /ldap_auth_attributes/1.xml
  def show
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_auth_attribute }
    end
  end

  # GET /ldap_auth_attributes/new
  # GET /ldap_auth_attributes/new.xml
  def new
    @ldap_auth_attribute = Irm::LdapAuthAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_auth_attribute }
    end
  end

  # GET /ldap_auth_attributes/1/edit
  def edit
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])
  end

  # POST /ldap_auth_attributes
  # POST /ldap_auth_attributes.xml
  def create
    @ldap_auth_attribute = Irm::LdapAuthAttribute.new(params[:irm_ldap_auth_attribute])
    @ldap_auth_attribute.ldap_auth_header_id=params[:ah_id]
    @ldap_auth_attribute.company_id=Irm::Company.current.id
    respond_to do |format|
      if @ldap_auth_attribute.save
        format.html { redirect_to({:controller => "irm/ldap_auth_headers",:action=>"show",:id=>params[:ah_id]}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @ldap_auth_attribute, :status => :created, :location => @ldap_auth_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_auth_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_auth_attributes/1
  # PUT /ldap_auth_attributes/1.xml
  def update
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])

    respond_to do |format|
      if @ldap_auth_attribute.update_attributes(params[:irm_ldap_auth_attribute])
        format.html { redirect_to({:controller => "irm/ldap_auth_headers",:action=>"show",:id=>params[:ah_id]}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_auth_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_auth_attributes/1
  # DELETE /ldap_auth_attributes/1.xml
  def destroy
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])
    @ldap_auth_attribute.destroy

    respond_to do |format|
      format.html { redirect_to({:controller => "irm/ldap_auth_headers",:action=>"show",:id=>params[:ah_id]}) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])
  end

  def multilingual_update
    @ldap_auth_attribute = Irm::LdapAuthAttribute.find(params[:id])
    @ldap_auth_attribute.not_auto_mult=true
    respond_to do |format|
      if @ldap_auth_attribute.update_attributes(params[:ldap_auth_attribute])
        format.html { redirect_to(@ldap_auth_attribute, :notice => 'Ldap auth attribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_auth_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    ldap_auth_attributes_scope = Irm::LdapAuthAttribute.find_all_by_ldap_auth_header_id(params[:ah_id])
    ldap_auth_attributes = ldap_auth_attributes_scope.collect{|i| {:id=>i.id,
                                                                   :local_attr=>i.local_attr,
                                                                   :ldap_attr=>i.ldap_attr,
                                                                   :description=>i.description,
                                                                   :status_code=>i.status_code}}

    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_auth_attributes.to_grid_json([:local_attr,:ldap_attr,:description,:status_code],ldap_auth_attributes.count))}
    end
  end
end
