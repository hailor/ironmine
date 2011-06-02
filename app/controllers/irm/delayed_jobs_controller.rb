class Irm::DelayedJobsController < ApplicationController

  def index

  end

  def item_list

  end

  def item_view

    @item = Irm::DelayedJobRecordItem.find params[:id]

  end

  def get_data
    @record = Irm::DelayedJobRecord.query_wrap_info()
    @record = @record.match_value("#{Irm::DelayedJobRecord.table_name}.run_by",params[:run_by])
    #@record = @record.match_value("#{Irm::DelayedJobRecord.table_name}.name",params[:name])
    @record,count = paginate(@record)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@record.to_grid_json(['R',:id,:run_by,:priority,:delayed_job_id,:run_at, :end_at,:handler,:status], count))}
    end
  end

  def get_item_data
    @record = Irm::DelayedJobRecordItem.query_wrap_info(params[:id])
   # @record = @record.match_value("#{Irm::DelayedJobRecordItem.run_by}.short_name",params[:run_by])
    #@record = @record.match_value("#{Irm::DelayedJobRecord.table_name}.name",params[:name])
    @record,count = paginate(@record)
    respond_to do |format|
      format.json {render :json=>to_jsonp(@record.to_grid_json(['R',:record_at,:attempt,:error_info,:id], count))}
    end
  end
end
