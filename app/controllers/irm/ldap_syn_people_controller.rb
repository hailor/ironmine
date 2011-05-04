class Irm::LdapSynPeopleController < ApplicationController
  # GET /ldap_syn_people
  # GET /ldap_syn_people.xml
  def index
    @ldap_syn_people = Irm::LdapSynPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ldap_syn_people }
    end
  end

  # GET /ldap_syn_people/1
  # GET /ldap_syn_people/1.xml
  def show
    @ldap_syn_person = Irm::LdapSynPerson.query_show_wrap_info(I18n::locale).find(params[:id])
    @ldap_syn_object_type = "IRM_PEOPLE"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_syn_person }
    end
  end

  # GET /ldap_syn_people/new
  # GET /ldap_syn_people/new.xml
  def new
    @ldap_syn_person = Irm::LdapSynPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_syn_person }
    end
  end

  # GET /ldap_syn_people/1/edit
  def edit
    @ldap_syn_person = Irm::LdapSynPerson.find(params[:id])
  end

  # POST /ldap_syn_people
  # POST /ldap_syn_people.xml
  def create
    @ldap_syn_person = Irm::LdapSynPerson.new(params[:irm_ldap_syn_person])

    respond_to do |format|
      if @ldap_syn_person.save
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @ldap_syn_person, :status => :created, :location => @ldap_syn_person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_syn_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_syn_people/1
  # PUT /ldap_syn_people/1.xml
  def update
    @ldap_syn_person = Irm::LdapSynPerson.find(params[:id])

    respond_to do |format|
      if @ldap_syn_person.update_attributes(params[:irm_ldap_syn_person])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_syn_people/1
  # DELETE /ldap_syn_people/1.xml
  def destroy
    @ldap_syn_person = Irm::LdapSynPerson.find(params[:id])
    @ldap_syn_person.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_syn_people_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @ldap_syn_person = Irm::LdapSynPerson.find(params[:id])
  end

  def multilingual_update
    @ldap_syn_person = Irm::LdapSynPerson.find(params[:id])
    @ldap_syn_person.not_auto_mult=true
    respond_to do |format|
      if @ldap_syn_person.update_attributes(params[:irm_ldap_syn_person])
        format.html { redirect_to({:action => "show"}, :notice => 'Ldap syn person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_syn_person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    ldap_syn_people_scope = Irm::LdapSynPerson.query_show_wrap_info(I18n::locale)
    ldap_syn_people_scope = ldap_syn_people_scope.match_value("ldap_syn_person.name",params[:name])
    ldap_syn_people,count = paginate(ldap_syn_people_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(ldap_syn_people.to_grid_json([:ldap_name,:auth_name,:ldap_dn,:description],count))}
    end
  end

  def get_by_ldap_source()
    syn_peo_scope = Irm::LdapSynPerson.query_syn_by_source(params[:belonged_ldap_source_id])
    syn_people = syn_peo_scope.collect{|i| {:label=>i[:ldap_name],:value=>i.id,:id=>i.id}}
    respond_to do |format|
      format.json {render :json=>syn_people.to_grid_json([:label,:value],syn_people.count)}
    end
  end
end
