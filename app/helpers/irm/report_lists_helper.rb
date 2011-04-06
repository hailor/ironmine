module Irm::ReportListsHelper
  
  def show_category_report(role_code,category_code,options={})
     report_list = ""
     report_group_name = Irm::LookupValue.multilingual.query_by_lookup_type("IRM_REPORT_CATEGORY").
                            query_by_lookup_code(category_code).first[:meaning]||options[:report_group_name]
     report_list_folder = (link_to content_tag(:img, "", :src => '/images/s.gif',:class=>"reportClass showListButton",
                                               :child_id=>"#{category_code}".downcase),"javascript:void(0)")  +
         content_tag(:h3,report_group_name)
     report_list_folder = content_tag(:div,report_list_folder.html_safe,:class=>"folderName secondaryPalette")
     report_group_codes = Irm::Person.current.hidden_roles.collect{|r| r.report_group_code}
      report_group_codes << Irm::Role.current.report_group_code if Irm::Role.current
      current_category_reports = Irm::Report.multilingual.query_by_group_codes(report_group_codes).
          query_by_report_purpose("REPORT").query_by_category_code(category_code)
     current_category_reports.each do |report|
       report_list << show_report(report.report_code).html_safe
     end
     report_list = content_tag(:div,report_list.html_safe,:id=>"#{category_code}".downcase,:style=>"display:none")
     report_list_folder << report_list
     report_list_folder = content_tag(:div,report_list_folder.html_safe,:class=>"reportListFolder")
     report_list_folder
  end

          #<div class="reportEntry">
          #  <%= link_to "某时间段所有请求-紧急度",url_for(:controller=>"icm/incident_reports",
          #                                     :action=>"rpt_urgency_summary")%>
          #  <span>&nbsp;&ndash;&nbsp;
          #    <span class="entryDesc">显示某段时间里面所有请求的紧急度比例
          #    </span>
          #  </span>
          #</div>
  #根据report_code来取到report定义的时候，该报表的名称和描述等
  def show_report(report_code,options={})
     report = Irm::Report.query_by_report_code(report_code).multilingual.first
     report_name = report[:name]
     report_description = report[:description]
     if (options[:controller].blank? || options[:action].blank?)
       report_controller = report[:page_controller]
       report_action = report[:page_action]
     else
       report_controller = params[:controller]
       report_action = params[:action]
     end
     report_entry = content_tag(:span, report_description, :class => "entryDesc")
     report_entry = content_tag(:span, ("&nbsp;"*2 +"-"+"&nbsp;"*2+ report_entry.html_safe).html_safe,
                                 :class => "entryDesc")
     report_entry = content_tag(:div,(link_to report_name,url_for(:controller=>report_controller,
                                                                   :action => report_action)).html_safe +
                                  report_entry.html_safe,:class=>"reportEntry")
     report_entry
  end
end
