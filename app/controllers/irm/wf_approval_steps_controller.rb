class Irm::WfApprovalStepsController < ApplicationController
  before_filter :setup_process,:except => [:index,:show]
  # GET /wf_approval_steps
  # GET /wf_approval_steps.xml
  def index
    redirect_to(:controller => "irm/wf_approval_processes",:action => "index")
  end

  # GET /wf_approval_steps/1
  # GET /wf_approval_steps/1.xml
  def show
    @wf_approval_step = Irm::WfApprovalStep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_approval_step }
    end
  end

  # GET /wf_approval_steps/new
  # GET /wf_approval_steps/new.xml
  def new
    if params[:irm_wf_approval_step]
      session[:irm_wf_approval_step].merge!(params[:irm_wf_approval_step].symbolize_keys)
    else
      session[:irm_wf_approval_step]={:process_id=>params[:process_id],:step=>1}
      session[:irm_rule_filter]=nil
    end
    @wf_approval_step = Irm::WfApprovalStep.new(session[:irm_wf_approval_step])
    @wf_approval_step.step = @wf_approval_step.step.to_i if  @wf_approval_step.step.present?


    validate_result =  request.post?&&@wf_approval_step.valid?
    # validate filter
    if request.post?&&@wf_approval_step.step.eql?(2)
      session[:irm_rule_filter] = params[:irm_rule_filter]
      @rule_filter = Irm::RuleFilter.new(session[:irm_rule_filter])
      validate_result = validate_result&&@rule_filter.valid?
      @wf_approval_step.evaluate_mode = "FILTER" unless @rule_filter.valid?
    end

    if validate_result
      if(params[:pre_step])&&@wf_approval_step.step>1
        @wf_approval_step.step = @wf_approval_step.step.to_i-1
        session[:irm_wf_approval_step][:step] = @wf_approval_step.step
      else
        if @wf_approval_step.step<3
          @wf_approval_step.step = @wf_approval_step.step.to_i+1
          session[:irm_wf_approval_step][:step] = @wf_approval_step.step
        end
      end
    end

    #prepare step 2
    if validate_result&&@wf_approval_step.step.eql?(2)
      if session[:irm_rule_filter]
        @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])
      else
        @rule_filter =Irm::RuleFilter.create_for_source(@wf_approval_process.bo_code,Irm::WfApprovalStep.name,0)
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_approval_process }
    end
  end

  # POST /wf_approval_steps
  # POST /wf_approval_steps.xml
  def create
    session[:irm_wf_approval_step].merge!(params[:irm_wf_approval_step].symbolize_keys)
    @wf_approval_step = Irm::WfApprovalStep.new(session[:irm_wf_approval_step])
    @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])

    # process approver
    unless(@wf_approval_step.approver_mode.eql?("AUTO_APPROVER"))
      @wf_approval_step.approver_value_str=""
    end

    respond_to do |format|
      if @wf_approval_step.valid?&&@rule_filter.valid?
         @wf_approval_step.create_approver_from_str
         @wf_approval_step.save
         @rule_filter.source_id = @wf_approval_step.id
         @rule_filter.save
         session[:irm_rule_filter] = nil
         session[:irm_wf_approval_step] = nil
        format.html { redirect_to({:controller => "irm/wf_approval_processes",:action => "show",:id=>@wf_approval_process.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @wf_approval_step, :status => :created, :location => @wf_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_approval_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # GET /wf_approval_steps/1/edit
  def edit
    @wf_approval_step = Irm::WfApprovalStep.find(params[:id])
    if params[:irm_wf_approval_step]
      session[:irm_wf_approval_step].merge!(params[:irm_wf_approval_step].symbolize_keys)
    else
      session[:irm_wf_approval_step]={:step=>1}
      session[:irm_rule_filter]=nil
    end
    @wf_approval_step.attributes = session[:irm_wf_approval_step]
    @wf_approval_step.step = @wf_approval_step.step.to_i if  @wf_approval_step.step.present?


    validate_result =  request.put?&&@wf_approval_step.valid?
    # validate filter
    if request.put?&&@wf_approval_step.step.eql?(2)
      session[:irm_rule_filter] = params[:irm_rule_filter]
      @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalStep.name,@wf_approval_step.id).first
      @rule_filter.attributes = session[:irm_rule_filter]
      validate_result = validate_result&&@rule_filter.valid?
      @wf_approval_step.evaluate_mode = "FILTER" unless @rule_filter.valid?
    end
    # change step
    if validate_result
      if(params[:pre_step])&&@wf_approval_step.step>1
        @wf_approval_step.step = @wf_approval_step.step.to_i-1
        session[:irm_wf_approval_step][:step] = @wf_approval_step.step
      else
        if @wf_approval_step.step<3
          @wf_approval_step.step = @wf_approval_step.step.to_i+1
          session[:irm_wf_approval_step][:step] = @wf_approval_step.step
        end
      end
    end

    #prepare step 2
    if validate_result&&@wf_approval_step.step.eql?(2)
      if session[:irm_rule_filter]
        @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalStep.name,@wf_approval_step.id).first
        @rule_filter.attributes = session[:irm_rule_filter]
      else
        @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalStep.name,@wf_approval_step.id).first
      end
    end
  end



  # PUT /wf_approval_steps/1
  # PUT /wf_approval_steps/1.xml
  def update
    @wf_approval_step = Irm::WfApprovalStep.find(params[:id])
    session[:irm_wf_approval_step].merge!(params[:irm_wf_approval_step].symbolize_keys)
    @wf_approval_step.attributes =  session[:irm_wf_approval_step]

    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalStep.name,@wf_approval_step.id).first
    @rule_filter.attributes = session[:irm_rule_filter]
    # process approver
    unless(@wf_approval_step.approver_mode.eql?("AUTO_APPROVER"))
      @wf_approval_step.approver_value_str=""
    end

    respond_to do |format|
      if @wf_approval_step.valid?&&@rule_filter.valid?
         @wf_approval_step.create_approver_from_str
         @wf_approval_step.save
         @rule_filter.save
         session[:irm_rule_filter] = nil
         session[:irm_wf_approval_step] = nil
        format.html { redirect_to({:controller => "irm/wf_approval_processes",:action => "show",:id=>@wf_approval_process.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @wf_approval_step, :status => :created, :location => @wf_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_approval_step.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_approval_steps/1
  # DELETE /wf_approval_steps/1.xml
  def destroy
    @wf_approval_step = Irm::WfApprovalStep.find(params[:id])
    @wf_approval_step.delete_self

    respond_to do |format|
      format.html { redirect_to({:controller => "irm/wf_approval_processes",:action => "show",:id=>params[:process_id]}, :notice => t(:successfully_updated)) }
      format.xml  { head :ok }
    end
  end

  private
  def setup_process
    @wf_approval_process = Irm::WfApprovalProcess.find(params[:process_id])
  end
end
