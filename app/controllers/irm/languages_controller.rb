class Irm::LanguagesController < ApplicationController
  # GET /languages
  # GET /languages.xml
  def index
    @language = Irm::Language.new(:installed_flag=>'Y')
    
    respond_to do |format|
      format.html
      format.xml  { render :xml => languages }
    end
  end
  
  # GET /languages/new
  # GET /languages/new.xml
  def new
    @language = Irm::Language.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @language }
    end
  end

  # GET /languages/1/edit
  def edit
    @language = Irm::Language.multilingual.find(params[:id])
  end

  # POST /languages
  # POST /languages.xml
  def create
    @language = Irm::Language.new(params[:irm_language])

    respond_to do |format|
      if @language.save
        format.html { render "create_successful_info" }
        format.xml  { render :xml => @language, :status => :created, :location => @language }
      else
        @error = @language
        format.html { render "error_info" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /languages/1
  # PUT /languages/1.xml
  def update
    @language = Irm::Language.find(params[:id])

    respond_to do |format|
      if @language.update_attributes(params[:irm_language])
        format.html { render "update_successful_info" }
        format.xml  { head :ok }
      else
        format.html { render "error_info" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @languages= Irm::Language.multilingual
    respond_to do |format|
      format.json {render :json=>@languages.to_dhtmlxgrid_json(['0', {:value => :language_code, :controller => 'irm/languages',:action =>  'edit', :id => 'id', :action_type => 'ajaxLink', :script => '/replace(id_language_new,id_language_edit);/'},
                                                                         :description, :installed_flag, :status_code, 'M'], @languages.size)}
    end
  end
  
end
