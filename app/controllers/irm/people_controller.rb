class Irm::PeopleController < ApplicationController
  # GET /people
  # GET /people.xml
  def index
    @people = Irm::Person.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @people }
    end
  end

  def show
    @person = Irm::Person.query_by_company_id(I18n::locale).query_show_wrap_info(I18n::locale).find(params[:id])
    @company_access_count= Irm::CompanyAccess.query_by_person_id(params[:id]).query_wrap_info(I18n::locale).size
    @support_group_count = Irm::SupportGroupMember.query_support_group_by_person_id(I18n::locale,params[:id]).size
    @owned_roles_count = @person.roles.size 
  end

  # GET /people/new
  # GET /people/new.xml
  def new
    @person = Irm::Person.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @person }
    end
  end

  # GET /people/1/edit
  def edit
    @person = Irm::Person.find(params[:id])
  end

  # POST /people
  # POST /people.xml
  def create
    @person = Irm::Person.new(params[:irm_person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Irm::Person.find(params[:id])
    @attributes = params[:irm_person]
    @attributes.merge!({:identity_id=>params[:identity_id]}) if params[:identity_id]
    @attributes.merge!({:unrestricted_access_flag=>params[:unrestricted_access_flag]}) if params[:unrestricted_access_flag]

    respond_to do |format|
      if @person.update_attributes(@attributes)
        if params[:return_url]
          format.html {redirect_to(params[:return_url])}
          format.xml { head :ok}
        else
          format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
          format.xml  { head :ok }
        end
      else
        @error = @person
        format.html { render "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @people= Irm::Person.query_wrap_info(I18n::locale)
    @people = @people.match_value("#{Irm::Identity.table_name}.login_name",params[:login_name])
    @people = @people.match_value("CONCAT(#{Irm::Person.table_name}.last_name,#{Irm::Person.table_name}.first_name)",params[:person_name])
    @people = @people.match_value("#{Irm::Person.table_name}.email_address",params[:email_address])
    @people = @people.match_value("v2.company_name",params[:company_name])

    @people,count = paginate(@people)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@people.to_grid_json(['R',:login_name,:person_name,:email_address,:mobile_phone,:company_name], count))}
    end
  end

  def login_access
    person_id = params[:person_id]
    @person = Irm::Person.find(person_id)
  end

  def get_choose_people
    @choose_people= Irm::Person.query_choose_person.query_by_support_staff_flag("Y")
    respond_to do |format|
      format.json {render :json=>@choose_people.to_dhtmlxgrid_json(['R',:person_name,:email_address,:mobile_phone], @choose_people.size)}
    end
  end

  def get_support_group
    person_id = params[:person_id]
    @support_groups= Irm::SupportGroupMember.query_support_group_by_person_id(I18n::locale,person_id)
    @support_groups,count = paginate(@support_groups)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@support_groups.to_grid_json(['R',:support_group_name,:description,:status_meaning], count))}
    end
  end

  def choose_company
    @person_id = params[:person_id]
  end

  def get_owned_roles
    roles_scope = Irm::Role.multilingual.belongs_to_person(params[:person_id])
    roles,count = paginate(roles_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(roles.to_grid_json([:name,:role_code,:status_code,  :description], count)) }
    end    
  end

  def get_available_roles
    roles_scope = Irm::Role.multilingual.enabled.query_by_role_name(params[:role_name]).without_person(params[:person_id])
    roles,count = paginate(roles_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(roles.to_grid_json([:name,:role_code,:status_code, :description], count)) }
    end   
  end

  def remove_role
    return_url=params[:return_url]
    person_role = Irm::PersonRole.where(:person_id => params[:person_id], :role_id => params[:role_id]).first
    person_role.destroy
    if return_url.blank?
      redirect_to({:action=>"show", :id=> params[:person_id]})
    else
      redirect_to(return_url)
    end        
  end

  def select_roles
    @return_url=params[:return_url]||request.env['HTTP_REFERER']
    @person = Irm::Person.find(params[:person_id])
    @role_name = params[:role_name] if params[:role_name]
  end

  def add_roles
    return_url=params[:return_url]
#    permissions = Irm::Permission.where("id IN (?)", params[:irm_function_permissions][:permission_code])
    params[:irm_person_roles][:ids].each do |p|
      Irm::PersonRole.create({:role_id => Irm::Role.find(p).id, :person_id => params[:person_id]})
    end

    flash[:notice] = t(:successfully_updated)
    if return_url.blank?
      redirect_to({:action=>"select_roles", :person_id=> params[:person_id]})
    else
      redirect_to(return_url)
    end    
  end
end
