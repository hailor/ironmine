class Irm::ReportsController < ApplicationController
  # GET /reports
  # GET /reports.xml
  def index
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  {
        @reports = Irm::Report.all
        render :xml => @reports
      }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    #@report = Irm::Report.list_all.status_meaning.query_by_report_purpose(::I18n.locale).find(params[:id])
     @report = Irm::Report.multilingual.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    @report = Irm::Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Irm::Report.multilingual.find(params[:id])
  end

  # POST /reports
  # POST /reports.xml
  def create
    @report = Irm::Report.new(params[:irm_report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to(:action=>"index", :notice => t(:successfully_created)) }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @report = Irm::Report.multilingual.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:irm_report])
        format.html { redirect_to({:action=>"index"},:notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Irm::Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(reports_url) }
      format.xml  { head :ok }
    end
  end

  def multilingual_edit
    @report = Irm::Report.find(params[:id])
  end

  def multilingual_update
    @report = Irm::Report.find(params[:id])
    @report.not_auto_mult=true
    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@report, :notice =>  t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    reports_scope = Irm::Report.list_all.status_meaning
    reports_scope = reports_scope.match_value("#{Irm::ReportsTl.table_name}.name",params[:name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.report_code",params[:report_code])
    reports_scope = reports_scope.match_value("category.meaning",params[:category_name])
    reports_scope = reports_scope.match_value("#{Irm::Report.table_name}.page_controller",params[:page_controller])
    reports,count = paginate(reports_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(reports.to_grid_json([:name,:description,:report_code,:category_name,:page_controller,:page_action,:status_meaning,:status_meaning],count))}
    end
  end

  def report_list

  end
end
