class Irm::MyLoginHistoryController < ApplicationController
  def index

  end

  def get_login_data
    login_records_scope = Irm::LoginRecord.list_all.query_by_person(params[:id])
    login_records,count = paginate(login_records_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(login_records.to_grid_json([:login_name,:user_ip,:operate_system,:browser,:login_at,:logout_at], count))}
    end
  end
end