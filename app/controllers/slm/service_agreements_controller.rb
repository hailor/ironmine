class Slm::ServiceAgreementsController < ApplicationController
  # GET /service_agreements
  # GET /service_agreements.xml
  def index
    @service_agreements = Slm::ServiceAgreement.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @service_agreements }
    end
  end

  # GET /service_agreements/1
  # GET /service_agreements/1.xml
  def show
    @service_agreement = Slm::ServiceAgreement.query_by_company_id(I18n::locale).multilingual.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @service_agreement }
    end
  end

  # GET /service_agreements/new
  # GET /service_agreements/new.xml
  def new
    @service_agreement = Slm::ServiceAgreement.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_agreement }
    end
  end

  # GET /service_agreements/1/edit
  def edit
    @service_agreement = Slm::ServiceAgreement.multilingual.find(params[:id])
  end

  # POST /service_agreements
  # POST /service_agreements.xml
  def create
    @service_agreement = Slm::ServiceAgreement.new(params[:slm_service_agreement])

    respond_to do |format|
      if @service_agreement.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @service_agreement, :status => :created, :location => @service_agreement }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_agreements/1
  # PUT /service_agreements/1.xml
  def update
    @service_agreement = Slm::ServiceAgreement.find(params[:id])

    respond_to do |format|
      if @service_agreement.update_attributes(params[:slm_service_agreement])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_agreements/1
  # DELETE /service_agreements/1.xml
  def destroy
    @service_agreement = Slm::ServiceAgreement.find(params[:id])
    @service_agreement.destroy

    respond_to do |format|
      format.html { redirect_to(service_agreements_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @service_agreement = Slm::ServiceAgreement.find(params[:id])
  end

  def multilingual_update
    @service_agreement = Slm::ServiceAgreement.find(params[:id])
    @service_agreement.not_auto_mult=true
    respond_to do |format|
      if @service_agreement.update_attributes(params[:service_agreement])
        format.html { redirect_to({:action=>"index"}, :notice => 'Service agreement was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_agreement.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    service_agreements_scope = Slm::ServiceAgreement.multilingual.status_meaning
    service_agreements_scope = service_agreements_scope.match_value("slm_service_agreements_tl.name",params[:name])
    service_agreements_scope = service_agreements_scope.match_value("slm_service_agreements.agreement_code",params[:agreement_code])
    service_agreements,count = paginate(service_agreements_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(service_agreements.to_grid_json([:agreement_code,
                                                                           :name,:description,:status_meaning],count))}
    end
  end

  def add_response_time_rule
     @service_agreement_id = params[:service_agreement_id]
     @service_agreement = Slm::ServiceAgreement.find(@service_agreement_id)
     @response_escalation_enabled = params[:response_escalation_enabled]
     @rs_first_day = params[:rs_first_day]
     @rs_first_hour = params[:rs_first_hour]
     @rs_first_minute = params[:rs_first_minute]
     @rs_first_escalation_mode = params[:rs_first_escalation_mode]
     @rs_first_assignee_type = params[:rs_first_assignee_type]
     @rs_first_escalation_assignee = params[:rs_first_escalation_assignee]
     if @response_escalation_enabled.to_i == 1
        rs_first_elapse_time = @rs_first_day.to_i * 86400 + @rs_first_hour.to_i * 60 + @rs_first_minute.to_i
        @service_agreement.not_auto_mult=true
        @service_agreement.update_attributes({:response_escalation_enabled=>@response_escalation_enabled,
                                              :rs_first_escalation_mode=>@rs_first_escalation_mode,
                                              :rs_first_elapse_time=>rs_first_elapse_time,
                                              :rs_first_assignee_type=>@rs_first_assignee_type,
                                              :rs_first_escalation_assignee=>@rs_first_escalation_assignee})
     end
    respond_to do |format|
      format.js
    end
  end

  def add_solve_time_rule
     @service_agreement_id = params[:service_agreement_id]
     @service_agreement = Slm::ServiceAgreement.find(@service_agreement_id)
     #======================first============================#
     @first_escalation_enabled = params[:first_escalation_enabled]
     @solve_first_day = params[:solve_first_day]
     @solve_first_hour = params[:solve_first_hour]
     @solve_first_minute = params[:solve_first_minute]
     @first_escalation_mode = params[:first_escalation_mode]
     @first_assignee_type = params[:first_assignee_type]
     @first_escalation_assignee = params[:first_escalation_assignee]
     @attr = Hash.new
     if @first_escalation_enabled.to_i == 1
        solve_first_elapse_time = @solve_first_day.to_i * 86400 + @solve_first_hour.to_i * 60 + @solve_first_minute.to_i
        @attr.merge!({:first_escalation_enabled=>@first_escalation_enabled,
                      :first_escalation_mode=>@first_escalation_mode,
                      :first_elapse_time=>solve_first_elapse_time,
                      :first_assignee_type=>@first_assignee_type,
                      :first_escalation_assignee=>@first_escalation_assignee})
     end
     #======================second============================#
     @second_escalation_enabled = params[:second_escalation_enabled]
     @solve_second_day = params[:solve_second_day]
     @solve_second_hour = params[:solve_second_hour]
     @solve_second_minute = params[:solve_second_minute]
     @second_escalation_mode = params[:second_escalation_mode]
     @second_assignee_type = params[:second_assignee_type]
     @second_escalation_assignee = params[:second_escalation_assignee]
     if @second_escalation_enabled.to_i == 1
        solve_second_elapse_time = @solve_second_day.to_i * 86400 + @solve_second_hour.to_i * 60 + @solve_second_minute.to_i
        @attr.merge!({:second_escalation_enabled=>@second_escalation_enabled,
                      :second_escalation_mode=>@second_escalation_mode,
                      :second_elapse_time=>solve_second_elapse_time,
                      :second_assignee_type=>@second_assignee_type,
                      :second_escalation_assignee=>@second_escalation_assignee})
     end
     #======================third============================#
     @third_escalation_enabled = params[:third_escalation_enabled]
     @solve_third_day = params[:solve_third_day]
     @solve_third_hour = params[:solve_third_hour]
     @solve_third_minute = params[:solve_third_minute]
     @third_escalation_mode = params[:third_escalation_mode]
     @third_assignee_type = params[:third_assignee_type]
     @third_escalation_assignee = params[:third_escalation_assignee]
     if @third_escalation_enabled.to_i == 1
        solve_third_elapse_time = @solve_third_day.to_i * 86400 + @solve_third_hour.to_i * 60 + @solve_third_minute.to_i
        @attr.merge!({:third_escalation_enabled=>@third_escalation_enabled,
                      :third_escalation_mode=>@third_escalation_mode,
                      :third_elapse_time=>solve_third_elapse_time,
                      :third_assignee_type=>@third_assignee_type,
                      :third_escalation_assignee=>@third_escalation_assignee})
     end
     #======================fourth============================#
     @fourth_escalation_enabled = params[:fourth_escalation_enabled]
     @solve_fourth_day = params[:rs_fourth_day]
     @solve_fourth_hour = params[:rs_fourth_hour]
     @solve_fourth_minute = params[:rs_fourth_minute]
     @fourth_escalation_mode = params[:fourth_escalation_mode]
     @fourth_assignee_type = params[:fourth_assignee_type]
     @fourth_escalation_assignee = params[:fourth_escalation_assignee]
     if @fourth_escalation_enabled.to_i == 1
        solve_fourth_elapse_time = @solve_fourth_day.to_i * 86400 + @solve_fourth_hour.to_i * 60 + @solve_fourth_minute.to_i
        @attr.merge!({:fourth_escalation_enabled=>@fourth_escalation_enabled,
                      :fourth_escalation_mode=>@fourth_escalation_mode,
                      :fourth_elapse_time=>solve_fourth_elapse_time,
                      :fourth_assignee_type=>@fourth_assignee_type,
                      :fourth_escalation_assignee=>@fourth_escalation_assignee})
     end
     if @attr.present?
        @service_agreement.not_auto_mult=true
        @service_agreement.update_attributes(@attr)
     end
    respond_to do |format|
      format.js
    end
  end

  def get_by_assignee_type
    @assignee_type = params[:assignee_type]
    result = ""
    if @assignee_type == 'USER'
       user_scope = Irm::Person.query_all_person
       user =  user_scope.collect{|i| {:label=>i[:person_name], :value=>i.id,:id=>i.id}}
       result =  user
    else
       role_scope = Irm::Role.multilingual.enabled
       role =  role_scope.collect{|i| {:label=>i[:name], :value=>i.id,:id=>i.id}}
       result =  role
    end
    respond_to do |format|
      format.json {render :json=>result.to_grid_json([:label,:value], result.count)}
    end
  end
end
