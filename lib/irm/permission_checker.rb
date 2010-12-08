class Irm::PermissionChecker
  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def self.allow_to?(url_options={})
    url_options.symbolize_keys!
    permission = Irm::Permission.to_permission(Irm::MenuManager.permission_by_url(url_options[:controller],url_options[:action]))
    if permission&&permission.enabled?&&Irm::Person.current
      Irm::Person.current.allow_to?(permission,project)
    else
      true
    end
  end
end