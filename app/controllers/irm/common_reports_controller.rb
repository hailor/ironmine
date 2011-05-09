class Irm::CommonReportsController < ApplicationController
  layout "application_full"
  def index
  end

  def rpt_person_login_summary
    auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
    @table_column = params[:table_column]||"#{Irm::LoginRecord.table_name}.created_at"
    @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
    @timeframes_end_date = params[:timeframes_end_date]||show_date
    @person_login = Irm::LoginRecord.query_by_day.
                         date_between_value(@table_column,@timeframes_start_date,@timeframes_end_date)
    person_login_array = Array.new
    @person_login.each do |elem|
         person_login_array << [elem[:created_day],elem[:login_count]]
    end
    @report_result = @person_login.to_grid_json([:created_day,:login_count], 3)
    @data_provider = to_chart_json(person_login_array)

  end
end