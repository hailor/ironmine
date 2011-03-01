class Irm::PermissionChecker
  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def self.allow_to_url?(url_options={})
    puts "=====#{url_options.to_json}"
    url_options.symbolize_keys!
    permission = Irm::Permission.to_permission(Irm::MenuManager.permission_by_url(url_options[:controller]||url_options[:page_controller],url_options[:action]||url_options[:page_action]))
    allow_to_permission?(permission)
  end

  def self.allow_to_permission?(permission)
    permission = Irm::Permission.to_permission(permission) unless permission.is_a?(Irm::Permission)
    if permission&&permission.page_controller&&permission.enabled?&&Irm::Person.current
      menus = Irm::MenuManager.parent_menus_by_permission({:page_controller=>permission.page_controller,
                                                           :page_action=>permission.page_action})
      menus.size>0
    else
      true
    end    
  end
end