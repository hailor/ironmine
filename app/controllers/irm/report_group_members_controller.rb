class Irm::ReportGroupMembersController < ApplicationController
  # GET /report_group_memebers
  # GET /report_group_memebers.xml
  def index
    redirect_to(:action=>"new")
  end

  # GET /report_group_memebers/new
  # GET /report_group_memebers/new.xml
  def new
    @report_group_member = Irm::ReportGroupMember.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report_group_member }
    end
  end

  # POST /report_group_memebers
  # POST /report_group_memebers.xml
  def create
    @report_group_member = Irm::ReportGroupMember.new(params[:irm_report_group_member])
    added_group = Irm::ReportGroup.find(params[:group_id])
    respond_to do |format|
      if(!@report_group_member.report_code.blank?)
        @report_group_member.report_code.split(",").delete_if{|i| i.blank?}.each do |code|
          Irm::ReportGroupMember.create(:report_code=>code,:group_code=>added_group.group_code)
        end
        format.html { redirect_to({:controller=>"irm/report_groups",:action=>"show",:id=>params[:group_id]}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @report_group_memeber, :status => :created, :location => @report_group_member }
      else
        @report_group_member.errors.add(:report_code,"")
        format.html { render :action => "new" }
        format.xml  { render :xml => @report_group_member.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /report_group_memebers/1
  # DELETE /report_group_memebers/1.xml
  def destroy
    @report_group_memeber = ReportGroupMember.find(params[:id])
    @report_group_memeber.destroy

    respond_to do |format|
      format.html { redirect_to({:controller=>"irm/report_groups",:action=>"show",:id=>params[:group_id]}) }
      format.xml  { head :ok }
    end
  end

  def get_data
    reports_scope = Irm::Report.list_all.query_by_group_id(params[:group_id]).status_meaning
    reports_scope = reports_scope.match_value("#{Irm::ReportsTl.table_name}.name",params[:name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.report_code",params[:report_code])
    reports_scope = reports_scope.match_value("category.meaning",params[:category_name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.page_controller",params[:page_controller])
    reports,count = paginate(reports_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(reports.to_grid_json([:name,:description,:report_code,:category_name,:member_id,:page_controller,:page_action,:status_meaning],count))}
    end
  end

  def get_selectable_data
    reports_scope = Irm::Report.list_all.not_in_group(params[:group_id]).status_meaning
    reports_scope = reports_scope.match_value("#{Irm::ReportsTl.table_name}.name",params[:name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.report_code",params[:report_code])
    reports_scope = reports_scope.match_value("category.meaning",params[:category_name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.page_controller",params[:page_controller])
    reports,count = paginate(reports_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(reports.to_grid_json([:name,:description,:report_code,:category_name,:page_controller,:page_action,:status_meaning],count))}
    end
  end

end
