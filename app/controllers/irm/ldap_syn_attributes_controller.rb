class Irm::LdapSynAttributesController < ApplicationController
  # GET /ldap_syn_attributes
  # GET /ldap_syn_attributes.xml
  def index
    @ldap_syn_attributes = Irm::LdapSynAttribute.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_syn_attributes }
    end
  end

  # GET /ldap_syn_attributes/1
  # GET /ldap_syn_attributes/1.xml
  def show
    @ldap_syn_attributes = Irm::LdapSynAttribute.query_show_info(I18n::locale,params[:id])
    @ldap_syn_attribute = @ldap_syn_attributes.first
    respond_to do |format|
      format.html { redirect_back_or_default }# show.html.erb
      format.xml  { render :xml => @ldap_syn_attribute }
    end
  end

  # GET /ldap_syn_attributes/new
  # GET /ldap_syn_attributes/new.xml
  def new
   # @ldap_syn_header = Irm::LdapSynHeader.find(params[:ah_id])
    @object_type = params[:type]
    @ldap_syn_attribute = Irm::LdapSynAttribute.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_syn_attribute }
    end
  end

  # GET /ldap_syn_attributes/1/edit
  def edit
    @ldap_syn_attribute = Irm::LdapSynAttribute.find(params[:id])
  end

  # POST /ldap_syn_attributes
  # POST /ldap_syn_attributes.xml
  def create
    @ldap_syn_attribute = Irm::LdapSynAttribute.new(params[:irm_ldap_syn_attribute])
    @ldap_syn_attribute.ldap_syn_header_id=params[:ah_id]
    @ldap_syn_attribute.company_id=Irm::Company.current.id
    respond_to do |format|
      if @ldap_syn_attribute.save
        format.html { redirect_back_or_default }
        format.xml  { render :xml => @ldap_syn_attribute, :status => :created, :location => @ldap_syn_attribute }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_syn_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_syn_attributes/1
  # PUT /ldap_syn_attributes/1.xml
  def update
    @ldap_syn_attribute = LdapSynAttribute.find(params[:id])

    respond_to do |format|
      if @ldap_syn_attribute.update_attributes(params[:irm_ldap_syn_attribute])
        format.html { redirect_back_or_default }#{ redirect_to({:controller => "irm/ldap_syn_headers",:action=>"show",:id=>params[:ah_id]}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_syn_attributes/1
  # DELETE /ldap_syn_attributes/1.xml
  def destroy
    @ldap_syn_attribute = Irm::LdapSynAttribute.find(params[:id])
    @ldap_syn_attribute.destroy

    respond_to do |format|
      format.html { redirect_back_or_default }#{ redirect_to({:controller => "irm/ldap_syn_headers",:action=>"show",:id=>params[:ah_id]}) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @ldap_syn_attribute = LdapSynAttribute.find(params[:id])
  end

  def multilingual_update
    @ldap_syn_attribute = LdapSynAttribute.find(params[:id])
    @ldap_syn_attribute.not_auto_mult=true
    respond_to do |format|
      if @ldap_syn_attribute.update_attributes(params[:rim_ldap_syn_attribute])
        format.html { redirect_to({:action => "show"}, :notice => 'Ldap syn attribute was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_attribute.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    ldap_syn_attributes_scope =Irm::LdapSynAttribute.query_syn_info(I18n::locale,params[:ah_id],params[:type])
    ldap_syn_attributes = ldap_syn_attributes_scope.collect{|i| {:id=>i.id,
                                                                   :local_attr=>i.local_attr,
                                                                   :ldap_attr=>i.ldap_attr,
                                                                   :value_type_name=>i.value_type_name,

                                                                   :null_able=>i.null_able,
                                                                   :description=>i.description}}
    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_syn_attributes.to_grid_json([:local_attr,:ldap_attr,:value_type_name,:null_able,:description],ldap_syn_attributes.count))}
    end
  end
end
