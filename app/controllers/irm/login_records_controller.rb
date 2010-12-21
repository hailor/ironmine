class Irm::LoginRecordsController < ApplicationController

  def index

  end
  def get_data
    @login_records = Irm::LoginRecord.query_with_info
    respond_to do |format|
      format.json  {render :json => @login_records.to_dhtmlxgrid_json(['0',:login_name,:full_name,
                                                                     :user_ip,:operate_system,:browser,:login_at,:logout_at,], @login_records.size) }
    end
  end
end
