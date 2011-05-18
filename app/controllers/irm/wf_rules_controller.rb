class Irm::WfRulesController < ApplicationController
  # GET /wf_rules
  # GET /wf_rules.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_rules }
    end
  end

  # GET /wf_rules/1
  # GET /wf_rules/1.xml
  def show
    @wf_rule = Irm::WfRule.list_all.find(params[:id])
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_rule }
    end
  end

  # GET /wf_rules/new
  # GET /wf_rules/new.xml
  def new
    if params[:irm_wf_rule]
      session[:irm_wf_rule].merge!(params[:irm_wf_rule])
      session[:irm_wf_rule][:step] = params[:step].to_i-1
    else
      session[:irm_wf_rule]={}
      session[:irm_rule_filter]=nil
      session[:irm_wf_rule][:step] = 0
    end
    @wf_rule = Irm::WfRule.new(session[:irm_wf_rule])
    if @wf_rule.valid?
      @wf_rule.step = @wf_rule.step.to_i+1
      session[:irm_wf_rule][:step] = @wf_rule.step
    end
    if @wf_rule.step.eql?(2)
      @wf_rule.evaluate_criteria_rule= "CREATE_EDIT_FIRST_TIME"
      if session[:irm_rule_filter]
        @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])
      else
        @rule_filter =Irm::RuleFilter.create_for_source(@wf_rule.bo_code,Irm::WfRule.name,0)
      end
    end
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_rule }
    end
  end

  # GET /wf_rules/1/edit
  def edit
    @wf_rule = Irm::WfRule.find(params[:id])
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first
  end

  # POST /wf_rules
  # POST /wf_rules.xml
  def create
    session[:irm_rule_filter] = params[:irm_rule_filter]
    session[:irm_wf_rule].merge!(params[:irm_wf_rule])
    @wf_rule = Irm::WfRule.new(session[:irm_wf_rule])
    @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])

    respond_to do |format|
      if @wf_rule.valid?&&@rule_filter.valid?
         @wf_rule.save
         @rule_filter.source_id = @wf_rule.id
         @rule_filter.save
         session[:irm_rule_filter] = nil
         session[:irm_wf_rule] = nil
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
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first

    respond_to do |format|
      if @wf_rule.update_attributes(params[:wf_rule])&&@rule_filter.update_attributes(params[:irm_rule_filter])
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

  def destroy_action
    @wf_rule_action = Irm::WfRuleAction.find(params[:id]);
    @wf_rule_action.destroy

    respond_to do |format|
      format.html { redirect_back_or_default({:action=>"show",:id=>params[:id]})
 }
      format.xml  { head :ok }
    end
  end

  def active
    @wf_rule = Irm::WfRule.find(params[:id])
    attrs = {}
    if(Irm::Constant::SYS_YES.eql?(params[:active]))
      attrs =  {:status_code=>"ENABLED"}
    else
      attrs =  {:status_code=>"OFFLINE"}
    end

    respond_to do |format|
      if @wf_rule.update_attributes(attrs)
        format.html { redirect_to({:action=>"show",:id=>@wf_rule.id}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { redirect_to({:action=>"show",:id=>@wf_rule.id}) }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    wf_rules_scope = Irm::WfRule.list_all.status_meaning
    #wf_rules_scope = wf_rules_scope.match_value("wf_rule.name",params[:name])
    wf_rules,count = paginate(wf_rules_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(wf_rules.to_grid_json([:name,:bo_name,:rule_code,:evaluate_criteria_rule_name],count))}
    end
  end
end
