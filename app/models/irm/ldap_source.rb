require 'net/ldap'
class Irm::LdapSource < ActiveRecord::Base
  set_table_name :irm_ldap_sources

  #多个帐号使用同一个认证源认证
  has_many :identities
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

  end

end
