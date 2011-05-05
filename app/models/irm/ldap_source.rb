require 'net/ldap'
class Irm::LdapSource < ActiveRecord::Base
  set_table_name :irm_ldap_sources

  #多个帐号使用同一个认证源认证
  has_many :ldap_auth_attribute

  validates_presence_of :name, :host, :port, :account,:account_password,:base_dn

  validates_length_of :name, :maximum => 60
  validates_length_of :host, :maximum => 60
  validates_length_of :account, :maximum => 60
  validates_length_of :account_password, :maximum => 60
  validates_length_of :base_dn, :maximum => 255
  validates_uniqueness_of :name,:scope=>:company_id, :if => Proc.new { |i| !i.name.blank? }
  #加入activerecord的通用方法和scope
  query_extend

  def test_auth
    ldap = Net::LDAP.new
    ldap.host = self.host
    ldap.port = self.port
    ldap.authenticate self.account,self.account_password
    if ldap.bind
      "The connection was authenticated successfully"
      return true
    else
     "The connection was authenticated failed"
      return false
    end
  end

  def ldap
    ldap = self.initialize_ldap_con(self.account, self.account_password)
    ldap
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
    ldap = Net::LDAP.new
    ldap.host = self.host
    ldap.port = self.port
    ldap.authenticate self.account,self.account_password
    if ldap.bind
      "The connection was authenticated successfully"
    else
     "The connection was authenticated failed"
    end
  rescue  Net::LDAP::LdapError => text
    return "LdapError: " + text
  end

end
