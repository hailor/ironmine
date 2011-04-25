class Irm::WfRulesController < ApplicationController
  # GET /wf_rules
  # GET /wf_rules.xml
  def index
    @wf_rules = Irm::WfRule.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_rules }
    end
  end

  # GET /wf_rules/1
  # GET /wf_rules/1.xml
  def show
    @wf_rule = Irm::WfRule.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_rule }
    end
  end

  # GET /wf_rules/new
  # GET /wf_rules/new.xml
  def new
    @wf_rule = Irm::WfRule.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_rule }
    end
  end

  # GET /wf_rules/1/edit
  def edit
    @wf_rule = Irm::WfRule.find(params[:id])
  end

  # POST /wf_rules
  # POST /wf_rules.xml
  def create
    @wf_rule = Irm::WfRule.new(params[:wf_rule])

    respond_to do |format|
      if @wf_rule.save
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @wf_rule, :status => :created, :location => @wf_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_rules/1
  # PUT /wf_rules/1.xml
  def update
    @wf_rule = Irm::WfRule.find(params[:id])

    respond_to do |format|
      if @wf_rule.update_attributes(params[:wf_rule])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_rules/1
  # DELETE /wf_rules/1.xml
  def destroy
    @wf_rule = Irm::WfRule.find(params[:id])
    @wf_rule.destroy

    respond_to do |format|
      format.html { redirect_to(wf_rules_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @wf_rule = Irm::WfRule.find(params[:id])
  end

  def multilingual_update
    @wf_rule = Irm::WfRule.find(params[:id])
    @wf_rule.not_auto_mult=true
    respond_to do |format|
      if @wf_rule.update_attributes(params[:wf_rule])
        format.html { redirect_to({:action => "show"}, :notice => 'Wf rule was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    wf_rules_scope = Irm::WfRule.multilingual
    wf_rules_scope = wf_rules_scope.match_value("wf_rule.name",params[:name])
    wf_rules,count = paginate(wf_rules_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(wf_rules.to_grid_json([:name,:description,:status_meaning],count))}
    end
  end
end
