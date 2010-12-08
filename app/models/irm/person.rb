class Irm::Person < ActiveRecord::Base
  set_table_name :irm_people

  belongs_to :identity

  scope :query_by_identity,lambda{|identity|
    where(:identity_id=>identity)
  }

  #取得系统当前登陆人员
  def self.current
    @current_person
  end
  #设置当前人员
  def self.current=(current_person)
    @current_person = current_person
  end

  #权限字符串
  def permissions
    Irm::Permission.enabled.query_by_person(self.id)
  end

  #权限字符串
  def permissions_to_s
    prmissions_s = ""
    #缓存用户权限字符串
    if @permissions_accesses
      return @permissions_accesses
    end
    permissions.each do |p|
      ps = "|#{Irm::Permission.url_key(p[:controller],p[:action])}|"
      prmissions_s<<ps unless prmissions_s.include?(ps)
    end
    @permissions_accesses = prmissions_s
    return prmissions_s
  end

  #用户是否拥有权限
  #1,链接类型如果是public类型,则表示用户可以访问
  #2,链接为login类型,则表示用户需要登录才可能访问,否则不能访问
  #3,链接为servic_center类型,则表示用户需要是service_center的管理员才能访问
  #4,链接为project类型,则表示需要能够访问当前项目,且拥用足够权限才可以访问
  def allow_to?(permission)
    ps = "|#{Irm::Permission.url_key(permission[:controller],permission[:action])}|"
    if permission
      permissions_to_s.include?(ps)||permission.publiced?||permission.logined?
    else
      true
    end
  end
end
