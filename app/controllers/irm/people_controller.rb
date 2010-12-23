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
    @person = Irm::Person.new(params[:person])

    respond_to do |format|
      if @person.save
        format.html { redirect_to(@person, :notice => 'Person was successfully created.') }
        format.xml  { render :xml => @person, :status => :created, :location => @person }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /people/1
  # PUT /people/1.xml
  def update
    @person = Irm::Person.find(params[:id])

    respond_to do |format|
      if @person.update_attributes(params[:person])
        format.html { redirect_to(@person, :notice => 'Person was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @person.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @people= Irm::Person.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@people.to_dhtmlxgrid_json(['R',:login_name,:person_name,:email_address,:mobile_phone,:company_name], @people.size)}
    end
  end

end
