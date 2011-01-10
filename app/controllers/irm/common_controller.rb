class Irm::CommonController < ApplicationController
  layout "common"
  skip_before_filter :check_if_login_required

  def login
    if request.get?
      # 注销用户
      self.logged_user = nil
    else
      password_authentication(session[:session_id])
    end
  end

  # 用户退出系统
  def logout
    logout_successful(session[:session_id])
    reset_session
    redirect_to login_url
  end

  private
  #验证用户登录是否成功
  #成功,则转向用户的默认页面
  #失败,返回原来的页面,并显示登录出错的消息
  def password_authentication(session_id)
    identity = Irm::Identity.try_to_login(params[:username], params[:password])
    if identity.nil?
      #失败
      invalid_credentials
    else
      # 成功
      successful_authentication(identity,session_id)
    end
  end

  #返回用户登录失败的消息
  def invalid_credentials
    flash.now[:error] = t(:notice_account_invalid_creditentials)
  end

  #登录成功则返回到默认页面
  def successful_authentication(user,session_id)
    # Valid user
    self.logged_user = user
    Irm::LoginRecord.create({:identity_id=>user.id,
                             :session_id=>session_id,
                             :user_ip=>request.remote_ip,
                             :user_agent=>request.user_agent,
                             :login_at=>Time.now})
    if(params[:rememberme])
      cookies[:username] = params[:username]
    else
      cookies.delete(:username)
    end
    # generate a key and set cookie if autologin
    #if params[:autologin] && Setting.autologin?
    #  token = Token.create(:user => user, :action => 'autologin')
    #  cookies[:autologin] = { :value => token.value, :expires => 1.year.from_now }
    #end
    #call_hook(:controller_account_success_authentication_after, {:user => user })
    entrance = Irm::MenuManager.menu_showable({:sub_menu_code=>"IRM_ENTRANCE_MENU"})
    redirect_back_or_default :controller => entrance[:page_controller], :action => entrance[:page_action]
  end

  def logout_successful(session_id)
     login_record = Irm::LoginRecord.where(:session_id=>session_id).first
     login_record.update_attributes(:logout_at=>Time.now) if login_record
  end
end
