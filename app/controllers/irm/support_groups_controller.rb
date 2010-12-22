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
    @support_group = Irm::SupportGroup.find(params[:id])

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
        flash[:successful_message] = (t :successfully_created)
        format.html { render "irm/common/_successful_message" }
        format.xml  { render :xml => @support_group, :status => :created, :location => @support_group }
      else
        @error = @support_group
        format.html { render "irm/common/error_message" }
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
        flash[:successful_message] = (t :successfully_updated)
        format.html { render "irm/common/_successful_message" }
        format.xml  { head :ok }
      else
        @error = @support_group
        format.html { render "irm/common/error_message" }
        format.xml  { render :xml => @support_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    @support_groups= Irm::SupportGroup.multilingual.query_wrap_info(I18n::locale)
    respond_to do |format|
      format.json {render :json=>@support_groups.to_dhtmlxgrid_json(['R',:company_name,:organization_name,:group_code,:name,
                                                                  :description,:support_role_name,:vendor_group_flag,
                                                                  :oncall_group_flag,:status_meaning,
                                                                  {:value => 'M', :controller => 'irm/support_groups',
                                                                   :action =>  'multilingual_edit', :id => 'id',
                                                                   :action_type => 'multilingual',:view_port=>'id_support_group_list',
                                                                   :script => ''}],
                                                                 @support_groups.size)}
    end
  end

end
