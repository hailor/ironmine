class Irm::ScriptsController < ApplicationController
  # GET /scripts
  # GET /scripts.xml
  def index

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { @script = Irm::Script.new
                    render :xml => @scripts }
    end
  end

  def show
    @script = Irm::Script.list_all.find(params[:id])

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
    scripts_scope = Irm::Script.list_all
    scripts_scope = scripts_scope.match_value("#{Irm::ScriptContext.view_name}.name",params[:context_name])
    scripts_scope = scripts_scope.match_value("#{Irm::Condition.view_name}.name",params[:condition_name])
    scripts_scope = scripts_scope.match_value("#{Irm::Action.view_name}.name",params[:action_name])
    scripts_scope = scripts_scope.match_value("#{Irm::MailTemplate.view_name}.name",params[:template_name])

    scripts,count = paginate(scripts_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(scripts.to_grid_json([:condition_name,:action_name,:template_name,:description,:status_meaning], count))}
    end
  end
end
