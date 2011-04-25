class Irm::PermissionChecker
  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def self.allow_to_url?(url_options={})
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    if assigned_to_functions&&assigned_to_functions.any?
      public_functions = Irm::MenuManager.public_functions
      return true if assigned_to_functions.detect{|f| public_functions.include?(f)}
      return false unless Irm::Person.current.logged?
      login_functions = Irm::MenuManager.login_functions
      return true if assigned_to_functions.detect{|f| login_functions.include?(f)}
      return Irm::Person.current.allowed_to?(assigned_to_functions)||self.allow_to_report(url_options)
    else
      return self.allow_to_report(url_options)
    end
  end

  def self.public?(url_options={})
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    public_functions = Irm::MenuManager.public_functions
    return true if assigned_to_functions&&assigned_to_functions.detect{|f| public_functions.include?(f)}
    false
  end


  def self.allow_to_function?(function_code)
    function_code = function_code.to_s.upcase
    return true if Irm::MenuManager.public_functions.include?(function_code)
    Irm::Person.current.allowed_to?([function_code])
  end

  private
  def self.allow_to_report(url_options={})
    return false unless Irm::Person.current.logged?
    url_options.symbolize_keys!
    page_controller = url_options[:page_controller]||url_options[:controller]
    page_action = url_options[:page_action]||url_options[:action]
    return false unless Irm::MenuManager.reports.include?(Irm::Permission.url_key(page_controller,page_action))
    assigned_to_report_groups = Irm::ReportGroup.query_by_url(page_controller,page_action).collect{|i| i.group_code}
    return false unless assigned_to_report_groups.any?
    Irm::Person.current.allow_to_report_groups?(assigned_to_report_groups)
  end
end