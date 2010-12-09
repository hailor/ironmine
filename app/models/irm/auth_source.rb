require 'net/ldap'
class Irm::AuthSource < ActiveRecord::Base
  set_table_name :irm_auth_sources
  #多个帐号使用同一个认证源认证
  has_many :identities

  validates_presence_of :name, :host, :port, :account,:account_password,:base_dn,:attr_login
  validates_presence_of :attr_firstname,:attr_lastname,:attr_email,:if => Proc.new { |source| Irm::Constant::SYS_YES.eql?(source.onthefly_register_flag) }
  validates_presence_of :attr_email
  validates_length_of :name, :maximum => 60
  validates_length_of :host, :maximum => 60
  validates_length_of :account, :maximum => 60
  validates_length_of :account_password, :maximum => 60
  validates_length_of :base_dn, :maximum => 255
  validates_length_of :attr_login, :maximum => 30
  validates_length_of :attr_firstname, :maximum => 30, :allow_nil => true
  validates_length_of :attr_lastname, :maximum => 30, :allow_nil => true
  validates_length_of :attr_email, :maximum => 60, :allow_nil => true
  validates_uniqueness_of :name,:scope=>:company_id, :if => Proc.new { |i| !i.name.blank? }
  #加入activerecord的通用方法和scope
  query_extend


  # Try to authenticate a user not yet registered against available sources
  def self.try_to_login(login, password)
    Irm::AuthSource.active.query_by_sc(Irm::ServiceCenter.current.id).each do |source|
      begin
        logger.debug "Authenticating '#{login}' against '#{source.name}'" if logger && logger.debug?
        attrs = source.authenticate(login, password)
      rescue => e
        logger.error "Error during authentication: #{e.message}"
        attrs = nil
      end
      return attrs if attrs
    end
    return nil
  end

  def authenticate(login, password)
    return nil if login.blank? || password.blank?
    attrs = nil
    # 取得需要登陆用户的dn
    # 1,使用配置的用户名密码建立连接
    # 2,搜索当前登陆用户在ldap中的dn
    ldap_con = initialize_ldap_con(self.account, self.account_password)
    login_filter = Net::LDAP::Filter.eq( self.attr_login, login )
    object_filter = Net::LDAP::Filter.eq( "objectClass", "*" )
    dn = String.new
    ldap_con.search( :base => self.base_dn,
                     :filter => object_filter & login_filter,
                     # only ask for the DN if on-the-fly registration is disabled
                     :attributes=> (['dn', self.attr_firstname, self.attr_lastname, self.attr_email])) do |entry|
      dn = entry.dn
      attrs = [:first_name => Irm::AuthSource.get_attr(entry, self.attr_firstname),
               :last_name => Irm::AuthSource.get_attr(entry, self.attr_lastname),
               :email_address => Irm::AuthSource.get_attr(entry, self.attr_email),
               :auth_source_id => self.id ]
    end
    return nil if dn.empty?
    logger.debug "DN found for #{login}: #{dn}" if logger && logger.debug?
    #取得登录用户对应的dn后验证密码是否正确
    ldap_con = initialize_ldap_con(dn, password)
    return nil unless ldap_con.bind
    # 返回登陆用户信息
    logger.debug "Authentication successful for '#{login}'" if logger && logger.debug?
    attrs
  rescue  Net::LDAP::LdapError => text
    raise "LdapError: " + text
  end

  def initialize_ldap_con(ldap_user, ldap_password)
    options = { :host => self.host,
                :port => self.port
              }
    options.merge!(:auth => { :method => :simple, :username => ldap_user, :password => ldap_password }) unless ldap_user.blank? && ldap_password.blank?
    Net::LDAP.new options
  end

  # 测试LDAP连接
  def test_connection
    ldap_con = initialize_ldap_con(self.account, self.account_password)
    ldap_con.open{}
  rescue  Net::LDAP::LdapError => text
    raise "LdapError: " + text
  end

  # 是否在第一次登录时将用户添加到本服务中心中
  def onthefly_register?
    Irm::Constant::SYS_YES.eql?(onthefly_register_flag)
  end

  def self.get_attr(entry, attr_name)
    if !attr_name.blank?
      entry[attr_name].is_a?(Array) ? entry[attr_name].first : entry[attr_name]
    end
  end
end
