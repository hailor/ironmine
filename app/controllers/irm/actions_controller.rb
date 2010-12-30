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
        @error = @action
        format.html { render "irm/common/error_message" }
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
        @error = @action
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @action.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @action = Irm::Action.multilingual.find(params[:id])
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
    respond_to do |format|
      format.json {render :json=>@actions.to_dhtmlxgrid_json(['R',:entity_meaning,:action_code,:name,:description,:handler,:status_meaning,
                                                             {:value => 'M', :controller => 'irm/actions',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_action_list', :script => ''}],@actions.size)}
    end
  end
end
