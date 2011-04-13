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

   #关键字分析报表
   def rpt_search_history_summary
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
     @company_id = params[:company_id]
     @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
     @timeframes_end_date = params[:timeframes_end_date]||show_date
   end

   #关键字分析报表书籍获取
   def get_search_history_data
      auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
      @company_id = params[:company_id]
      @table_column = "#{Skm::EntryOperateHistory.table_name}.created_at"
      @timeframes_start_date = params[:timeframes_start_date]||show_date(:months_advance=>-1)
      @timeframes_end_date = params[:timeframes_end_date]||show_date
      @entry_history= Skm::EntryOperateHistory.query_history_by_date.
                               equal_value("#{Skm::EntryOperateHistory.table_name}.company_id",@company_id).
                               date_between_value(@table_column,@timeframes_start_date,@timeframes_end_date)
      respond_to do |format|
        format.json {render :json=>to_jsonp(@entry_history.to_grid_json([:search_key,:result_count,:source,:full_name,:created_day],@entry_history.length))}
      end
   end

   #查看历史记录报表
   def rpt_entry_show_history
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
     #@table_column = params[:table_column]||"#{Skm::EntryOperateHistory.table_name}.created_at"
     @company_id = params[:company_id]
     @entry_start_date = params[:entry_start_date]||show_date(:months_advance=>-1)
     @entry_end_date = params[:entry_end_date]||show_date

   end

   #查看历史报表数据获取
   def get_rpt_show_data
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
     @table_column = "enh.created_at"
      @company_id = params[:company_id]
      @entry_start_date = params[:entry_start_date]||show_date(:months_advance=>-1)
      @entry_end_date = params[:entry_end_date]||show_date
      @entry_history= Skm::EntryOperateHistory.get_entry_show_history(I18n.locale).
                               equal_value("#{Skm::EntryOperateHistory.table_name}.company_id",@company_id).
                               date_between_value(@table_column,@entry_start_date,@entry_end_date)
      #@entry_history,count= paginate(@entry_history)

      respond_to do |format|
        format.json {render :json=>to_jsonp(@entry_history.to_grid_json([:entry_title,:version_number,:company_name,:full_name,:created_day,:result_count],@entry_history.length))}
      end
   end

   #事故单应用知识库报表
   def rpt_entry_apply_summary
     auto_run = params[:auto_run]
     if auto_run?(auto_run)
       return
     end
     #@table_column = params[:table_column]||"#{Skm::EntryOperateHistory.table_name}.created_at"
     @company_id = params[:company_id]
     @entry_start_date = params[:entry_start_date]||show_date(:months_advance=>-1)
     @entry_end_date = params[:entry_end_date]||show_date
   end

   #事故单应用知识库数据获取
   def get_rpt_apply_data
      auto_run = params[:auto_run]
      if auto_run?(auto_run)
        return
      end
      @table_column = "enh.created_at"
      @company_id = params[:company_id]
      @entry_start_date = params[:entry_start_date]||show_date(:months_advance=>-1)
      @entry_end_date = params[:entry_end_date]||show_date
      @entry_history= Skm::EntryOperateHistory.get_entry_apply_history(I18n.locale).
                               equal_value("#{Skm::EntryOperateHistory.table_name}.company_id",@company_id).
                               date_between_value(@table_column,@entry_start_date,@entry_end_date)
      #@entry_history,count= paginate(@entry_history)

      respond_to do |format|
        format.json {render :json=>to_jsonp(@entry_history.to_grid_json([:entry_title,:version_number,:company_name,:full_name,:created_day,:result_count],@entry_history.length))}
      end
   end
end






