class Irm::WfApprovalProcessesController < ApplicationController
  # GET /wf_approval_processes
  # GET /wf_approval_processes.xml
  def index
    @bo_code = params[:bo_code]||Irm::BusinessObject.enabled.multilingual.where(:workflow_flag=>Irm::Constant::SYS_YES).first.business_object_code

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_approval_processes }
    end
  end

  # GET /wf_approval_processes/1
  # GET /wf_approval_processes/1.xml
  def show
    @wf_approval_process = Irm::WfApprovalProcess.list_all.find(params[:id])
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalProcess.name,@wf_approval_process.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_approval_process }
    end
  end

  # GET /wf_approval_processes/new
  # GET /wf_approval_processes/new.xml
  def new
    if params[:irm_wf_approval_process]
      session[:irm_wf_approval_process].merge!(params[:irm_wf_approval_process].symbolize_keys)
    else
      session[:irm_wf_approval_process]={:bo_code=>params[:bo_code],:step=>1}
      session[:irm_rule_filter]=nil
    end
    @wf_approval_process = Irm::WfApprovalProcess.new(session[:irm_wf_approval_process])
    @wf_approval_process.step = @wf_approval_process.step.to_i if  @wf_approval_process.step.present?
    unless  @wf_approval_process.bo_code.present?
      redirect_to({:action => "index"})
      return
    end

    validate_result =  request.post?&&@wf_approval_process.valid?
    # validate filter
    if request.post?&&@wf_approval_process.step.eql?(2)
      session[:irm_rule_filter] = params[:irm_rule_filter]
      @rule_filter = Irm::RuleFilter.new(session[:irm_rule_filter])
      validate_result = validate_result&&@rule_filter.valid?
    end

    if validate_result
      if(params[:pre_step])
        @wf_approval_process.step = @wf_approval_process.step.to_i-1
        session[:irm_wf_approval_process][:step] = @wf_approval_process.step
      else
        if @wf_approval_process.step<4
          @wf_approval_process.step = @wf_approval_process.step.to_i+1
          session[:irm_wf_approval_process][:step] = @wf_approval_process.step
        end
      end
    end

    #prepare step 2
    if validate_result&&@wf_approval_process.step.eql?(2)
      if session[:irm_rule_filter]
        @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])
      else
        @rule_filter =Irm::RuleFilter.create_for_source(@wf_approval_process.bo_code,Irm::WfApprovalProcess.name,0)
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @wf_approval_process }
    end
  end

  # GET /wf_approval_processes/1/edit
  def edit
    @wf_approval_process = Irm::WfApprovalProcess.find(params[:id])
    if params[:irm_wf_approval_process]
      session[:irm_wf_approval_process].merge!(params[:irm_wf_approval_process].symbolize_keys)
    else
      session[:irm_wf_approval_process]={:step=>1}
      session[:irm_rule_filter]=nil
    end

    @wf_approval_process.attributes = session[:irm_wf_approval_process]
    @wf_approval_process.step =  @wf_approval_process.step.to_i if @wf_approval_process.step

    validate_result =  request.put?&&@wf_approval_process.valid?
    # validate filter
    if request.put?&&@wf_approval_process.step.eql?(2)
      session[:irm_rule_filter] = params[:irm_rule_filter]
      @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalProcess.name,@wf_approval_process.id).first
      @rule_filter.attributes = session[:irm_rule_filter]
      validate_result = validate_result&&@rule_filter.valid?
    end

    if validate_result
      if(params[:pre_step])
        @wf_approval_process.step = @wf_approval_process.step.to_i-1
        session[:irm_wf_approval_process][:step] = @wf_approval_process.step
      else
        if @wf_approval_process.step<4
          @wf_approval_process.step = @wf_approval_process.step.to_i+1
          session[:irm_wf_approval_process][:step] = @wf_approval_process.step
        end
      end
    end

    #prepare step 2
    if validate_result&&@wf_approval_process.step.eql?(2)
      if session[:irm_rule_filter]
        @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalProcess.name,@wf_approval_process.id).first
        @rule_filter.attributes = session[:irm_rule_filter]
      else
        @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalProcess.name,@wf_approval_process.id).first
      end
    end

  end

  # POST /wf_approval_processes
  # POST /wf_approval_processes.xml
  def create
    session[:irm_wf_approval_process].merge!(params[:irm_wf_approval_process].symbolize_keys)
    @wf_approval_process = Irm::WfApprovalProcess.new(session[:irm_wf_approval_process])
    @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])

    respond_to do |format|
      if @wf_approval_process.valid?&&@rule_filter.valid?
         @wf_approval_process.create_submitter_from_str
         @wf_approval_process.save
         @rule_filter.source_id = @wf_approval_process.id
         @rule_filter.save
         session[:irm_rule_filter] = nil
         session[:irm_wf_approval_process] = nil
        format.html { redirect_to({:action => "show",:id=>@wf_approval_process.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @wf_approval_process, :status => :created, :location => @wf_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_approval_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_approval_processes/1
  # PUT /wf_approval_processes/1.xml
  def update
    session[:irm_wf_approval_process].merge!(params[:irm_wf_approval_process].symbolize_keys)
    @wf_approval_process = Irm::WfApprovalProcess.find(params[:id])
    @wf_approval_process.attributes = session[:irm_wf_approval_process]

    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalProcess.name,@wf_approval_process.id).first
    @rule_filter.attributes = session[:irm_rule_filter]

    respond_to do |format|
      if @wf_approval_process.valid?&&@rule_filter.valid?
        @wf_approval_process.create_submitter_from_str
        @wf_approval_process.save
        @rule_filter.save
        session[:irm_rule_filter] = nil
        session[:irm_wf_approval_process] = nil
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_approval_process.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_approval_processes/1
  # DELETE /wf_approval_processes/1.xml
  def destroy
    @wf_approval_process = Irm::WfApprovalProcess.find(params[:id])
    @wf_approval_process.destroy

    respond_to do |format|
      format.html { redirect_to(wf_approval_processes_url) }
      format.xml  { head :ok }
    end
  end

end
