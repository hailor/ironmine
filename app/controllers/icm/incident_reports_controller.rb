class Icm::IncidentReportsController < ApplicationController
   def rpt_urgency_summary
     @company_id = params[:company_id]
     @service_code = params[:service_code]
     @table_column = params[:table_column]||"#{Icm::IncidentRequest.table_name}.created_at"
     @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
     @timeframes_end_date = params[:timeframes_end_date]||show_date
     @incident_requests = Icm::IncidentRequest.query_by_urgency(I18n.locale).
                          equal_value("#{Icm::IncidentRequest.table_name}.company_id",@company_id).
                          equal_value("#{Icm::IncidentRequest.table_name}.service_code",@service_code).
                          date_between_value(@table_column,@timeframes_start_date,@timeframes_end_date)
      chart_hash = Hash.new
      @incident_requests.each do |elem|
         chart_hash.merge!({elem[:urgency_name]=>elem[:urgency_count]})
      end
      @report_result = @incident_requests.to_grid_json([:urgency_name,:urgency_count], 3)
      @data_provider = to_pie_chart_json(chart_hash)
   end
   
   def get_urgency_summary
      report_result = params[:report_result]
      respond_to do |format|
        format.json {render :json=>to_jsonp(report_result)}
      end
   end

   private
    def to_pie_chart_json(chart_data)
      json = %Q([)
      if chart_data.is_a?(Hash)
        chart_data.each do |key,value|
          json << %Q({category:"#{key}",value:#{value}},)
        end
        json.chomp!(",")
      end
      json << "]"
      json
    end
end