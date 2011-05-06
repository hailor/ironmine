class Irm::ReportListsController < ApplicationController
  def index
    @report_category = params[:report_category] if params[:report_category]
  end

  def get_data
    category_code = ""
    category_code = params[:report_category] if params[:report_category] && !params[:report_category].blank?

    report_group_codes = Irm::Person.current.hidden_roles.collect{|r| r.report_group_code}
    report_group_codes << Irm::Role.current.report_group_code if Irm::Role.current

    if category_code.blank?
      reports_scope = Irm::Report.multilingual.query_by_group_codes(report_group_codes).
        query_by_report_purpose("REPORT").with_blank_url.with_category(I18n.locale)
    else
      reports_scope = Irm::Report.multilingual.query_by_group_codes(report_group_codes).
          query_by_report_purpose("REPORT").query_by_category_code(category_code).with_blank_url.with_category(I18n.locale)
    end

    reports_scope = reports_scope.match_value("#{Irm::ReportsTl.table_name}.name",params[:name])
    @reports,count = paginate(reports_scope)
    @reports.each do |r|
      r.url = url_for(:controller => r[:page_controller], :action => r[:page_action])
    end
    respond_to do |format|
      format.json {render :json=>to_jsonp(@reports.to_grid_json([:name,:description, :page_controller, :page_action, :url, :category_name],count))}
    end
  end
end