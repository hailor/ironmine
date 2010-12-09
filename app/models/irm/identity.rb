class Irm::Identity < ActiveRecord::Base
  set_table_name :irm_identities

  attr_accessor :old_password,:password, :password_confirmation

  validates_presence_of :login_name, :full_name, :email ,:if => Proc.new { |identity| !identity.is_a?(Irm::AnonymousIdentity) }
  validates_uniqueness_of :login_name, :if => Proc.new { |identity| !identity.login_name.blank? }
  validates_uniqueness_of :email, :if => Proc.new { |identity| !identity.email.blank? }, :case_sensitive => false
  validates_format_of :login_name, :with => /^[a-z0-9_\-@\.]*$/
  validates_length_of :login_name, :maximum => 30
  validates_format_of :full_name, :with => /^[\w\s\'\-\.]*$/i
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :allow_nil => true
  validates_length_of :email, :maximum => 60, :allow_nil => true
  validates_presence_of :password,:if=> Proc.new{|identity| identity.hashed_password.blank?&&!identity.is_a?(Irm::AnonymousIdentity)}
  validates_confirmation_of :password, :allow_nil => true,:if=> Proc.new{|identity|identity.hashed_password.blank?||!identity.password.blank?}
  validates_length_of :password, :maximum => 30,:minimum=>6,:if=> Proc.new{|identity|!identity.password.blank?}
  attr_accessor :old_password,:password, :password_confirmation

  scope :query_all,lambda{where("#{table_name}.type IS NULL")}

  scope :with_language,lambda{
    joins("LEFT OUTER JOIN #{Irm::Language.view_name} ON #{Irm::Language.view_name}.language_code=#{table_name}.language_code").
    select("#{table_name}.*,#{Irm::Language.view_name}.description language_description").
    where("#{Irm::Language.view_name}.language = ?",I18n.locale)
  }

  def before_save
     #如果password变量值不为空,则修改密码
     self.hashed_password = Irm::Identity.hash_password(self.password) if self.password&&!self.password.blank?
   end

   # 返回人员的全名
   def name
     full_name
   end
   
   #设定当前用户
   def self.current=(identity)
     @current_user = identity
   end

   #取得当前用户
   def self.current
     @current_user ||= Irm::Identity.anonymous
   end

   #返回匿名用户,一个数据库中只有一个匿名用户
   def self.anonymous
     anonymous_identity = Irm::AnonymousIdentity.first
     if anonymous_identity.nil?
       anonymous_identity = Irm::AnonymousIdentity.create(:login_name => 'anonymous', :full_name => '',:email=>"anonymous@email.com",:hashed_password=>"nopassword")
       raise 'Unable to create the anonymous identity.' if anonymous_identity.new_record?
     end
     anonymous_identity
   end

   #判断是否已经登录
   def logged?
     true
   end

   #用户是否激活
   def active?
     true
   end

   # 加密密码
   def self.hash_password(clear_password)
     Digest::SHA1.hexdigest(clear_password || "")
   end

   # 用户登录
   def self.try_to_login(login, password)
     # Make sure no one can sign in with an empty password
     return nil if password.to_s.empty?
     identity = find(:first, :conditions => ["login_name=?", login])
     if identity
       # user is already in local database
       return nil if !identity.active?
       return nil unless Irm::Identity.hash_password(password) == identity.hashed_password
     end

     identity.update_attribute(:last_login_on, Time.now) if identity && !identity.new_record?
     return identity
     rescue => text
     raise text
   end

   # 自动登录
   def self.try_to_autologin(key)
     tokens = Irm::Token.find_all_by_action_and_value('autologin', key)
     # Make sure there's only 1 token that matches the key
     if tokens.size == 1
       token = tokens.first
       if (token.created_on > 7.to_i.day.ago) && token.user && token.user.active?
         token.user.update_attribute(:last_login_on, Time.now)
         token.user
       end
     end
   end

end

class Irm::AnonymousIdentity < Irm::Identity
  self.record_who = false
  def validate_on_create
    # There should be only one AnonymousUser in the database
    errors.add_to_base 'An anonymous identity already exists.' if Irm::AnonymousIdentity.first
  end

  def available_custom_fields
    []
  end

  # Overrides a few properties
  def logged?; false end
  def admin; false end
  def name(*args); ::I18n.t(:label_identity_anonymous) end
  def email; nil end
end
