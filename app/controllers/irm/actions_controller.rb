class Irm::ActionsController < ApplicationController
  # GET /actions
  # GET /actions.xml
  def index
    @action = Irm::Action.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @action }
    end
  end

  # GET /actions/1
  # GET /actions/1.xml
  def show
    @action = Irm::Action.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @action }
    end
  end

  # GET /actions/new
  # GET /actions/new.xml
  def new
    @action = Irm::Action.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @action }
    end
  end

  # GET /actions/1/edit
  def edit
    @action = Irm::Action.multilingual.query_wrap_info(I18n::locale).find(params[:id])
  end

  # POST /actions
  # POST /actions.xml
  def create
    @action = Irm::Action.new(params[:irm_action])

    respond_to do |format|
      if @action.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @action, :status => :created, :location => @action }
      else
        @error = @action
        format.html { render "new" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /actions/1
  # PUT /actions/1.xml
  def update
    @action = Irm::Action.find(params[:id])

    respond_to do |format|
      if @action.update_attributes(params[:irm_action])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @action
        format.html { render "edit" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @action = Irm::Action.find(params[:id])
  end

  def multilingual_update
    @action = Irm::Action.find(params[:id])
    @action.not_auto_mult=true
    respond_to do |format|
      if @action.update_attributes(params[:irm_action])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @actions= Irm::Action.multilingual.query_wrap_info(I18n::locale)
    @actions = @actions.match_value("#{Irm::Action.table_name}.action_code",params[:action_code])
    @actions = @actions.match_value("#{Irm::ActionsTl.table_name}.name",params[:name])
    @actions,count = paginate(@actions)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@actions.to_grid_json([:entity_meaning,:action_code,:name,:description,:handler,:status_meaning],count))}
    end
  end
end
