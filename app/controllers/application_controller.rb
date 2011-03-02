class ApplicationController < ActionController::Base
  theme :salesforce2
  protect_from_forgery
  helper :all
  #ajax请求不使用layout
#  layout "application"
  layout "application"   
  # filters
  # user_setup 从session中取得用户,如果session中没有[:user_id]则什么也不做
  # permission_setup 从当前链接中取得当前权限
  # check_if_login_required 检查当前用户是否存在,如果不存在则需要跳转到登陆页面
  # person_setup 根据当前Identity取得当前人员
  # check_permission 检测当前用户的权限,如果无权访问则跳转到用户首页my#page
  # set_localization 设置当前用户语言
  # layout_setup 检查设置窗口的运行模式，wmode,设置页面布局
  # menu_setup 设置当前页面对应的菜单数据
  before_filter :user_setup
  before_filter :permission_setup
  before_filter :check_if_login_required
  before_filter :person_setup
  before_filter :check_permission
  before_filter :localization_setup
  before_filter :layout_setup
  before_filter :menu_setup
  before_filter :menu_entry_setup

  # 设置当前用户，为下步检查用户是否登录做准备
  def user_setup
    #从session中取得当前user
    Irm::Identity.current = find_current_user
  end

  # 取得当前链接对应的权限
  def permission_setup
    @current_permission = Irm::Permission.position(params[:controller],params[:action]).first
    @product_code = params[:controller].gsub(/\/.*/, "")
  end

  # 检查是否需要登录
  def check_if_login_required
    # 如果用户已经登录,则无需登录,否则转向登录页面
     if Irm::Identity.current.logged?||params[:format].eql?("xml")||(@current_permission&&@current_permission.publiced?)
       return true
     else
        require_login
     end
  end

  # 设置当前页面访问的人员
  def person_setup
    Irm::Person.current = Irm::Person.query_by_identity(Irm::Identity.current.id).first
  end

  # 检查用户的权限
  def check_permission
    if request.xhr?||(params[:format]||"").downcase.eql?("js")
      true 
    elsif @current_permission&&Irm::Person.current&&@current_permission.enabled?&&!Irm::PermissionChecker.allow_to_permission?(@current_permission)
        flash[:error]=t(:access_denied,:permission=>@current_permission.to_s)
        redirect_to({:controller => 'irm/navigations', :action => 'access_deny'})
    end
  end

  #设置当前用户使用的语言
  def localization_setup
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

  #动态设定layout,使用default_layout保存每个controller原有的layout
  class << self
      attr_accessor :default_layout
  end
  def layout_setup
    self.class.default_layout ||= _layout
    if (params[:wmode])
      self.class.layout params[:wmode]    
    elsif request.xhr?||(params[:format]||"").downcase.eql?("js")
      self.class.layout "xhr"
    else
      self.class.layout self.class.default_layout unless self.class.default_layout.eql?(_layout)
    end
  end

  # 设置当前页面对应的菜单数据
  def menu_setup
    process_menu
  end

  # 设置当前菜单项
  def menu_entry_setup
    permission = Irm::Permission.position(params[:controller],params[:action]).first
    if permission && permission.permission_code
      @current_menu_entry = Irm::MenuEntry.multilingual.query_by_permission_code(permission.permission_code).first
      if !@current_menu_entry
        index_permission = Irm::Permission.position(params[:controller], "index").first

        @current_menu_entry = Irm::MenuEntry.multilingual.query_by_permission_code(index_permission.permission_code).first if index_permission && index_permission.permission_code 
      end
    end
  end
  #===========all controller public method============ 

  # 设置当前用户
  def logged_user=(user)

    if user && user.is_a?(Irm::Identity)
      Irm::Identity.current = user
      session[:user_id] = user.id
    else
      Irm::Identity.current = Irm::Identity.anonymous
      session[:user_id]=nil
    end
  end

  #返回默认的页面
  def redirect_back_or_default(default=nil)
    #解释back_url从中取得参数
    back_url = CGI.unescape(params[:back_url].to_s)
    if !back_url.blank?
      begin
        uri = URI.parse(back_url)
        # do not redirect user to another host or to the login or register page
        if (uri.relative? || (uri.host == request.host)) && !uri.path.match(%r{/(login|account/register)})
          redirect_to(back_url)
          return
       end
      rescue URI::InvalidURIError
        # redirect to default
      end
    end
    if default
      redirect_to default
    else
      redirect_entrance
    end

  end

  # 跳转到系统入口页面
  def redirect_entrance
      entrance = Irm::Person.current.allowed_roles.detect{|r| r[:role_type].eql?("BUSSINESS")&&Irm::MenuManager.role_showable(r[:role_code])}
      entrance ||= Irm::Person.current.allowed_roles.detect{|r| r[:role_type].eql?("SETTING")&&Irm::MenuManager.role_showable(r[:role_code],false)}
      if(entrance)
        url = Irm::MenuManager.role_showable(entrance[:role_code],false)
        redirect_to({:controller => url[:page_controller], :action => url[:page_action]})
      else
        redirect_to({:controller => 'irm/navigations', :action => 'access_deny'})
      end
  end

  #进行分页，返回分页后的scope和scope的记录的总记录数
  def paginate(scoped,offset=nil,limit=nil)
     scoped = data_filter(scoped)
     offset ||= (params[:start]||0).to_i
     limit ||= (params[:count]||25).to_i
     [scoped.offset(offset).limit(limit),scoped.count]
  end
  # 加入jsonp格式
  def to_jsonp(json)
    %Q(#{params[:callback]}(#{json});)    
  end

  # 处理传入的filter
  def data_filter(scoped)
    if(params[:_view_filter_id] && !params[:_view_filter_id].blank?)
      session[:_view_filter_id] = params[:_view_filter_id]
      scoped = scoped.where(Irm::ViewFilter.find(params[:_view_filter_id]).where_clause)
    end
    scoped
  end


  private
  # 返回session中的当前用户,如果没有则返回空
  def find_current_user
    if session[:user_id]
      # existing session
      (Irm::Identity.find(session[:user_id]) rescue nil)
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
        format.xml { render :xml=>Irm::Identity.current,:status=> :unprocessable_entity }
      end
      return false
    end
    true
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

  # 菜单显示使用的常量
  # @menu_permission当前页面上菜单 对应的权限
  def process_menu(permission=nil)
    permission ||= {:page_controller=>params[:controller],:page_action=>params[:action]}
    @menu_permission = permission.dup
    @setting_menus = default_setting_menus
    session[:top_role] = params[:top_role] if params[:top_role]
    @page_menus = Irm::MenuManager.parent_menus_by_permission({:page_controller=>permission[:page_controller],:page_action=>permission[:page_action]},session[:top_role])
    # 如果不是设置类或业务类角色，则只设置业务菜单，不更改layout
    if @page_menus[0].nil?||!Irm::MenuManager.validate_role(@page_menus[0])
      @page_menus = (session[:entrance_menu]||default_menus)[0..1]
      return
    end
    if @page_menus[0]&&Irm::Role.setting_role?(@page_menus[0])
      @setting_menus = @page_menus.dup
      self.class.layout "setting"
      @page_menus = (session[:entrance_menu]||default_menus)[0..1]
      # 保存这一次的菜单路径
      session[:top_role] = @setting_menus[0] if @setting_menus[0]
    else
      session[:entrance_menu] = @page_menus.dup if @page_menus.length>1
      # 保存这一次的菜单路径
      session[:top_role] = @page_menus[0] if @page_menus[0]
    end
  end

  # 默认菜单
  def default_menus
    default_role = Irm::Person.current.allowed_roles.detect{|r| r[:role_type].eql?("BUSSINESS")}
    if default_role
      [default_role[:role_code],default_role[:menu_code]]
    else
      []
    end
  end

  # 默认设置菜单
  def default_setting_menus
    default_setting_role = Irm::Person.current.allowed_roles.detect{|r| r[:role_type].eql?("SETTING")}
    if default_setting_role
      [default_setting_role[:role_code],default_setting_role[:menu_code]]
    else
      []
    end
  end

  def show_date(options={})
     advance = options[:months_advance]||0
     (Time.now.advance(:months => advance)).strftime("%Y-%m-%d").to_s
  end

  def auto_run?(auto_run)
      if auto_run.blank?
         true
      else
         auto_run == Irm::Constant::SYS_YES
      end
    end

   #简单讲hash和数组中的数据转换成图表所需要的数据
    def to_chart_json(chart_data)
      json = %Q([)
      if chart_data.is_a?(Hash)
        chart_data.each do |key,value|
          json << %Q({category:"#{key}",value:#{value}},)
        end
        json.chomp!(",")
      elsif chart_data.is_a?(Array)
        chart_data.each do |elem|
          json << %Q({category:"#{elem[0]}",value:#{elem[1]}},)
        end
        json.chomp!(",")
      end
      json << "]"
      json
    end

    #通用的将图表的数据转换成功chart data
    #TODO
    def general_to_chart_json(chart_data)

    end

end
