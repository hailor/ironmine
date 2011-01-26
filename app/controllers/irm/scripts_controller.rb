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
    @script = Irm::Script.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /scripts
  # POST /scripts.xml
  def create
    @script = Irm::Script.new(params[:irm_script])

    respond_to do |format|
      if @script.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @script, :status => :created, :location => @script }
      else
        @error = @script
        format.html { render "new" }
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
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @script
        format.html { render "edit" }
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
    @scripts = @scripts.match_value("v3.condition_name",params[:condition_name])
    @scripts = @scripts.match_value("v4.action_name",params[:action_name])
    @scripts = @scripts.match_value("v5.template_name",params[:template_name])
    @scripts,count = paginate(@scripts)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@scripts.to_grid_json(['R',:entity_meaning,:condition_name,:action_name,:template_name,:description,:status_meaning], count))}
    end
  end
end
