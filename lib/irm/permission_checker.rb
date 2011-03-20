class Irm::PermissionChecker
  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def self.allow_to_url?(url_options={})
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    return true if assigned_to_functions.nil?||assigned_to_functions.length>0
    public_functions = Irm::MenuManager.public_functions
    return true if assigned_to_functions.detect{|f| public_functions.include?(f)}
    if(Irm::Person.current.nil?)
      return false
    end
    Irm::Person.current.allowed_to?(assigned_to_functions)
  end

  def self.public?(url_options={})
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    public_functions = Irm::MenuManager.public_functions
    return true if assigned_to_functions&&assigned_to_functions.detect{|f| public_functions.include?(f)}
    false
  end

  def self.allow_to_function?(function_code)
    return true if public_functions.include?(function_code)
    Irm::Person.current.allowed_to?([function_code])
  end
end