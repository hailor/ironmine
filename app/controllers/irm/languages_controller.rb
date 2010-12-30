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

   def show
    @language = Irm::Language.multilingual.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @language }
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
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @language, :status => :created, :location => @language }
      else
        @error = @language
        format.html { render "irm/common/error_message" }
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
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error=@language
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @language.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @language = Irm::Language.find(params[:id])
  end

  def multilingual_update
    @language = Irm::Language.find(params[:id])
    @language.not_auto_mult=true
    respond_to do |format|
      if @language.update_attributes(params[:irm_language])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @languages= Irm::Language.multilingual
    respond_to do |format|
      format.json {render :json=>@languages.to_dhtmlxgrid_json(['R',:language_code,:description, :installed_flag, :status_code,
                                                             {:value => 'M', :controller => 'irm/languages',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_language_list', :script => ''}], @languages.size)}
    end
  end
  
end
