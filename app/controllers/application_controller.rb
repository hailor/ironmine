class ApplicationController < ActionController::Base
  theme :default
  protect_from_forgery
  helper :all

  # filters
  # user_setup 从session中取得用户,如果session中没有[:user_id]则什么也不做
  # permission_setup 从当前链接中取得当前权限
  # check_if_login_required 检查当前用户是否存在,如果不存在则需要跳转到登陆页面
  # person_setup 根据当前Identity取得当前人员
  # check_permission 检测当前用户的权限,如果无权访问则跳转到用户首页my#page
  # set_localization 设置当前用户语言
  # layout_setup 检查设置窗口的运行模式，wmode,设置页面布局
  before_filter :user_setup
  before_filter :permission_setup
#  before_filter :check_if_login_required
  before_filter :set_localization
  before_filter :layout_setup

  # 设置当前用户，为下步检查用户是否登录做准备
  def user_setup
    #从session中取得当前user
    Irm::Identity.current = find_current_user
  end

  # 返回session中的当前用户,如果没有则返回空
  def find_current_user
    if session[:user_id]
      # existing session
      (Irm::Identity.find(session[:user_id]) rescue nil)
    end
  end

  # 取得当前链接对应的权限
  def permission_setup
    @current_permission = Irm::Permission.position(params[:controller],params[:action]).first
    @product_code = params[:controller].gsub(/\/.*/, "")
  end

  # 检查是否需要登录
  def check_if_login_required
    # 如果用户已经登录,则无需登录,否则转向登录页面
     if Irm::Identity.current.logged?||(@current_permission&&@current_permission.public?)
       return true
     else
        require_login
     end
  end

  # 处理登录，跳转到登录页面
  def require_login
    if !Irm::Identity.current.logged?
      # 如果是get将url存起来就可以,如果是其他方法则需要存一些参数
      if request.get?
        url = url_for(params)
      else
        url = url_for(:controller => params[:controller], :action => params[:action], :id => params[:id], :company_id => params[:company_id])
      end
      #转向登录页面
      respond_to do |format|
        format.html { redirect_to :controller => "irm/common", :action => "login", :back_url => url }
      end
      return false
    end
    true
  end

  #设置当前用户使用的语言
  def set_localization
    lang = nil
    if Irm::Identity.current.logged?
      lang = find_language(Irm::Identity.current.language_code)
    end
    lang = params[:_lang]||lang
    if lang.nil? && request.env['HTTP_ACCEPT_LANGUAGE']
      accept_lang = parse_qvalues(request.env['HTTP_ACCEPT_LANGUAGE']).first.downcase
      if !accept_lang.blank?
        lang = find_language(accept_lang) || find_language(accept_lang.split('-').first)
      end
    end
    set_language_if_valid(lang)
  end




  # 解释浏览器传过来的信息,取得对应的语言
  def parse_qvalues(value)
    tmp = []
    if value
      parts = value.split(/,\s*/)
      parts.each {|part|
        if m = %r{^([^\s,]+?)(?:;\s*q=(\d+(?:\.\d+)?))?$}.match(part)
          val = m[1]
          q = (m[2] or 1).to_f
          tmp.push([val, q])
        end
      }
      tmp = tmp.sort_by{|val, q| -q}
      tmp.collect!{|val, q| val}
    end
    return tmp
  rescue
    nil
  end

  #取得当前可以访问的语言
  def valid_languages
    @@valid_languages ||= Dir.glob(File.join(Rails.root, 'config', 'locales', '*.yml')).collect {|f| File.basename(f).split('.').first}.collect(&:to_sym)
  end

  #取得指定的语言
  def find_language(lang)
    @@languages_lookup = valid_languages.inject({}) {|k, v| k[v.to_s.downcase] = v; k }
    @@languages_lookup[lang.to_s.downcase]
  end
  #设定语言
  def set_language_if_valid(lang)
      if l = find_language(lang)
        ::I18n.locale = l
      end
  end

  #动态设定layout,使用default_layout保存每个controller原有的layout
  class << self
      attr_accessor :default_layout
  end
  def layout_setup
    self.class.default_layout ||= _layout
    if(params[:wmode])
      self.class.layout params[:wmode]
    else
      self.class.layout self.class.default_layout unless self.class.default_layout.eql?(_layout)
    end
  end
end
