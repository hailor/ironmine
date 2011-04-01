class Irm::MyInfoController < ApplicationController
  #个人信息显示页面
  def index
    @person = Irm::Person.list_all.with_delegate_approver.with_manager.find(Irm::Person.current.id)
  end

  #个人信息编辑页面
  def edit
    @person = Irm::Person.find(Irm::Person.current.id)
  end
  # 更新个人信息
  def update
    @person = Irm::Person.find(Irm::Person.current.id)

    respond_to do |format|
      if @person.update_attributes(params[:irm_person])
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
    login_records_scope = Irm::LoginRecord.list_all.query_by_person(Irm::Person.current.id)
    login_records,count = paginate(login_records_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(login_records.to_grid_json([:login_name,:user_ip,:operate_system,:browser,:login_at,:logout_at], count))}
    end
  end

  def avatar_crop
    @person = Irm::Person.find(params[:id])
  end

  def avatar_update
    @person = Irm::Person.find(params[:id])
    respond_to do |format|
      if params[:irm_person][:avatar]
        if @person.update_attribute(:avatar, params[:irm_person][:avatar])
          if params[:return_url]
            format.html {redirect_to(params[:return_url])}
            format.xml { head :ok}
          else
            format.html {render "avatar_crop"}
          end
        else
          format.html {render "edit"}
        end
      elsif @person.update_attributes(params[:irm_person])
        if params[:return_url]
          format.html {redirect_to(params[:return_url])}
          format.xml { head :ok}
        else
          format.html {render "index"}
        end
      else
        format.html {render "edit"}
      end
    end
  end
end
