module Icm::IncidentReportsHelper
  #显示当前模块的报表，其中针对于category_code进行分类，而
  #category目前和模块进行一一对应，而options目前提供两个参数
  #report_limit来表示实现几个报表和report_purpose来表明
  #当前报表的用户，可以为报表和工具，默认为报表
   def show_module_report(category_code,options={})
      report_limit = options[:report_limit]||5
      report_purpose = options[:report_purpose]||'REPORT'
      report_group_codes = Irm::Person.current.hidden_roles.collect{|r| r.report_group_code}
      report_group_codes << Irm::Role.current.report_group_code if Irm::Role.current
      all_reports = Irm::Report.multilingual.query_by_group_codes(report_group_codes).
          query_by_report_purpose(report_purpose).query_by_category_code(category_code).
                                limit(report_limit).query_by_favorite_flag(Irm::Constant::SYS_YES)
      report_module=""
      all_reports.each do |report|
         report_controller = report[:page_controller]||options[:controller]
         report_action = report[:page_action]||options[:controller]
         report_module << content_tag(:li,(link_to report[:name],url_for(:controller=>report_controller,
                                                                         :action=>report_action)))
      end
     report_module
   end

   #根据id和data_provider来构建折线图，其中折线图的
   #数据格式：var myDataValues = [
   #         {category:"5/1/2010", values:9000}];
   def line_chart(id,data_provider,options={})
      width = options[:width]||400
      height = options[:height]||200
      line_div = content_tag(:div, "",:id=>id,
                          :style=>"width:#{width};height:#{height};margin:10px 10px 10px 10px;")
      script = %Q(
         (function() {
              GY.use('charts', function (Y)
              {
                  var myChart = new Y.Chart({
                                dataProvider:#{data_provider},
                                render:"##{id}",
                                horizontalGridlines: {
                                      styles: {
                                          line: {
                                              color: "#dad8c9"
                                          }
                                      }
                                },
                                verticalGridlines: {
                                      styles: {
                                          line: {
                                              color: "#dad8c9"
                                          }
                                      }
                                }
                  });
              });
          })();
      )
      line_div + javascript_tag(script)
   end
end