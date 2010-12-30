class Irm::ScriptsController < ApplicationController
  # GET /scripts
  # GET /scripts.xml
  def index
    @script = Irm::Script.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scripts }
    end
  end

  def show
    @script = Irm::Script.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/new
  # GET /scripts/new.xml
  def new
    @script = Irm::Script.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/1/edit
  def edit
    @script = Irm::Script.multilingual.find(params[:id])
  end

  # POST /scripts
  # POST /scripts.xml
  def create
    @script = Irm::Script.new(params[:irm_script])

    respond_to do |format|
      if @script.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @script, :status => :created, :location => @script }
      else
        @error = @script
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scripts/1
  # PUT /scripts/1.xml
  def update
    @script = Irm::Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:irm_script])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @script
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @script = Irm::Script.find(params[:id])
  end

  def multilingual_update
    @script = Irm::Script.find(params[:id])
    @script.not_auto_mult=true
    respond_to do |format|
      if @script.update_attributes(params[:irm_script])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}, :notice => t(:successfully_updated)) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @scripts= Irm::Script.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@scripts.to_dhtmlxgrid_json(['R',:entity_meaning,:condition_code,:action_code,:template_code,:description,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/scripts',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_script_list', :script => ''}], @scripts.size)}
    end
  end
end
