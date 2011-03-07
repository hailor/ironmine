class Irm::ReportGroupsController < ApplicationController
  # GET /report_groups
  # GET /report_groups.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  {
        @report_groups = Irm::ReportGroup.all
        render :xml => @report_groups
      }
    end
  end

  # GET /report_groups/1
  # GET /report_groups/1.xml
  def show
    @report_group = Irm::ReportGroup.multilingual.status_meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report_group }
    end
  end

  # GET /report_groups/new
  # GET /report_groups/new.xml
  def new
    @report_group = Irm::ReportGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report_group }
    end
  end

  # GET /report_groups/1/edit
  def edit
    @report_group = Irm::ReportGroup.multilingual.find(params[:id])
  end

  # POST /report_groups
  # POST /report_groups.xml
  def create
    @report_group = Irm::ReportGroup.new(params[:irm_report_group])

    respond_to do |format|
      if @report_group.save
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @report_group, :status => :created, :location => @report_group }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /report_groups/1
  # PUT /report_groups/1.xml
  def update
    @report_group = Irm::ReportGroup.find(params[:id])

    respond_to do |format|
      if @report_group.update_attributes(params[:irm_report_group])
        format.html { redirect_to(:action=>"index", :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report_group.errors, :status => :unprocessable_entity }
      end
    end
  end


  def multilingual_edit
    @report_group = Irm::ReportGroup.find(params[:id])
  end

  def multilingual_update
    @report_group = Irm::ReportGroup.find(params[:id])
    @report_group.not_auto_mult=true
    respond_to do |format|
      if @report_group.update_attributes(params[:irm_report_group])
        format.html { redirect_to({:action=>"show"}, :notice => 'Report group was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "multilingual_edit" }
        format.xml  { render :xml => @report_group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    report_groups_scope = Irm::ReportGroup.multilingual.status_meaning
    report_groups_scope = report_groups_scope.match_value("#{Irm::ReportGroup.table_name}.group_code",params[:group_code])
    report_groups_scope = report_groups_scope.match_value("#{Irm::ReportGroupsTl.table_name}.name",params[:name])
    report_groups_scope = report_groups_scope.match_value("#{Irm::ReportGroupsTl.table_name}.description",params[:description])
    report_groups,count = paginate(report_groups_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(report_groups.to_grid_json([:group_code,:name,:description,:status_meaning],count))}
    end
  end
end
