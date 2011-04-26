class Slm::ServiceMembersController < ApplicationController
  def index
  end

  # GET /service_members/new
  # GET /service_members/new.xml
  def new
    @service_member = Slm::ServiceMember.new
    @return_url=request.env['HTTP_REFERER']
    @service_catalog_id = params[:service_catalog_id]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @service_member }
    end
  end

  # GET /service_members/1/edit
  def edit
    @service_member = Slm::ServiceMember.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
    @service_catalog_id = params[:service_catalog_id]
  end

  # POST /service_members
  # POST /service_members.xml
  def create
    @service_member = Slm::ServiceMember.new(params[:slm_service_member])
    return_url = params[:return_url]

    respond_to do |format|
      if @service_member.save
        format.html { redirect_to(return_url, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @service_member, :status => :created, :location => @service_member }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @service_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /service_members/1
  # PUT /service_members/1.xml
  def update
    @service_member = Slm::ServiceMember.find(params[:id])
    return_url = params[:return_url]

    respond_to do |format|
      if @service_member.update_attributes(params[:slm_service_member])
        format.html { redirect_to(return_url, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @service_member.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /service_members/1
  # DELETE /service_members/1.xml
  def destroy
    @service_member = Slm::ServiceMember.find(params[:id])
    @service_member.destroy
    @return_url=request.env['HTTP_REFERER']

    respond_to do |format|
      format.html { redirect_to(@return_url, :notice => t(:successfully_deleted)) }
      format.xml  { head :ok }
    end
  end

  def get_data
    service_members_scope = Slm::ServiceMember.query_by_company_id(I18n::locale).
                            query_wrap_info(I18n::locale)
    service_members,count = paginate(service_members_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(service_members.to_grid_json([:service_company_name,:service_organization_name,
                                                                        :service_department_name,:service_person_name,
                                                                        :service_contract_name,:status_meaning],count))}
    end
  end
end