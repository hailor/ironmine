class Irm::MyInfoController < ApplicationController
  #个人信息显示页面
  def index
    @identity = Irm::Identity.list_all.query(Irm::Identity.current.id).first
  end

  #个人信息编辑页面
  def edit
    @identity =  Irm::Identity.list_all.query(Irm::Identity.current.id).first
  end
  # 更新个人信息
  def update
    @identity =  Irm::Identity.find(Irm::Identity.current.id)

    respond_to do |format|
      if @identity.update_attributes(params[:irm_identity])
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_updated)) }
      else
        format.html { render "edit" }
      end
    end

  end


  def update_company_access
    if params[:accessable_companies]
      session[:accessable_companies] = params[:accessable_companies].collect{|ac| ac.to_i}
    else
      session[:accessable_companies] = []
    end
    respond_to do |format|
      format.html { redirect_to({:controller=>params[:return_controller],:action=>"index"}, :notice =>t(:successfully_updated)) }
    end
  end

  def get_login_data
    login_records_scope = Irm::LoginRecord.query_with_info.query_by_identity(Irm::Identity.current.id)
    login_records,count = paginate(login_records_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(login_records.to_grid_json([:login_name,:user_ip,:operate_system,:browser,:login_at,:logout_at], count))}
    end
  end

end
