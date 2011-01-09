class Irm::SupportGroupsController < ApplicationController
  # GET /support_groups
  # GET /support_groups.xml
  def index
    @support_group = Irm::SupportGroup.new

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @support_group }
    end
  end

  # GET /support_groups/1
  # GET /support_groups/1.xml
  def show
    @support_group = Irm::SupportGroup.multilingual.query_wrap_info(I18n::locale).find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @support_group }
    end
  end

  # GET /support_groups/new
  # GET /support_groups/new.xml
  def new
    @support_group = Irm::SupportGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @support_group }
    end
  end

  # GET /support_groups/1/edit
  def edit
    @support_group = Irm::SupportGroup.multilingual.find(params[:id])
  end

  # POST /support_groups
  # POST /support_groups.xml
  def create
    @support_group = Irm::SupportGroup.new(params[:irm_support_group])

    respond_to do |format|
      if @support_group.save
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_created))}
        format.xml  { render :xml => @support_group, :status => :created, :location => @support_group }
      else
        @error = @support_group
        format.html { render "new" }
        format.xml  { render :xml => @support_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /support_groups/1
  # PUT /support_groups/1.xml
  def update
    @support_group = Irm::SupportGroup.find(params[:id])

    respond_to do |format|
      if @support_group.update_attributes(params[:irm_support_group])
        format.html { redirect_to({:action=>"index"},:notice => (t :successfully_updated)) }
        format.xml  { head :ok }
      else
        @error = @support_group
        format.html { render "edit" }
        format.xml  { render :xml => @support_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @support_groups= Irm::SupportGroup.multilingual.query_wrap_info(I18n::locale)
    @support_groups,count = paginate(@support_groups)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@support_groups.to_grid_json(['R',:company_name,:organization_name,:group_code,:name,
                                                                  :support_role_name,:vendor_group_flag,
                                                                  :oncall_group_flag,:status_meaning],
                                                                 count))}
    end
  end

  def add_persons
    @support_group_code = params[:support_group_code]
  end

  def get_support_group_member
    @support_group_code = params[:support_group_code]
    @support_group_member= Irm::SupportGroupMember.query_wrap_info(I18n::locale,@support_group_code)
    respond_to do |format|
      format.json {render :json=>@support_group_member.to_dhtmlxgrid_json(['R',:person_name,:company_name,
                                                                           :email_address,:mobile_phone,:status_meaning],
                                                                          @support_group_member.size)}
    end
  end

  def choose_person
     @support_group_code = params[:support_group_code]
     @support_group = Irm::SupportGroup.query_by_support_group_code(@support_group_code)
  end

  def create_member
    person_list = params[:person_choose_list].split(',')
    support_group_code = params[:support_group_code]
    flag = true
    if ((!person_list.blank?) && !(support_group_code.blank?))
      person_list.each do |person_id|
        if Irm::SupportGroupMember.check_person_exists?(support_group_code,person_id)
            @support_group_member = Irm::SupportGroupMember.new(:person_id => person_id,
                                           :support_group_code =>support_group_code )
            if !@support_group_member.save
              flag=false
            end
        end
      end
    end
    if flag
      respond_to do |format|
         flash[:successful_message] = (t :successfully_created)
         format.html { render "irm/common/_successful_message" }
      end
    else
      respond_to do |format|
         format.html { render "irm/common/_successful_message" }
      end
    end
  end

  def delete_member
    id_delete_list = params[:id_delete_list].split(',')
    support_group_code = params[:support_group_code]
    if ((!id_delete_list.blank?) || !(support_group_code.blank?))
      Irm::SupportGroupMember.delete_by_id(id_delete_list)    
      respond_to do |format|
        flash[:successful_message] = (t :successfully_deleted)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      end
    end
  end
end
