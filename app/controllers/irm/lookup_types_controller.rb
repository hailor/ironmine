class Irm::LookupTypesController < ApplicationController
  # GET /lookup_types
  # GET /lookup_types.xml
  def index
    @lookup_types = Irm::LookupType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lookup_types }
    end
  end

  # GET /lookup_types/1
  # GET /lookup_types/1.xml
  def show
    @lookup_type = Irm::LookupType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @lookup_type }
    end
  end

  # GET /lookup_types/new
  # GET /lookup_types/new.xml
  def new
    @lookup_type = Irm::LookupType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @lookup_type }
    end
  end

  # GET /lookup_types/1/edit
  def edit
    @lookup_type = Irm::LookupType.find(params[:id])
  end

  # POST /lookup_types
  # POST /lookup_types.xml
  def create
    @lookup_type = Irm::LookupType.new(params[:lookup_type])

    respond_to do |format|
      if @lookup_type.save
        format.html { redirect_to(@lookup_type, :notice => 'Lookup type was successfully created.') }
        format.xml  { render :xml => @lookup_type, :status => :created, :location => @lookup_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @lookup_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lookup_types/1
  # PUT /lookup_types/1.xml
  def update
    @lookup_type = Irm::LookupType.find(params[:id])

    respond_to do |format|
      if @lookup_type.update_attributes(params[:lookup_type])
        format.html { redirect_to(@lookup_type, :notice => 'Lookup type was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @lookup_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /lookup_types/1
  # DELETE /lookup_types/1.xml
  def destroy
    @lookup_type = Irm::LookupType.find(params[:id])
    @lookup_type.destroy

    respond_to do |format|
      format.html { redirect_to(lookup_types_url) }
      format.xml  { head :ok }
    end
  end
end
