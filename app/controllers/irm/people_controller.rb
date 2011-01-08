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
    @person = Irm::Person.find(params[:id])
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
    @attributes.merge!({:function_group_code=>params[:function_group_code]}) if params[:function_group_code]
    @attributes.merge!({:unrestricted_access_flag=>params[:unrestricted_access_flag]}) if params[:unrestricted_access_flag]

    respond_to do |format|
      if @person.update_attributes(@attributes)
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @person
        format.html { render "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @people= Irm::Person.query_wrap_info(I18n::locale)
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
    @support_group= Irm::SupportGroupMember.query_support_group_by_person_id(I18n::locale,person_id)
    respond_to do |format|
      format.json {render :json=>@support_group.to_dhtmlxgrid_json(['R',:support_group_name,:status_meaning], @support_group.size)}
    end
  end

  def choose_company
    @person_id = params[:person_id]
  end
end
