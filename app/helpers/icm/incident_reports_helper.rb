module Icm::IncidentReportsHelper
   def show_module_report(category_code,options={})
      report_module = ""
      report_limit = options[:report_limit]
      all_reports = Irm::Report.multilingual.query_by_group_and_category("ADMIN_REPORT_GROUP",category_code).
                                limit(report_limit)
      all_reports.each do |report|
         report_permission = Irm::Permission.query_by_permission_code(report[:permission_code]).first
         report_controller = report_permission[:page_controller]||options[:controller]
         report_action = report_permission[:page_action]||options[:controller]
         report_module << content_tag(:li,(link_to report[:name],url_for(:controller=>report_controller,
                                                                         :action=>report_action)))
      end
     report_module
   end
end