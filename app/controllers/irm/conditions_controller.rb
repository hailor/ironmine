class Irm::ConditionsController < ApplicationController
  # GET /conditions
  # GET /conditions.xml
  def index


    respond_to do |format|
      format.html # index.html.erb
      format.xml  { @condition = Irm::Condition.all
                    render :xml => @condition }
    end
  end

  # GET /conditions/1
  # GET /conditions/1.xml
  def show
    @condition = Irm::Condition.list_all.find(params[:id])

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
    @condition = Irm::Condition.list_all.find(params[:id])
  end

  # POST /conditions
  # POST /conditions.xml
  def create
    @condition = Irm::Condition.new(params[:irm_condition])

    respond_to do |format|
      if @condition.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}        
        format.xml  { render :xml => @condition, :status => :created, :location => @condition }
      else
        @error = @condition
        format.html { render "new" }
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
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @condition
        format.html { render "edit" }
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
    conditions_scope = Irm::Condition.list_all
    conditions_scope = conditions_scope.match_value("#{Irm::Condition.table_name}.condition_code",params[:condition_code])
    conditions_scope = conditions_scope.match_value("#{Irm::ScriptContext.view_name}.name",params[:context_name])
    conditions_scope = conditions_scope.match_value("#{Irm::ConditionsTl.table_name}.name",params[:name])
    conditions,count = paginate(conditions_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(conditions.to_grid_json([:context_name,:condition_code,:name,:description, :status_meaning], count))}
    end
  end
end
