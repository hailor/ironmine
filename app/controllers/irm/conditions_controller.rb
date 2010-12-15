class Irm::ConditionsController < ApplicationController
  # GET /conditions
  # GET /conditions.xml
  def index
    @condition = Irm::Condition.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/1
  # GET /conditions/1.xml
  def show
    @condition = Irm::Condition.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/new
  # GET /conditions/new.xml
  def new
    @condition = Irm::Condition.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @condition }
    end
  end

  # GET /conditions/1/edit
  def edit
    @condition = Irm::Condition.multilingual.find(params[:id])
  end

  # POST /conditions
  # POST /conditions.xml
  def create
    @condition = Irm::Condition.new(params[:irm_condition])

    respond_to do |format|
      if @condition.save
        flash[:successful_message] = (t :successfully_created)
        format.html { render "return" }
        format.xml  { render :xml => @condition, :status => :created, :location => @condition }
      else
        @error = @condition
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /conditions/1
  # PUT /conditions/1.xml
  def update
    @condition = Irm::Condition.find(params[:id])

    respond_to do |format|
      if @condition.update_attributes(params[:irm_condition])
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @condition
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @condition.errors, :status => :unprocessable_entity }
      end
    end
  end

  def multilingual_edit
    @condition = Irm::Condition.find(params[:id])
  end

  def multilingual_update
    @condition = Irm::Condition.find(params[:id])
    @condition.not_auto_mult=true
    respond_to do |format|
      if @condition.update_attributes(params[:irm_condition])
        format.html { render({:action=>"multilingual_edit",:format=>"js"}) }
      else
        format.html { render({:action=>"multilingual_edit"}) }
      end
    end
  end

  def get_data
    @conditions= Irm::Condition.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@conditions.to_dhtmlxgrid_json(['R',:entity_meaning,:condition_code,:name,:description, :status_meaning,
                                                             {:value => 'M', :controller => 'irm/conditions',:action =>  'multilingual_edit', :id => 'id', :action_type => 'multilingual',:view_port=>'id_condition_list', :script => ''}], @conditions.size)}
    end
  end
end
