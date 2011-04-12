class Skm::EntryReportsController < ApplicationController
   def index

   end


   def rpt_entry_submit_summary
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
    @table_column = params[:table_column]||"#{Skm::EntryHeader.table_name}.created_at"
    @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
    @timeframes_end_date = params[:timeframes_end_date]||show_date
    @entry_submit = Skm::EntryHeader.query_by_day.
                         date_between_value(@table_column,@timeframes_start_date,@timeframes_end_date)
    entry_submit_array = Array.new
     
    @entry_submit.each do |elem|
         entry_submit_array << [elem[:created_day],elem[:entry_count]]
    end
    @data_provider = to_chart_json(entry_submit_array)
   end

   def rpt_entry_history_summary
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
     #@table_column = params[:table_column]||"#{Skm::EntryOperateHistory.table_name}.created_at"
     @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
     @timeframes_end_date = params[:timeframes_end_date]||show_date
   end

    def get_report_summary
      auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
      @table_column = "#{Skm::EntryOperateHistory.table_name}.created_at"
      @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
      @timeframes_end_date = params[:timeframes_end_date]||show_date
      @entry_history= Skm::EntryOperateHistory.query_history_by_date.
                               date_between_value(@table_column,@timeframes_start_date,@timeframes_end_date)
      @entry_history,count= paginate(@entry_history)

      respond_to do |format|
        format.json {render :json=>to_jsonp(@entry_history.to_grid_json([:search_key,:result_count,:source,:full_name,:created_day],count))}
      end
   end
end





