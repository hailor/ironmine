class Irm::ActionsController < ApplicationController
  # GET /actions
  # GET /actions.xml
  def index
    @action = Irm::Action.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @actions }
    end
  end

  # GET /actions/1
  # GET /actions/1.xml
  def show
    @action = Irm::Action.find(params[:id])

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
    @action = Irm::Action.multilingual.find(params[:id])
  end

  # POST /actions
  # POST /actions.xml
  def create
    @action = Irm::Action.new(params[:irm_action])

    respond_to do |format|
      if @action.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @action, :status => :created, :location => @action }
      else
        format.html { render :action => "new" }
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
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @conditions= Irm::Action.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@conditions.to_dhtmlxgrid_json(['R',:entity_meaning,:action_code,:name,:description,:handler,:status_meaning, 'M'], @conditions.size)}
    end
  end
end
