class Irm::WfRuleTimeTriggersController < ApplicationController

  # GET /wf_rule_time_triggers/new
  # GET /wf_rule_time_triggers/new.xml
  def new
    @wf_rule_time_trigger = Irm::WfRuleTimeTrigger.new(:rule_id=>params[:rule_id])

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_rule_time_trigger }
    end
  end

  # GET /wf_rule_time_triggers/1/edit
  def edit
    @wf_rule_time_trigger = Irm::WfRuleTimeTrigger.find(params[:id])
  end

  # POST /wf_rule_time_triggers
  # POST /wf_rule_time_triggers.xml
  def create
    @wf_rule_time_trigger = Irm::WfRuleTimeTrigger.new(params[:irm_wf_rule_time_trigger])

    respond_to do |format|
      if @wf_rule_time_trigger.save
        format.html {           redirect_back_or_default({:controller=>"irm/wf_rules",:action=>"show",:id=>@wf_rule_time_trigger.rule_id})}
        format.xml  { render :xml => @wf_rule_time_trigger, :status => :created, :location => @wf_rule_time_trigger }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_rule_time_trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_rule_time_triggers/1
  # PUT /wf_rule_time_triggers/1.xml
  def update
    @wf_rule_time_trigger = Irm::WfRuleTimeTrigger.find(params[:id])

    respond_to do |format|
      if @wf_rule_time_trigger.update_attributes(params[:irm_wf_rule_time_trigger])
        format.html {  redirect_back_or_default({:controller=>"irm/wf_rules",:action=>"show",:id=>@wf_rule_time_trigger.rule_id})}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_rule_time_trigger.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_rule_time_triggers/1
  # DELETE /wf_rule_time_triggers/1.xml
  def destroy
    @wf_rule_time_trigger = Irm::WfRuleTimeTrigger.find(params[:id])
    @wf_rule_time_trigger.destroy
    Irm::WfRuleAction.where(:time_trigger_id=>params[:id]).delete_all

    respond_to do |format|
      format.html {  redirect_back_or_default({:controller=>"irm/wf_rules",:action=>"show",:id=>@wf_rule_time_trigger.rule_id})}
      format.xml  { head :ok }
    end
  end
end
